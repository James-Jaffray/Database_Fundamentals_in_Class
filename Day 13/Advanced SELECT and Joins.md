---
aliases: [Database Fundamentals - Day 13]
tags: [database-fundamentals, term1, lecture-notes, sql, select, joins]
course: "[[Database Fundamentals]]"
day: 13
---

# Database Fundamentals — Day 13: Advanced SELECT Statements (Joins)

**Today's focus:** getting data out of more than one table with `INNER JOIN` and outer joins. Builds on [[Basic SELECT Statements]]. Concept page: [[SQL Joins]].

## The Problem — Data in Multiple Tables
Staff names live in `Staff`, position descriptions live in `Position`. Naive attempt:
```sql
SELECT Staff.FirstName, Staff.LastName, Position.PositionDescription
FROM Staff, Position;
```
Returns **70 records** — Staff (10) × Position (7). Every staff member gets matched with every position. That's wrong.

**Why:** nothing told the server how the tables relate. Records relate through the [[Primary Key]] / [[Foreign Key]] pair: `Position.PositionID` (PK) ↔ `Staff.PositionID` (FK). Without a join condition the server can't know which rows match (a cross join / Cartesian product).

## INNER JOIN
```sql
SELECT column1, column2, ...
FROM table1
INNER JOIN table2
ON table1.joincolumn = table2.joincolumn;
```
```sql
SELECT Staff.FirstName, Staff.LastName, Position.PositionDescription
FROM Staff
INNER JOIN Position ON Staff.PositionID = Position.PositionID;
```
- `INNER JOIN` = "combine these tables"
- `ON` = "match rows where these columns are equal"
- **Position is the parent (PK), Staff is the child (FK).** An inner join returns only parent records that have at least one matching child.
- Position 7 (Assistant Dean) isn't returned — no staff member holds it.

## Outer Joins
Return **all parent records**, even ones with no matching child (child columns come back `NULL` — see [[NULL Values]]).
```sql
-- Right outer join
SELECT Staff.FirstName, Staff.LastName, Position.PositionDescription
FROM Staff
RIGHT OUTER JOIN Position ON Staff.PositionID = Position.PositionID;

-- Left outer join
SELECT Staff.FirstName, Staff.LastName, Position.PositionDescription
FROM Position
LEFT OUTER JOIN Staff ON Staff.PositionID = Position.PositionID;
```
Both return the same thing: all positions + matching staff.

### LEFT vs RIGHT
| Join | Returns all records from… |
|---|---|
| `LEFT OUTER JOIN` | the **left** table (listed before the join) |
| `RIGHT OUTER JOIN` | the **right** table (listed after the join) |

Convention: the parent table is usually listed on the left, so you'll see more `LEFT OUTER JOIN`s.

### An outer join on the child side is pointless
```sql
SELECT Staff.FirstName, Staff.LastName, Position.PositionDescription
FROM Staff
LEFT OUTER JOIN Position ON Staff.PositionID = Position.PositionID;
```
"All staff and any related positions" — but Staff is the child, so every staff row already has a parent. Same result as an inner join.

### Inner vs outer — Student / Payment
| Query | Result |
|---|---|
| `Student INNER JOIN Payment` | **33** records — only students who made payments |
| `Student LEFT OUTER JOIN Payment` | **42** records — all students, incl. the 9 with no payments (`PaymentDate` is NULL) |

```sql
SELECT Student.FirstName, Student.LastName, Payment.PaymentDate
FROM Student
LEFT OUTER JOIN Payment ON Student.StudentID = Payment.StudentID;
```

## Ambiguous Columns
```sql
SELECT StudentID, Student.FirstName, Student.LastName, Payment.PaymentDate
FROM Student
INNER JOIN Payment ON Student.StudentID = Payment.StudentID;
-- ERROR: column reference "studentid" is ambiguous
```
`StudentID` exists in both tables, so the server doesn't know which one you mean. Fix: prefix it with the table name (`Student.StudentID`).

**Course rule:** in any query with more than one table, prefix **every** column with its table name — even when it isn't ambiguous.

## Joining 3 or More Tables
Chain more `INNER JOIN ... ON ...` clauses:
```sql
SELECT table1.column1, table2.column2
FROM table1
INNER JOIN table2 ON table1.joincolumn = table2.joincolumn
INNER JOIN table3 ON table2.joincolumn = table3.joincolumn
INNER JOIN table4 ON table3.joincolumn = table4.joincolumn;
```
```sql
SELECT Student.FirstName, Student.LastName,
       Payment.PaymentDate, PaymentType.PaymentTypeDescription
FROM Student
INNER JOIN Payment ON Student.StudentID = Payment.StudentID
INNER JOIN PaymentType ON Payment.PaymentTypeID = PaymentType.PaymentTypeID;
```

## To Know
- Listing two tables with a comma and no condition gives rows × rows (10 × 7 = 70) — never do it
- **Inner join** → parent rows that have at least one matching child
- **Outer join** → all parent rows, with child columns `NULL` where nothing matches
- Pick `LEFT`/`RIGHT` by which table you want *all* rows from; parent on the left is the convention
- Outer join from the child side adds nothing (same as inner)
- Prefix every column with its table name when using more than one table (mandatory in this course)
- 3+ tables → keep chaining `INNER JOIN ... ON ...`
- `WHERE`, `GROUP BY`, `HAVING`, `ORDER BY` all still work with joins, in the same [[Basic SELECT Statements|clause order]]

## Reflection
*What was the most surprising insight today?*
