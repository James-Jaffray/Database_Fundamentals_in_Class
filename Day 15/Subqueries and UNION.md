---
aliases: [Database Fundamentals - Day 15]
tags: [database-fundamentals, term1, lecture-notes, sql, subqueries, union]
course: "[[Database Fundamentals]]"
day: 15
---

# Database Fundamentals — Day 15: Subqueries and UNION

**Today's focus:** nesting one `SELECT` inside another (subqueries) and stacking the results of several `SELECT`s into one result table (`UNION`). Concept pages: [[SQL Subqueries]], [[SQL UNION]]. Builds on [[Counting, Subqueries and Views]] (the Day 14 lesson used subqueries for "never happened" and "the one with the most") and [[Advanced SELECT and Joins]]. Next: [[Views]].

Examples use the **IQSchool** tables (Student, Staff, Position, Payment). The in-class practice used **The Monthly Desk**.

## What Is a Subquery?
A `SELECT` nested inside another statement. It is a complete query and runs on its own.
- **Inner query** = the subquery. **Outer query** = the `SELECT` around it
- Used in `WHERE` or `HAVING` to supply criteria
- Two kinds: **nested** and **correlated**. This course only assesses nested. (Correlated subqueries and `CROSS JOIN` are in the lesson doc but not assessed)

### How a nested subquery runs
```sql
SELECT FirstName, LastName
FROM Staff
WHERE PositionID = (SELECT PositionID
                    FROM Position
                    WHERE PositionDescription = 'Dean');
```
1. Inner query runs **first** and returns `1` (the PositionID for 'Dean')
2. Outer query runs as if you'd typed `WHERE PositionID = (1)`
3. Result: Hugh Guy

Think of it as a two-step process: look up the value, then use it.

## The `=` Rule
`=` needs exactly **one** value on each side. If the subquery can return several rows:
```sql
SELECT FirstName, LastName
FROM Student
WHERE StudentID = (SELECT StudentID FROM Payment);
-- ERROR: more than one row returned by a subquery used as an expression
```
**Fix:** use `IN`.

## IN and NOT IN
```sql
-- students who have made a payment
SELECT FirstName, LastName
FROM Student
WHERE StudentID IN (SELECT StudentID FROM Payment);

-- students who have NEVER made a payment
SELECT FirstName, LastName
FROM Student
WHERE StudentID NOT IN (SELECT StudentID FROM Payment);
```
- The subquery returns a **list** of IDs; the outer query keeps rows whose ID is (or isn't) in it
- Don't add `DISTINCT` inside the subquery. The lesson says it's actually **slower**, since removing duplicates costs more than it saves
- `NOT IN` returns nothing if the list contains a `NULL` (see [[NULL Values]]). Safe when the column is `NOT NULL`

## ANY / SOME and ALL
`=` and `IN` only do exact matches. For `>`, `<`, `>=`, `<=`, `<>` against a list, use:

| Operator | True when the outer value compares true against… |
|---|---|
| `> ANY (list)` (same as `SOME`) | **at least one** value in the list (so: bigger than the smallest) |
| `> ALL (list)` | **every** value in the list (so: bigger than the largest) |

### City with the most students
```sql
SELECT City
FROM Student
GROUP BY City
HAVING COUNT(StudentID) >= ALL (SELECT COUNT(StudentID)
                                FROM Student
                                GROUP BY City);
```
- Subquery returns the student count for **every** city, e.g. `(1,1,2,1,8,1,1,1)`
- Outer query keeps the city whose count is `>=` all of them, i.e. the highest
- Ties return every tied city (unlike `ORDER BY ... LIMIT 1`)
- The slide shows `= ALL`, but that only works if every city has the same count. The lesson doc uses `>= ALL`, which is the one to write

## Monthly Desk Practice Patterns
| Question shape | Pattern |
|---|---|
| Above the average | `WHERE MonthlyRent > (SELECT AVG(MonthlyRent) FROM Office)` |
| Equal to the highest | `WHERE InvoiceTotal = (SELECT MAX(InvoiceTotal) FROM Invoice)` |
| Look up a code by its description | `WHERE ReferralSourceCode = (SELECT ReferralSourceCode FROM ReferralSource WHERE ReferralSourceDescription = 'Website')` |
| Rows tied to a filtered parent | `WHERE OfficeNumber IN (SELECT OfficeNumber FROM Office WHERE MonthlyRent > 1500)` |
| Has at least one child row | `WHERE DeskHolderID IN (SELECT DeskHolderID FROM Lease)` |
| Never has a child row | `WHERE AddOnNumber NOT IN (SELECT AddOnNumber FROM InvoiceItem)` |

> Gotcha: "invoices for the leases of desk holder ABC123" written with `LeaseNumber = (SELECT LeaseNumber FROM Lease WHERE DeskHolderID = 'ABC123')` only works while that holder has **one** lease. Use `IN` unless you know it returns a single value.

## UNION: Combining Results
`UNION` stacks the rows from several `SELECT`s into one result table.
```sql
SELECT FirstName, LastName FROM Student
UNION
SELECT FirstName, LastName FROM Staff;
```
16 students + 10 staff = 26 rows, but the result is **25**. `UNION` removes duplicate rows. Use `UNION ALL` to keep them (and skip the duplicate check). You can chain as many `SELECT`s as you like.

### UNION rules
| Rule | Breaks like this |
|---|---|
| **Same number of columns** in every query | `ERROR: each UNION query must have the same number of columns` |
| **Compatible datatypes**, column by column | `ERROR: UNION types date and character varying cannot be matched` (`Birthdate` vs `LastName`) |
| **`ORDER BY` only at the very end**, after the last query | Putting it earlier is a syntax error |
| **Column names come from the first query** | Alias in the first `SELECT`, and `ORDER BY` can use that alias |

```sql
SELECT FirstName "First Name", LastName "Last Name"
FROM Student
UNION
SELECT FirstName, LastName
FROM Staff
ORDER BY "Last Name" ASC;
```

### In-class UNION patterns (Monthly Desk)
- Different columns, same job: `SELECT OfficeNumber AS "Office or Lease Number" FROM Office UNION SELECT LeaseNumber FROM Lease`
- Mismatched types (text IDs + numeric lease numbers) need a cast: `SELECT CAST(LeaseNumber AS VARCHAR) FROM Lease`
- `UNION` on the same PK/FK (`Invoice.InvoiceNumber` and `InvoiceItem.InvoiceNumber`) collapses to the unique set, because every invoice number repeats
- Filter each side separately with its own `WHERE`. To drop `NULL` company names: `WHERE CompanyName IS NOT NULL` on that side only
- Pull the year out of two date columns with `TO_CHAR(StartDate, 'YYYY')`. See [[PostgreSQL Functions Reference]]

## Clause Order (with UNION)
1. `SELECT` 2. `FROM` 3. `JOIN` 4. `WHERE` 5. `GROUP BY` 6. `HAVING` — all repeat inside **each** query
7. `UNION` / `UNION ALL` goes **between** queries
8. `ORDER BY` goes only **after the last** query

## To Know
- [ ] A subquery is a full `SELECT` in brackets; inner runs first, outer uses its result
- [ ] `=` takes one value; `IN` / `NOT IN` take a list
- [ ] `ANY` = at least one, `ALL` = every value; pair them with `>`, `<`, `>=`, `<=`, `<>`
- [ ] "Most" with ties: `HAVING COUNT(...) >= ALL (SELECT COUNT(...) ... GROUP BY ...)`
- [ ] `UNION` removes duplicates, `UNION ALL` keeps them
- [ ] `UNION` needs the same column count and compatible types; names come from the first query; `ORDER BY` last

## Homework
- Subquery and UNION practice sets (Monthly Desk): see [[SELECT Practice Questions]]

## Reflection
*What was the most surprising insight today?*
