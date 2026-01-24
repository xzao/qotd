# qotd

A lightweight, static quote of the day web application that displays a deterministic daily quote from a curated collection.

## Overview

Presents a single quote to all users on any given day.

The quote selection is deterministic, meaning everyone who visits the site on the same calendar day will see the same quote. Users can also request a random quote via the shuffle button.

## Demo

The application is currently deployed and accessible at the following URL.

**Live Site:** [https://qotd.xzao.link/](https://qotd.xzao.link/)

![Screenshot](docs/screenshots/preview-1.png)

> **Note:** The live site may experience intermittent outages during maintenance or updates.

## Implementation

On page load, the application calculates the number of days elapsed since the Unix epoch (January 1, 1970).

This value is used with modulo arithmetic against the total number of available quotes to select which quote to display:

```
daysSinceEpoch = floor((today - epoch) / millisecondsPerDay)
quoteIndex = daysSinceEpoch % totalQuotes
```

This approach ensures that:

- The same quote appears for all users on a given day.
- Quotes cycle in a predictable order.
- No server-side processing or database is required.

## Data

Each quote is stored as an individual JSON file containing the quote text, author, optional source, year/date, category, and tags.

An index file maintains the ordered list of all available quotes.

## Development

This repository is configured to work with devcontainers.

Open the project in a container-enabled environment for the best development experience.

Review the `Makefile` for a complete list of commands intended to be used with this repository.

## License

GPL-3.0