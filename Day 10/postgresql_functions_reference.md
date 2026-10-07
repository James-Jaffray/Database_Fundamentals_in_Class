# PostgreSQL Functions Reference Sheet

The functions you'll use most, grouped by purpose. Examples use the desk-rental schema (`DESKHOLDER`, `OFFICE`, `LEASE`, `INVOICE`, etc.).

**Learn these first:** `COUNT`, `SUM`, `AVG`, `MIN`/`MAX`, `ROUND`, `CONCAT`/`||`, `UPPER`/`LOWER`, `COALESCE`, `EXTRACT`, `CASE`. They cover most intro assignments.

---

## Aggregates (many rows into one value)

| Function | What it does | Example |
|----------|--------------|---------|
| `COUNT(*)` | Number of rows | `SELECT COUNT(*) FROM LEASE;` |
| `COUNT(col)` | Number of non-NULL values | `COUNT(COMPANYNAME)` |
| `COUNT(DISTINCT col)` | Number of unique values | `COUNT(DISTINCT DESKHOLDERID)` |
| `SUM(col)` | Total | `SUM(INVOICETOTAL)` |
| `AVG(col)` | Average | `AVG(MONTHLYRENT)` |
| `MIN(col)` / `MAX(col)` | Smallest / largest (numbers, text, dates) | `MAX(INVOICEDATE)` |

```sql
-- Several at once
SELECT COUNT(*) AS OFFICECOUNT,
       AVG(MONTHLYRENT) AS AVGRENT,
       MIN(MONTHLYRENT) AS MINRENT,
       MAX(MONTHLYRENT) AS MAXRENT
FROM OFFICE;

-- Per group
SELECT OFFICETYPECODE, AVG(MONTHLYRENT) AS AVGRENT
FROM OFFICE
GROUP BY OFFICETYPECODE;
```

**Rules:**

- Aggregates **ignore NULLs** (except `COUNT(*)`).
- Any non-aggregate column in `SELECT` must also be in `GROUP BY`.
- Aggregates can't go in `WHERE`. Use `HAVING` to filter groups: `GROUP BY x HAVING AVG(y) > 800`.
- To compare rows to an overall average, use a subquery: `WHERE MONTHLYRENT > (SELECT AVG(MONTHLYRENT) FROM OFFICE)`.

---

## Text

| Function | What it does | Example |
|----------|--------------|---------|
| `CONCAT(a, b, ...)` | Join text (skips NULLs) | `CONCAT(FIRSTNAME, ' ', LASTNAME)` |
| `a \|\| b` | Join text (NULL in = NULL out) | `FIRSTNAME \|\| ' ' \|\| LASTNAME` |
| `CONCAT_WS(sep, a, b, ...)` | Join with a separator listed once | `CONCAT_WS(' ', FIRSTNAME, LASTNAME)` |
| `UPPER(x)` / `LOWER(x)` | Change case | `UPPER(LASTNAME)` |
| `INITCAP(x)` | Capitalize Each Word | `INITCAP(LASTNAME)` |
| `LENGTH(x)` | Number of characters | `LENGTH(EMAILADDRESS)` |
| `SUBSTRING(x FROM n FOR len)` | Part of a string | `SUBSTRING(CELLPHONENUMBER FROM 1 FOR 3)` (area code) |
| `LEFT(x, n)` / `RIGHT(x, n)` | First / last `n` characters | `RIGHT(CELLPHONENUMBER, 4)` |
| `TRIM(x)` | Strip leading and trailing spaces | `TRIM(FIRSTNAME)` |
| `REPLACE(x, 'old', 'new')` | Swap text | `REPLACE(COMPANYNAME, 'Inc.', '')` |

**Pattern matching in `WHERE`:**

```sql
WHERE LASTNAME LIKE 'J%'      -- starts with J (case-sensitive)
WHERE LASTNAME ILIKE 'j%'     -- case-insensitive (PostgreSQL only)
WHERE EMAILADDRESS LIKE '%@gmail.com'
```

`%` = any number of characters, `_` = exactly one character.

---

## Numbers

| Function | What it does | Example |
|----------|--------------|---------|
| `ROUND(x, n)` | Round to `n` decimals | `ROUND(AVG(MONTHLYRENT), 2)` |
| `CEIL(x)` / `FLOOR(x)` | Round up / down to whole number | `CEIL(SQUAREFOOTAGE)` |
| `ABS(x)` | Absolute value | `ABS(INVOICETOTAL)` |
| `MOD(x, y)` or `x % y` | Remainder | `MOD(OFFICENUMBER, 2)` |
| `+  -  *  /` | Arithmetic | `MONTHLYRENT * 12 AS ANNUALRENT` |

**Watch out:** dividing two integers in Postgres gives an integer (`7 / 2` = `3`). Cast one side for a decimal result: `7::NUMERIC / 2`.

---

## Dates and Times

| Function | What it does | Example |
|----------|--------------|---------|
| `CURRENT_DATE` | Today's date | `WHERE ENDDATE < CURRENT_DATE` |
| `NOW()` / `CURRENT_TIMESTAMP` | Current date and time | `SELECT NOW();` |
| `EXTRACT(part FROM date)` | Pull out year, month, day, etc. | `EXTRACT(YEAR FROM INVOICEDATE)` |
| `DATE_TRUNC('unit', date)` | Round down to start of month, year, etc. | `DATE_TRUNC('month', INVOICEDATE)` |
| `AGE(date1, date2)` | Interval between two dates | `AGE(ENDDATE, STARTDATE)` |
| `TO_CHAR(date, 'format')` | Format a date as text | `TO_CHAR(INVOICEDATE, 'YYYY-MM-DD')` |
| Date arithmetic | Add or subtract intervals directly | `STARTDATE + INTERVAL '30 days'` |

Common `EXTRACT` parts: `YEAR`, `MONTH`, `DAY`, `DOW` (day of week, 0 = Sunday), `QUARTER`.

Common `TO_CHAR` patterns: `YYYY`, `MM`, `DD`, `Mon` (Jan), `Month` (January), `Day` (Monday), `HH24:MI`.

---

## NULL Handling

| Function | What it does | Example |
|----------|--------------|---------|
| `COALESCE(a, b, ...)` | First non-NULL value | `COALESCE(COMPANYNAME, 'Independent')` |
| `NULLIF(a, b)` | Returns NULL if `a = b` | Avoid divide-by-zero: `x / NULLIF(y, 0)` |
| `IS NULL` / `IS NOT NULL` | Test for NULL (in `WHERE`) | `WHERE COMPANYNAME IS NULL` |

Never use `= NULL`. It never matches anything.

---

## Conditional Logic: CASE

```sql
SELECT OFFICENUMBER,
       CASE
           WHEN MONTHLYRENT < 500 THEN 'Budget'
           WHEN MONTHLYRENT < 900 THEN 'Standard'
           ELSE 'Premium'
       END AS RENTTIER
FROM OFFICE;
```

Conditions are checked top to bottom, and the first match wins. `CASE` is technically an expression, not a function, but it's used constantly.

---

## Type Conversion

```sql
CAST(CELLPHONENUMBER AS BIGINT)       -- standard SQL
CELLPHONENUMBER::BIGINT               -- PostgreSQL shorthand, same thing
TO_CHAR(MONTHLYRENT, 'FM$9,999.00')   -- number to formatted text
TO_DATE('2026-10-03', 'YYYY-MM-DD')   -- text to date
```

Use conversion when a comparison errors with `operator does not exist: character varying = integer`.

---

## Combining Functions

Functions nest. Work from the inside out:

```sql
SELECT
    UPPER(LASTNAME) || ', ' || FIRSTNAME            AS DESKHOLDERNAME,
    ROUND(AVG(L.TOTALLEASECOST), 2)                 AS AVGLEASECOST,
    COALESCE(D.COMPANYNAME, 'Independent')          AS COMPANY
FROM DESKHOLDER D
    INNER JOIN LEASE L ON L.DESKHOLDERID = D.DESKHOLDERID
GROUP BY D.LASTNAME, D.FIRSTNAME, D.COMPANYNAME;
```

---

## Quick Lookup: Question Wording to Function

| Question says... | Use... |
|------------------|--------|
| "how many" | `COUNT` |
| "total" / "sum of" | `SUM` |
| "average" / "mean" | `AVG` |
| "highest" / "lowest" / "most recent" / "earliest" | `MAX` / `MIN` |
| "rounded to..." | `ROUND` |
| "full name" / "as one column" | `CONCAT` or `\|\|` |
| "uppercase" / "lowercase" | `UPPER` / `LOWER` |
| "area code" / "first 3 characters" | `SUBSTRING` or `LEFT` |
| "in the year..." / "in the month of..." | `EXTRACT` |
| "today" / "current" | `CURRENT_DATE` |
| "if no value, show..." | `COALESCE` |
| "label as..." / "categorize" | `CASE` |
| "for each" / "per" | `GROUP BY` |
