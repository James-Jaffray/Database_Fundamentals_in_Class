---
aliases: [Database Fundamentals - Day 12]
tags: [database-fundamentals, term1, sql, select]
course: "[[Database Fundamentals]]"
---

# Database Fundamentals — Day 12: Basic SELECT Statements

**Today's focus:** writing queries with `SELECT` — filtering rows, sorting, aggregates, built-in functions, and `GROUP BY` / `HAVING`.

Function lookup: [[postgresql_functions_reference]]. Table building: [[SQL CREATE TABLE]].

## What Are Queries?
Queries retrieve data from the database. They're flexible in which **columns**, which **rows**, and which **aggregate calculations** they return. Writing accurate queries is a critical skill.

## SELECT Syntax & Clause Order
```sql
SELECT [ALL | DISTINCT] column_list
[FROM table_name [, table_name2 [...]]]
[INNER JOIN | LEFT OUTER JOIN | RIGHT OUTER JOIN]
[WHERE clause]
[GROUP BY clause]
[HAVING clause]
[ORDER BY clause]
```
- You don't need every clause, but the ones you use **must be in this order**
- `HAVING` comes **after** `GROUP BY`, never before

| # | Clause |
|---|---|
| 1 | `SELECT` |
| 2 | `FROM` |
| 3 | `JOIN` |
| 4 | `WHERE` |
| 5 | `GROUP BY` |
| 6 | `HAVING` |
| 7 | `ORDER BY` |

## Selecting Columns
```sql
SELECT FirstName, LastName, City
FROM Student;
```
`FROM` says which table the columns come from.

### Concatenation & Aliases
```sql
SELECT FirstName || ' ' || LastName AS "Student Name", City
FROM Student;
```
- `||` concatenates strings — include `' '` between names or you get one long name
- Calculated columns have **no name** until you give them one
- `AS` is optional, but the name is mandatory. **In this course you must ALWAYS name calculated columns**

### Don't Use `*` in the Column List
`SELECT * FROM Student;` returns everything, but:
- New confidential columns may get exposed
- Programs can crash if the column count changes
- Returns columns you don't need, and it's harder to maintain — you can't tell what's coming back

**Course rule:** list every column explicitly. No asterisk in the column list.

```sql
SELECT StudentID, FirstName, LastName, Gender, StreetAddress,
       City, Province, PostalCode, Birthdate, BalanceOwing
FROM Student;
```

## WHERE — Filtering Rows
Limits the rows returned to those meeting the criteria.
```sql
SELECT StudentID, FirstName, LastName, Gender, StreetAddress,
       City, Province, PostalCode, Birthdate, BalanceOwing
FROM Student
WHERE StudentID = '198933540';
```

### Comparison Operators

| Operator | Meaning |
|---|---|
| `=` | Equal to |
| `<>` or `!=` | Not equal to |
| `<` | Less than |
| `<=` | Less than or equal to |
| `>` | Greater than |
| `>=` | Greater than or equal to |

### AND / OR
- `AND` — **both** conditions must be true
- `OR` — **either** condition must be true
```sql
WHERE City = 'Edmonton' AND Province = 'AB'
WHERE City = 'Edmonton' OR Province = 'AB'
```

### BETWEEN (inclusive)
```sql
WHERE StudentID BETWEEN 198933540 AND 199966250
```
`NOT BETWEEN` = values outside the range.

### IN
```sql
WHERE StudentID IN (198933540, 199912010, 200688700, 200978400)
```
Same as multiple `OR`s. `NOT IN` = everything not in the list.

### LIKE — Pattern Matching

| Wildcard | Meaning |
|---|---|
| `%` | Any character, any number of characters |
| `_` | Any single character |

```sql
WHERE FirstName LIKE 'D%'      -- starts with D
WHERE FirstName LIKE 'Ja_'     -- exactly 3 chars, starts with Ja
WHERE FirstName LIKE 'D_n%'    -- starts with D, 3rd char n
```
- `LIKE` is **case sensitive** in PostgreSQL
- Use `LIKE` with wildcards — with `=`, the `%` is treated as a literal character

### Regular Expressions (`~`)
Tilde `~` for pattern searches over a range of values.
```sql
WHERE FirstName ~ '^[A-J]'              -- starts with A–J
WHERE FirstName ~ '^[A-J][a]'           -- starts A–J, 2nd char is a
WHERE PostalCode ~ '^[T-Z].*[0-3]$'     -- starts T–Z, ends 0–3
```
Anchors: `^` = start of string, `$` = end of string.

## ORDER BY — Sorting
- `ASC` (default) or `DESC`, on one or more columns
```sql
SELECT FirstName "First Name", LastName "Last Name"
FROM Student
ORDER BY LastName DESC;

ORDER BY "First Name" ASC, "Last Name" DESC;
```
Multiple columns: sorts by the first, and ties are broken by the next.

## ALL vs DISTINCT
- `ALL` (default) returns every row; `DISTINCT` returns only unique rows
```sql
SELECT ALL FirstName, Province FROM Student;
SELECT DISTINCT FirstName, Province FROM Student;
```
Inside aggregates, `DISTINCT` counts only unique values.

## Aggregate Functions
Calculate **one value** from many records. Syntax: `aggregate_function_name([ALL | DISTINCT] expression)` — `ALL` is the default. Aggregate columns have no name either → alias them.

| Function | Returns | Works on | NULLs |
|---|---|---|---|
| `AVG(col)` | Average | Numeric only | Ignored |
| `SUM(col)` | Total | Numeric only | Ignored |
| `MIN(col)` | Smallest | Numeric, date, character | Ignored |
| `MAX(col)` | Largest | Numeric, date, character | Ignored |
| `COUNT(col)` | Number of **non-null** values | Any | Ignored |
| `COUNT(*)` | Number of **records** | — | Counted |

```sql
SELECT AVG(Mark) "Average Mark" FROM Registration WHERE CourseID = 'DMIT2015';
SELECT SUM(Amount) "Payment Amount" FROM Payment WHERE StudentID = '200495500';
SELECT MIN(Mark) "Lowest Mark" FROM Registration WHERE CourseID = 'DMIT2015';
SELECT MAX(Mark) "Highest Mark" FROM Registration WHERE CourseID = 'DMIT2015';
SELECT COUNT(DateReleased) "Number of Staff Released" FROM Staff;  -- non-null only
SELECT COUNT(*) "Number of Staff" FROM Staff;                      -- all records
```
`*` is overloaded: in a column list it means "all columns" (avoid); in `COUNT(*)` it means "records". See [[NULL Values]].

## String Functions

| Function | What it does | Example |
|---|---|---|
| `Length(x)` | Number of characters | `WHERE Length(FirstName) = 3` |
| `Left(x, n)` | First `n` characters | `Left(FirstName, 3)` |
| `Right(x, n)` | Last `n` characters | `Right(FirstName, 3)` |
| `Substring(x, start, len)` | `len` chars from position `start` | `Substring(CourseID, 5, 3)` |
| `Reverse(x)` | Backwards | `Reverse(FirstName)` |
| `Upper(x)` / `Lower(x)` | Change case | `Upper(FirstName)` |
| `Ltrim(x)` / `Rtrim(x)` | Remove leading / trailing spaces | `Ltrim(Rtrim('   Hello   '))` |

- `Substring` positions start at **1**, not 0
- Nest `Ltrim(Rtrim(...))` to trim both sides

## Conversion Functions

| Function | What it does | Example |
|---|---|---|
| `Cast(x AS type)` | Convert to another datatype | `Cast(Mark AS Varchar)` |
| `To_Char(x, fmt)` | Value → formatted string | `To_Char(Mark, '999.99')` |
| `To_Date(str, fmt)` | String → date | `To_Date('19 Oct 2026', 'DD Mon YYYY')` |
| `To_Number(str, fmt)` | String → number | `To_Number('1234.56', '9,999.99')` |

## Date Functions
- `Current_Date` — system date · `Current_Time` — system time · `Current_TimeStamp` — both
- `Date_Part('month', Current_Date)` → numeric part of a date
- `To_Char(Current_Date, 'DAY')` → day of week as a string
- Format case matters: `'Day'` → "Monday", `'DAY'` → "MONDAY"

## GROUP BY
Aggregates with **subtotals**. Think of it as **"for each"**.
```sql
-- One average for everything
SELECT AVG(Mark) "Average Mark" FROM Registration;

-- Average for each course
SELECT CourseID, AVG(Mark) "Average Mark"
FROM Registration
GROUP BY CourseID;
```

### The GROUP BY Rule
You can't mix an aggregate column with a non-aggregate column unless you `GROUP BY` **all** the non-aggregate columns.
```sql
-- Wrong
SELECT CourseID, AVG(Mark) "Average Mark" FROM Registration;
-- ERROR: column "registration.courseid" must appear in the GROUP BY clause
--        or be used in an aggregate function

-- Right
SELECT CourseID, AVG(Mark) "Average Mark"
FROM Registration
GROUP BY CourseID;
```

## HAVING
Like `WHERE`, but applied **after** `GROUP BY` / the aggregate.
```sql
-- Wrong: WHERE can't hold an aggregate, and WHERE can't come after GROUP BY
SELECT CourseID, AVG(Mark) "Average Mark"
FROM Registration
WHERE AVG(Mark) > 80       -- ERROR
GROUP BY CourseID;

-- Right
SELECT CourseID, AVG(Mark) "Average Mark"
FROM Registration
GROUP BY CourseID
HAVING AVG(Mark) > 80;

-- SELECT doesn't have to match HAVING
SELECT CourseID
FROM Registration
GROUP BY CourseID
HAVING AVG(Mark) > 80;
```
- `HAVING` is for aggregate conditions only
- No `GROUP BY` in the query → use `WHERE`

## Homework
- 

## To Know
- Clause order is mandatory: `SELECT → FROM → JOIN → WHERE → GROUP BY → HAVING → ORDER BY`
- Always name calculated and aggregate columns (`AS "Name"` or just `"Name"`)
- Never use `*` in a column list — list columns explicitly (`COUNT(*)` is fine)
- `WHERE` filters rows **before** grouping; `HAVING` filters groups **after** aggregates
- Non-aggregate columns in `SELECT` must all be in `GROUP BY`
- Aggregates ignore NULLs, except `COUNT(*)`
- `LIKE` is case sensitive in PostgreSQL; `%` = many characters, `_` = one
- `Substring` counts from 1

## Reflection
*What was the most surprising insight today?*
