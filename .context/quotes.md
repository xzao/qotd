# Quote Management Context

## Purpose

This file provides instructions for adding new quotes to the qotd application. Use this context when processing quotes from various sources and adding them to the system.

## Quote JSON Structure

Each quote is stored as an individual JSON file in `public/data/quotes/items/` with the following structure:

```json
{
  "id": "52",
  "text": "Quote text goes here.",
  "author": "Author Name",
  "source": "Book Title or Source (optional)",
  "year": "YYYY or YYYY-YYYY for lifespan",
  "category": "wisdom",
  "tags": ["tag1", "tag2", "tag3"]
}
```

## Field Guidelines

- **id**: Sequential number as string, increment from the highest existing ID
- **text**: The quote text, properly formatted with correct punctuation
- **author**: Full name of the author
- **source**: Book title, speech name, or work title. Use empty string `""` if unknown
- **year**: 
  - For quotes: Publication year (e.g., `"1999"`)
  - For historical figures: Lifespan (e.g., `"1854-1900"`)
  - Use `"Unknown"` only if absolutely unavailable
- **category**: Always use `"wisdom"` unless specified otherwise
- **tags**: Array of 2-4 relevant lowercase keywords describing the quote's theme

## Filename Convention

Create filenames using this pattern:
```
{author-lastname}-{key-words-from-quote}.json
```

**Examples:**
- `wilde-be-yourself.json`
- `einstein-bicycle-balance.json`
- `shakespeare-rose-smell-sweet.json`
- `king-darkness-light.json`

**Rules:**
- All lowercase
- Hyphens between words
- Author's last name first
- 2-4 keywords from the quote that make it identifiable
- Keep filenames under 50 characters when possible

## Adding a Quote - Process

### Step 1: Create the JSON file

1. Use the template above
2. Fill in all fields with accurate information
3. Choose appropriate tags that describe the quote's theme
4. Save to `public/data/quotes/items/{filename}.json`

### Step 2: Update the index

**File:** `public/data/quotes/index.json`

**Critical Rule:** Avoid author clustering. Quotes from the same author should be spread apart to ensure variety in the daily rotation.

**Strategy:**
1. Identify all existing quotes by the same author in the index
2. Calculate spacing between them (aim for 10-15 positions minimum)
3. Insert the new quote at a position that maintains good spacing

**Example:**

If adding a new Oscar Wilde quote and existing Wilde quotes are at positions 8, 21, 34, 44:
- Best insertion points: 0-5, 12-19, 27-31, 38-42, 50+
- Avoid: 6-10, 19-23, 32-36, 42-46 (too close to existing quotes)

## Example Workflow

**Input:** User provides quote in any format

```
"Be yourself; everyone else is already taken." - Oscar Wilde
```

**Output:**

1. **Create file:** `wilde-be-yourself.json`
```json
{
  "id": "29",
  "text": "Be yourself; everyone else is already taken.",
  "author": "Oscar Wilde",
  "source": "",
  "year": "1854-1900",
  "category": "wisdom",
  "tags": ["authenticity", "individuality", "self"]
}
```

2. **Update index:** Check for existing Wilde quotes, insert with proper spacing

3. **Verify:** Ensure author variety is maintained

## Common Quote Sources

When the user provides quotes from various formats:
- **Books:** Include book title in `source`, use publication year
- **Speeches:** Include speech/event name in `source`
- **Historical figures:** Use lifespan in `year`, leave `source` empty if not from specific work
- **Unknown source:** Use `""` for source, still try to determine year/lifespan

## Tags Suggestions

Choose descriptive, thematic tags:
- **Life/existence:** life, existence, purpose, meaning
- **Wisdom/knowledge:** wisdom, knowledge, learning, understanding
- **Character traits:** courage, authenticity, humility, perseverance
- **Relationships:** friendship, love, empathy, acceptance
- **Abstract concepts:** time, hope, change, truth, beauty
- **Emotions:** fear, joy, hope, peace

Keep tags broad enough to be reusable across multiple quotes.
