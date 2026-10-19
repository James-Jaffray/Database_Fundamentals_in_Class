---
aliases: [Database Fundamentals - Day 14 Lesson]
tags: [database-fundamentals, term1, lesson, sql, joins, group-by, subqueries, views]
course: "[[Database Fundamentals]]"
day: 14
---

# Counting, Subqueries and Views

**Goal:** the handful of ideas you need to write a multi-query SQL script that combines joins, `GROUP BY` / `HAVING`, "never happened" queries, subqueries and views. Examples all use **The Monthly Desk** tables so you practise the pattern, not the answer. Quick-lookup version: [[Query Patterns Reference]].

Builds on [[Basic SELECT Statements]] and [[Advanced SELECT and Joins]]. Concept: [[SQL Joins]].

## 0. Before Any Query: Read the Tables
Every question is answerable from the `CREATE TABLE` script. For each question, ask:
1. **Which tables hold the columns I need?**
2. **How do they connect?** Find the [[Primary Key]] ↔ [[Foreign Key]] pairs. Those are your `ON` conditions.
3. **Is there a junction table in the middle?** A table with two FKs (like `InvoiceItem` between `Invoice` and `OfficeAddOn`) is how many-to-many data is stored. Its rows are the "events" you count.
4. **Is the value stored, or do I have to calculate it?** Look for the column before you invent math.

Course rules that apply to every query: prefix **every** column with its table alias, **name** every calculated/aggregate column, **no `*`** in the column list (`COUNT(*)` is fine).

## 1. "How Many Per ___" = Join + GROUP BY + COUNT
"For each" means `GROUP BY`. Join the parent to the child, group by the parent, count the child.

```sql
-- How many offices of each type?
SELECT OT.OFFICETYPECODE, OT.OFFICETYPEDESCRIPTION,
       COUNT(O.OFFICENUMBER) AS "Number of Offices"
FROM OFFICETYPE OT
LEFT OUTER JOIN OFFICE O ON OT.OFFICETYPECODE = O.OFFICETYPECODE
GROUP BY OT.OFFICETYPECODE, OT.OFFICETYPEDESCRIPTION;
```

Things to notice:
- **Every non-aggregate column in `SELECT` goes in `GROUP BY`.** Selecting the ID *and* the description means grouping by both.
- **"For all ___" is a hint to use an outer join.** An inner join silently drops parents with no children. A `LEFT OUTER JOIN` keeps them.
- **`COUNT(*)` vs `COUNT(column)`:** with an outer join, a parent with no children still produces one row (child columns `NULL`). `COUNT(*)` counts that row and says **1**. `COUNT(child.pk)` ignores `NULL` and correctly says **0**. See [[NULL Values]].
- Which side is `LEFT`? The table you want **all** rows from, listed before the join.

## 2. "More Than N Times" = HAVING
`WHERE` filters rows *before* grouping. A count only exists *after* grouping, so conditions on it go in `HAVING`.

```sql
-- Add-ons that appear on more than 3 invoice lines
SELECT OAO.ADDONNUMBER, OAO.ADDONDESCRIPTION
FROM OFFICEADDON OAO
INNER JOIN INVOICEITEM II ON OAO.ADDONNUMBER = II.ADDONNUMBER
GROUP BY OAO.ADDONNUMBER, OAO.ADDONDESCRIPTION
HAVING COUNT(*) > 3;
```
- You don't have to `SELECT` the count to filter on it. `HAVING COUNT(*) > 3` works on its own.
- Join to the lookup table to get the **description**, then group by both ID and description.
- Decide what a "time performed/sold" is: one row in the junction table = one time. Count rows, not distinct things, if repeats count.

## 3. "Never Happened" = Rows With No Match
Two classic ways. Both answer "which parent rows have **zero** matching child rows?"

**A. Outer join, then keep the unmatched (`IS NULL`)**
```sql
-- Add-ons that have never been sold
SELECT OAO.ADDONNUMBER, OAO.ADDONDESCRIPTION
FROM OFFICEADDON OAO
LEFT OUTER JOIN INVOICEITEM II ON OAO.ADDONNUMBER = II.ADDONNUMBER
WHERE II.ADDONNUMBER IS NULL;
```
The outer join keeps every add-on; unmatched ones get `NULL` in the child columns; `WHERE ... IS NULL` keeps only those. Always test with `IS NULL`, never `= NULL`.

**B. Subquery with `NOT IN`**
```sql
SELECT OAO.ADDONNUMBER, OAO.ADDONDESCRIPTION
FROM OFFICEADDON OAO
WHERE OAO.ADDONNUMBER NOT IN (SELECT II.ADDONNUMBER FROM INVOICEITEM II);
```
Read it inside-out: the bracketed **subquery** runs first and produces a list of IDs that *do* appear; the outer query keeps the parents that are *not* in that list.

When a question says **"you must use a subquery"**, use B. When it doesn't, either works.

> Gotcha: if the subquery's column can contain `NULL`, `NOT IN` returns nothing at all. FK columns that are `NOT NULL` are safe. If in doubt, add `WHERE column IS NOT NULL` inside the subquery.

## 4. Subqueries in General
A subquery is a `SELECT` in brackets used as a value or a list inside another query.

| Subquery returns | Use it with | Example |
|---|---|---|
| One value | `=`, `>`, `<` | `WHERE O.MONTHLYRENT > (SELECT AVG(MONTHLYRENT) FROM OFFICE)` |
| A list | `IN` / `NOT IN` | `WHERE O.OFFICENUMBER IN (SELECT L.OFFICENUMBER FROM LEASE L)` |

The subquery must be wrapped in brackets and should return exactly the shape the outer condition expects (one column; one value for `=`).

## 5. "The One With the Most" = Count, Then Pick the Top
No aggregate function takes the max of a count in one step, so do it in two. Two approaches:

**A. Sort and take the first row (simple)**
```sql
-- Desk holder with the most leases
SELECT DH.FIRSTNAME, DH.LASTNAME
FROM DESKHOLDER DH
INNER JOIN LEASE L ON DH.DESKHOLDERID = L.DESKHOLDERID
GROUP BY DH.DESKHOLDERID, DH.FIRSTNAME, DH.LASTNAME
ORDER BY COUNT(*) DESC
LIMIT 1;
```
`ORDER BY` can sort by an aggregate that isn't in the `SELECT` list. `LIMIT 1` keeps the top row. Downside: if two people tie, you only see one.

**B. Compare against the max count (handles ties)**
```sql
SELECT DH.FIRSTNAME, DH.LASTNAME
FROM DESKHOLDER DH
INNER JOIN LEASE L ON DH.DESKHOLDERID = L.DESKHOLDERID
GROUP BY DH.DESKHOLDERID, DH.FIRSTNAME, DH.LASTNAME
HAVING COUNT(*) = (
    SELECT MAX(Counts.Total)
    FROM (SELECT COUNT(*) AS Total
          FROM LEASE
          GROUP BY DESKHOLDERID) Counts
);
```
The innermost query counts leases per holder; the middle one takes the biggest count; `HAVING` keeps whoever matches it. A subquery in `FROM` **must have an alias** (`Counts`) in PostgreSQL.

"Includes the same one more than once" just means: count the rows (`COUNT(*)`), don't use `DISTINCT`.

If the "events" are tied to the person through **another table** (e.g. person → booking → booking line), join the whole chain first, then group by the person.

## 6. One Row, Many Tables, Calculated Columns
For "show me everything about record #N":
```sql
SELECT L.LEASENUMBER, L.STARTDATE,
       DH.FIRSTNAME || ' ' || DH.LASTNAME AS "Desk Holder",
       O.OFFICENUMBER
FROM LEASE L
INNER JOIN DESKHOLDER DH ON L.DESKHOLDERID = DH.DESKHOLDERID
INNER JOIN OFFICE O ON L.OFFICENUMBER = O.OFFICENUMBER
WHERE L.LEASENUMBER = 4;
```
- Chain one `INNER JOIN ... ON` per extra table. Same table pulled in via two different FKs (two roles) needs **two different aliases**.
- `||` joins text. Put `' '` between words and `', '` between parts of an address. A blank space or comma is just a string.
- Combined columns need a name: `AS "Full Address"`.
- Check whether Subtotal / GST / Total are **stored columns** or need calculating. If stored, just select them. If you calculate, name them. `NULL` in any part makes a `||` result `NULL`, so know which columns are optional.
- If a column name is the same in two tables, the alias prefix tells the server which one.

## 7. Views = A Saved SELECT
A view stores a query under a name. You then query it like a table.

```sql
CREATE VIEW LeaseSummaryView AS
SELECT L.LEASENUMBER, L.STARTDATE,
       DH.FIRSTNAME || ' ' || DH.LASTNAME AS "Desk Holder Name",
       DH.EMAILADDRESS
FROM LEASE L
INNER JOIN DESKHOLDER DH ON L.DESKHOLDERID = DH.DESKHOLDERID;

SELECT LEASENUMBER, "Desk Holder Name", EMAILADDRESS
FROM LeaseSummaryView
WHERE LEASENUMBER > 10;
```
- `CREATE VIEW name AS <select>;` The select inside is a normal query. Alias every calculated column, because the alias **becomes the view's column name**.
- Querying the view: `FROM view_name`. No join needed; the join is already inside.
- A view contains no copy of the data. It re-runs the query each time.
- Column names created with quoted aliases (`"Desk Holder Name"`) must be quoted the same way when you use them from the view, and are case sensitive.
- Re-running a script that already created the view errors with "already exists". Put `DROP VIEW IF EXISTS name;` above the create (same idea as dropping tables first in [[SQL Table Building]]), or use `CREATE OR REPLACE VIEW`.
- Money comparisons are plain numbers: `WHERE Total > 150.00`.

## 8. Putting a Single Script Together
- One `.sql` file. Number each question with a comment: `-- 1. ...`.
- End **every** statement with `;`
- Create tables and run the inserts first (drop children before parents, create parents first, as in [[SQL Table Building]]). Then the queries. Then the view and the query that uses it, **in that order**, since the view must exist before you select from it.
- Run everything with F5 in the Query Tool, then run each query alone (click inside it, F5) and check the rows make sense.
- Sanity check the results: does a "for all" query show a zero row? Does the "more than N" query have anything surprising? Count a result by hand against the INSERT data.

## Common Mistakes
| Mistake | Why it breaks |
|---|---|
| Inner join when the question says "all" | Parents with 0 children vanish |
| `COUNT(*)` after a `LEFT JOIN` | Counts the `NULL` row as 1 |
| Aggregate in `WHERE` | Counts exist only after grouping, use `HAVING` |
| Selected column missing from `GROUP BY` | Server error |
| `= NULL` | Never true, use `IS NULL` |
| Unaliased `||` or aggregate | Column has no usable name |
| Subquery returning several columns/values for `=` | Error |
| Selecting from the view before creating it | "relation does not exist" |

## Check Yourself
- [ ] Can I say which FK joins each pair of tables before I type `JOIN`?
- [ ] Does each `GROUP BY` list every non-aggregate column I selected?
- [ ] For each "never" or "all" question, did I choose the right join or `NOT IN`?
- [ ] Did I use a subquery everywhere the question demanded one?
- [ ] Is every calculated column named and every column alias-prefixed?
