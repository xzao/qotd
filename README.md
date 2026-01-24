# qotd

A lightweight, static quote of the day web application that displays a deterministic daily quote from a curated collection.

## Overview

This application presents a single quote to all users on any given day. The quote selection is deterministic, meaning everyone who visits the site on the same calendar day will see the same quote. Users can also request a random quote via the shuffle button.

## Data

Quotes are stored as individual JSON files in `/public/data/quotes/items/`. Each quote includes text, author, optional source, year/date, category, and tags. An index file at `/public/data/quotes/index.json` maintains the ordered list of quote filenames.

## Implementation

On page load, the application calculates the number of days elapsed since January 1, 2024 (the epoch date). This value is used with modulo arithmetic against the total number of available quotes to select which quote to display:

```
daysSinceEpoch = floor((today - epoch) / millisecondsPerDay)
quoteIndex = daysSinceEpoch % totalQuotes
```

This approach ensures that:
- The same quote appears for all users on a given day
- Quotes cycle through the collection in a predictable order
- No server-side processing or database is required

## License

GPL-3.0