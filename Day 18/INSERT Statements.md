---
aliases: [Database Fundamentals - Day 18, DML INSERT]
tags: [database-fundamentals, term1, lecture-notes, sql, dml, insert]
course: "[[Database Fundamentals]]"
day: 18
---

# Database Fundamentals — Day 18: INSERT Statements

**Today's focus:** adding rows with `INSERT` (DML): column lists, hard-coded values, subqueries, `DEFAULT`, `NULL`, and several rows in one statement. Concept page: [[SQL INSERT]]. Uses [[Subqueries and UNION|subqueries]] heavily, and the constraints from [[SQL Constraints]] decide what gets rejected.

Examples use the **IQSchool** database (Student, Staff, Position, Payment, Registration, Club, Activity). The in-class demo starter used **The Monthly Desk**.

## What Is DML?
**DML** = Data Manipulation Language: the SQL that works with the data **inside** the tables, not the table structure.

| Command | Does |
|---|---|
| `INSERT` | Adds new rows |
| `UPDATE` | Modifies existing rows |
| `DELETE` | Removes existing rows |

| Category | Does | Examples |
|---|---|---|
| **DDL** (Definition) | Defines structure | `CREATE TABLE`, `ALTER TABLE`, `DROP TABLE`, `CREATE VIEW` |
| **DML** (Manipulation) | Works with the data | `INSERT`, `UPDATE`, `DELETE` |
| **DCL** (Control) | Permissions | `GRANT`, `REVOKE` |

PK and FK constraints are part of DDL (they're in the table definition), but they **enforce rules on every DML command**.

## Syntax
```sql
INSERT [INTO] table_name
    (column_list)
VALUES
    (value, value, ...)      -- or: a SELECT that returns rows
;
```
| Piece | Meaning |
|---|---|
| `[INTO]` | Optional keyword, makes it readable |
| `table_name` | The table receiving the row(s) |
| column list | Which columns get values: comma-delimited, in brackets |
| `VALUES` | Starts the list of values |
| `SELECT` | Alternative to `VALUES`: insert the rows a query returns |

### The column list
- Comma-delimited, in parentheses, and must **match the values list** (one value per column, same order)
- If you leave it out, the database expects a value for **every** column in table-definition order
- **In this course, omitting the column list is not acceptable.** It breaks when the table structure changes

### The values list
One value per column, comma-delimited, same order as the column list. Each value can be:

| Value | Meaning |
|---|---|
| Expression | A constant, variable or calculation |
| `DEFAULT` | Use the column's `DEFAULT` constraint |
| `NULL` | Store `NULL` (the column must allow nulls) |

If a value breaks a constraint (PK, FK, CHECK…) or doesn't fit the datatype, the `INSERT` **fails with an error and the row is not added**.

## Full Column List
```sql
INSERT INTO Staff
    (StaffID, FirstName, LastName, DateHired, DateReleased, PositionID, LoginID)
VALUES
    (25, 'Alex', 'Code', '2024-10-01', NULL, 4, 'acode');
```
Every column is listed, the values are in the same order, and `NULL` goes into `DateReleased`.

Bad version (don't): `INSERT INTO Staff VALUES (30, 'Alex', 'Code', '2024-10-01', NULL, 4, 'acode');`

## Subqueries Inside an INSERT
A subquery in the values list copies or looks up a value:
```sql
INSERT INTO Staff
    (StaffID, FirstName, LastName, DateHired, DateReleased, PositionID, LoginID)
VALUES
    (35, 'Alex', 'Code', '2024-10-01', NULL,
     (SELECT PositionID FROM Staff WHERE FirstName = 'Robert' AND LastName = 'Smith'),
     'acode');
```
- The subquery is in **parentheses** and stands in for one value
- **It must return exactly one value.** More than one row gives `ERROR: more than one row returned by a subquery used as an expression`
- Fix: narrow it with `WHERE`, or reduce it with `MAX` / `MIN`

### Several subqueries in one INSERT
```sql
INSERT INTO Staff
    (StaffID, FirstName, LastName, DateHired, DateReleased, PositionID, LoginID)
VALUES
    ((SELECT MAX(StaffID) + 1 FROM Staff),
     'Sarah', 'Lin', '2025-10-01', NULL,
     (SELECT PositionID FROM Position WHERE PositionDescription = 'Instructor'),
     'slin');
```
First subquery generates the next ID (max + 1), second looks up the PositionID, the rest are hard-coded. This is the most flexible pattern: you look up foreign keys by name instead of memorising IDs.

## DEFAULT
Two ways to use a column's `DEFAULT` constraint:
```sql
-- 1. the DEFAULT keyword (errors if the column has no default)
VALUES (50, 'Alex', 'Code', DEFAULT, NULL, 4, 'acode');

-- 2. leave the column out of the column list (one fewer value)
INSERT INTO Staff (StaffID, FirstName, LastName, DateReleased, PositionID, LoginID)
VALUES (52, 'Alex', 'Code', NULL, 4, 'acode');
```
Leaving the column out is cleaner; both work.

## Multiple Rows in One INSERT
Separate each row's bracketed value list with a comma:
```sql
INSERT INTO Staff
    (StaffID, FirstName, LastName, DateHired, DateReleased, PositionID, LoginID)
VALUES
    (55, 'Maria', 'Lopez', '2025-09-01', NULL, 1, 'mlopez'),
    (60, 'David', 'Kim',   '2025-09-01', NULL, 2, 'dkim'),
    (65, 'Helen', 'Zhou',  '2025-09-15', NULL, 3, 'hzhou');
```
Much faster than one `INSERT` per row.

## Three Ways to Insert
| Method | Use it when |
|---|---|
| **Hard-coded values** | You have the exact data |
| **`INSERT ... SELECT`** (copy from another table) | Many rows come from existing data |
| **Combination** (values + subqueries) | Some values are typed, some are looked up |

### INSERT ... SELECT
No `VALUES` keyword, and you can mix a constant into the `SELECT` list:
```sql
-- put every Edmonton student into the AI club
INSERT INTO Activity (StudentID, ClubID)
SELECT StudentID, 'AI'
FROM Student
WHERE City = 'Edmonton';
```

## Exercise Patterns (IQSchool)
| Question | Pattern |
|---|---|
| Payment for Peter Pan, VISA, $450, Oct 10 2005 | `VALUES (40, '2005-10-10', 450.00, (SELECT PaymentTypeID FROM PaymentType WHERE PaymentTypeDescription = 'VISA'), (SELECT StudentID FROM Student WHERE FirstName = 'Peter' AND LastName = 'Pan'))` |
| Registration for Robert Smith with instructor Tess Agonor | Subqueries for `StudentID` and `StaffID`; the other columns (`'DMIT1514'`, `'2005J'`, mark, `'N'`) are hard-coded |
| Three new clubs in one statement | One `INSERT` with three comma-separated `VALUES` rows |
| New student Helen Grant | Full column list, every value hard-coded: dates as `'2000-09-01'`, money as `1800.00` |
| Edmonton students into club 'AI' | `INSERT ... SELECT StudentID, 'AI' FROM Student WHERE City = 'Edmonton'` |
| Half of Robert Smith's balance as a payment, dated today | Amount = `(SELECT BalanceOwing / 2 FROM Student WHERE ...)`, date = `CURRENT_DATE`, plus subqueries for the IDs |
| Enrol Isaac Newton | **Two statements, in order:** insert the `Student` row first, then the `Registration` row (the FK needs the student to exist). Mark is `NULL` for a new registration |

## Monthly Desk Starter Pattern
Parent first, then children, same order as table building ([[SQL Table Building]]):
1. `OfficeType` (new type 6) → `Office` that uses type 6
2. `ReferralSource` rows → `DeskHolder` that uses a referral code (look it up by description with a subquery)
3. `LeaseType` rows → `Lease` that uses an office, a desk holder and a lease type
4. `Invoice` → `InvoiceItem` rows that use the invoice number and an add-on number (both looked up with subqueries)

## Common Mistakes
| Mistake | What happens |
|---|---|
| Column list and values count don't match | Error |
| Values in the wrong order | Wrong data in wrong columns, **silently** |
| Subquery returns multiple values | `more than one row returned` error |
| `NULL` into a `NOT NULL` column | Constraint violation |
| Duplicate PK value | Unique/PK constraint violation |
| FK value doesn't exist in the parent table | Referential integrity error |
| Wrong datatype (text in a numeric column) | Type mismatch error |
| Child row inserted before its parent | FK error, insert the parent first |

## To Know
- [ ] DML = `INSERT`, `UPDATE`, `DELETE`; DDL defines structure; DCL controls permissions
- [ ] Always write the column list; the values must match it in count and order
- [ ] `DEFAULT` uses the default constraint; `NULL` needs a nullable column
- [ ] A subquery in `VALUES` must return one value
- [ ] Several rows: comma-separated bracketed lists; from another table: `INSERT ... SELECT`
- [ ] Constraints are checked on every insert; a violation rejects the row
- [ ] Parents before children

## Homework
- Insert exercises 1–7 (IQSchool): payment, registration, clubs, new student, club activity, half-balance payment, enrol a new student

## Reflection
*What was the most surprising insight today?*
