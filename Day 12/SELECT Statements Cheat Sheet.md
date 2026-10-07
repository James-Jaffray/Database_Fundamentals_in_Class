---
aliases: [Database Fundamentals - Day 12 SELECT Cheat Sheet]
tags: [database-fundamentals, term1, sql, select, cheat-sheet]
course: "[[Database Fundamentals]]"
---

# SELECT Statements Cheat Sheet

Quick reference for [[Basic SELECT Statements]]. Functions: [[postgresql_functions_reference]].

## Clause Order (mandatory)
```sql
SELECT [ALL | DISTINCT] column_list
FROM table
[JOIN ...]
[WHERE row_condition]
[GROUP BY columns]
[HAVING aggregate_condition]
[ORDER BY columns [ASC | DESC]];
```

## Course Rules
- [ ] Always name calculated/aggregate columns: `AS "Name"`
- [ ] No `*` in the column list — list columns (`COUNT(*)` is fine)
- [ ] Non-aggregate columns in `SELECT` must all be in `GROUP BY`
- [ ] Aggregates go in `HAVING`, never `WHERE`

## Filtering (`WHERE`)

| Need | Syntax |
|---|---|
| Compare | `= <> != < <= > >=` |
| Both / either | `AND` / `OR` |
| Range (inclusive) | `BETWEEN a AND b` · `NOT BETWEEN` |
| List | `IN (a, b, c)` · `NOT IN` |
| Wildcards | `LIKE 'D%'` (`%` = many, `_` = one) — case sensitive |
| Regex | `~ '^[A-J]'` · `^` start, `$` end, `.*` anything |

```sql
FirstName || ' ' || LastName AS "Student Name"   -- concatenate
WHERE FirstName LIKE 'D_n%'
WHERE PostalCode ~ '^[T-Z].*[0-3]$'
```

## Sorting & Uniqueness
```sql
ORDER BY "First Name" ASC, "Last Name" DESC   -- ASC is default
SELECT DISTINCT FirstName, Province FROM Student;
```

## Aggregates

| Function | Returns | NULLs |
|---|---|---|
| `AVG` / `SUM` | Average / total (numeric only) | Ignored |
| `MIN` / `MAX` | Smallest / largest (any type) | Ignored |
| `COUNT(col)` | Non-null values | Ignored |
| `COUNT(*)` | All records | Counted |

## Functions

| Type | Functions |
|---|---|
| String | `Length` `Left(x,n)` `Right(x,n)` `Substring(x,start,len)` `Reverse` `Upper` `Lower` `Ltrim` `Rtrim` |
| Convert | `Cast(x AS type)` `To_Char(x,fmt)` `To_Date(str,fmt)` `To_Number(str,fmt)` |
| Date | `Current_Date` `Current_Time` `Current_TimeStamp` `Date_Part('month', d)` `To_Char(d,'DAY')` |

- `Substring` starts at position **1**
- `'DAY'` → "MONDAY", `'Day'` → "Monday"

## GROUP BY vs HAVING
```sql
SELECT CourseID, AVG(Mark) "Average Mark"   -- "for each" course
FROM Registration
WHERE Mark IS NOT NULL                       -- filters rows first
GROUP BY CourseID
HAVING AVG(Mark) > 80                        -- filters groups after
ORDER BY "Average Mark" DESC;
```

## Common Errors

| Error | Fix |
|---|---|
| `column "x" must appear in the GROUP BY clause or be used in an aggregate function` | Add the column to `GROUP BY` |
| Aggregate in `WHERE` | Move it to `HAVING` |
| `HAVING` before `GROUP BY` | Reorder: `GROUP BY` first |
| `LIKE '%x'` uses `=` | Switch to `LIKE` |
