---
aliases: [Database Fundamentals - Day 16]
tags: [database-fundamentals, term1, lecture-notes, sql, views]
course: "[[Database Fundamentals]]"
day: 16
---

# Database Fundamentals — Day 16: Views

**Today's focus:** saving a `SELECT` as a **view**, what views are good for, when you can (and can't) change data through one, and ten view-building exercises on The Monthly Desk. Concept page: [[SQL Views]]. Follows [[Subqueries and UNION]]; the Day 14 lesson [[Counting, Subqueries and Views]] introduced the basic `CREATE VIEW` pattern.

## What Is a View?
A query stored in the database under a name. It behaves like a **virtual table**.
- **No data is stored** in the view. The `SELECT` re-runs every time and the data stays in the original tables
- No real overhead to creating one
- Query it like a table: `SELECT ... FROM view_name`

## Why Use One?
| Use | What it means |
|---|---|
| **Simplify retrieval** | Put the complicated join/aggregate/union in the view once, then run short queries against it (no repeating the join condition) |
| **Hide the table structure** | A layer between the user and the tables. If a table changes, only the view is altered. Example: old rows move to an archive table, so the view becomes `SELECT ... FROM Orders UNION SELECT ... FROM OrdersArchive` and users see no difference |
| **Control access** | Show only some columns to some users (e.g. hide salary) and grant permissions on the view instead of the table |

## Create, Use, Drop
```sql
CREATE [OR REPLACE] VIEW viewname
AS
SELECT ...;
```
```sql
CREATE VIEW StudentCourseView
AS
SELECT Student.FirstName, Student.LastName, Course.CourseID, Course.CourseName
FROM Student
    INNER JOIN Registration ON Student.StudentID = Registration.StudentID
    INNER JOIN Course ON Course.CourseID = Registration.CourseID;

SELECT FirstName, LastName, CourseName
FROM StudentCourseView;
```
```sql
DROP VIEW [IF EXISTS] viewname;
```
- **Name every calculated column.** The alias becomes the view's column name
- Quoted aliases (`"AVERAGE MONTHLY RENT"`) must be quoted the same way when you select from the view
- Put `DROP VIEW IF EXISTS` above each `CREATE VIEW` so the script can be re-run (otherwise "already exists")
- A view can't reference more than 1600 columns
- A typo in a column name inside the view definition fails at **create** time (`column ... does not exist`), and then the later `SELECT` fails with "relation does not exist"

## Changing Data Through a View
A view can be treated like a table (with exceptions). `INSERT`, `UPDATE` and `DELETE` through a view change the underlying table, **as long as**:

| Rule | Details |
|---|---|
| **Single table only** | A view based on more than one table can't be inserted into, updated or deleted from |
| **No grouping or combining** | Not allowed if the view uses `DISTINCT`, `GROUP BY`, `HAVING`, aggregate functions or `UNION` |
| **Table rules still apply** | Constraints on the underlying table (PK, FK, NOT NULL, CHECK) are still enforced |

Multi-table view:
```sql
INSERT INTO StudentCourseView (FirstName, LastName, CourseID, CourseName)
VALUES ('Bob', 'Smith', 'SDEV1201', 'New Database Course');
-- ERROR: cannot insert into view "studentcourseview"
-- Views that do not select from a single table or view are not automatically updatable.
```
`UPDATE` and `DELETE` on it fail the same way ("cannot update view", "cannot delete from view").

Single-table view:
```sql
CREATE VIEW GenericRegistrationInformation
AS
SELECT StudentID, CourseID, Semester
FROM Registration;

INSERT INTO GenericRegistrationInformation (StudentID, CourseID, Semester)
VALUES (200578400, 'DMIT1508', '2005J');          -- succeeds

DELETE FROM GenericRegistrationInformation
WHERE StudentID = 200578400 AND CourseID = 'DMIT1508' AND Semester = '2005J';   -- succeeds
```

## Practice: Monthly Desk Views
Every exercise follows one shape: **view = the join + `GROUP BY` + aggregate; the `SELECT` on top = the `WHERE` / `ORDER BY`.** Because a `HAVING`-style filter on the count/average is applied to the view's alias, it becomes a plain `WHERE` in the outer query.

```sql
DROP VIEW IF EXISTS VW_OfficeTypeRentSummary;

CREATE VIEW VW_OfficeTypeRentSummary AS
SELECT OT.OfficeTypeDescription,
       AVG(O.MonthlyRent) AS "AVERAGE MONTHLY RENT"
FROM OfficeType OT
INNER JOIN Office O ON OT.OfficeTypeCode = O.OfficeTypeCode
GROUP BY OT.OfficeTypeDescription;

SELECT OfficeTypeDescription, "AVERAGE MONTHLY RENT"
FROM VW_OfficeTypeRentSummary;
```

| View | Inside the view | Query on top |
|---|---|---|
| `VW_OfficeTypeRentSummary` | `AVG(MonthlyRent)` per office type (join OfficeType + Office) | all rows |
| `VW_ReferralDeskHolderCount` | `COUNT(DeskHolderID)` per referral source | `WHERE "TOTAL DESK HOLDERS" > 5` |
| `VW_LeaseTypeTotals` | `AVG(TotalLeasePrice)` per lease type | `ORDER BY "AVERAGE LEASE PRICE" DESC` |
| `VW_InvoiceTotals` | `SUM(InvoiceAddOnPrice)` per invoice, from `InvoiceItem` only (no join) | `WHERE ... > 500` |
| `VW_OfficeSquareFootage` | `AVG(SquareFootage)` per office type | `WHERE ... > 300` |
| `VW_LeaseYearSummary` | `TO_CHAR(StartDate, 'YYYY')` and `COUNT(LeaseNumber)`, grouped by that same expression | `ORDER BY "LEASE YEAR"` |
| `VW_AddOnSalesSummary` | `SUM(QuantitySold)` per add-on (join OfficeAddOn + InvoiceItem) | `WHERE ... > 10` |
| `VW_PaidInvoiceSummary` | `AVG(InvoiceTotal)` per `PaidYN` | all rows |
| `VW_DeskHolderLeaseTotals` | `SUM(TotalLeasePrice)` per `DeskHolderID`, from `Lease` only | `WHERE ... > 2000` |
| `VW_OfficeWindowSummary` | `COUNT(OfficeNumber)` per `WindowStatus` | all rows |

Things these exercises drilled:
- **Do you need a join?** Only when the thing you group by (or its description) lives in another table. `Invoice`, `InvoiceItem`, `Lease` and `Office` already hold the grouping column in several of these, so no join
- Group by the **description** (and ID too if you select it), not just the code
- When you group by an expression (`TO_CHAR(StartDate, 'YYYY')`), repeat the same expression in `GROUP BY`
- Check **exact column names** against the `CREATE TABLE` script before writing the view

## To Know
- [ ] A view is a saved `SELECT`; it stores no data
- [ ] Uses: simplify queries, hide table structure, control access
- [ ] `CREATE [OR REPLACE] VIEW name AS SELECT ...;` and `DROP VIEW [IF EXISTS] name;`
- [ ] Name calculated columns; the alias is the view's column name
- [ ] Can modify data through a view only if it's built on **one table** with no `DISTINCT`, `GROUP BY`, `HAVING`, aggregates or `UNION`
- [ ] Create the view before you select from it; drop it first when re-running a script

## Homework
- View practice exercises (10 questions, Monthly Desk)

## Reflection
*What was the most surprising insight today?*
