---
aliases: [Database Fundamentals - Day 14 Reference Sheet]
tags: [database-fundamentals, term1, reference-sheet, sql, joins, group-by, subqueries, views]
course: "[[Database Fundamentals]]"
day: 14
---

# Query Patterns Reference

Full explanation: [[Counting, Subqueries and Views]] · Basics: [[SELECT Reference Sheet]] · Functions: [[PostgreSQL Functions Reference]]

## Course Rules
- [ ] Prefix **every** column with its table alias when 2+ tables
- [ ] Name every calculated / aggregate column: `AS "Name"`
- [ ] No `*` in the column list (`COUNT(*)` is fine)
- [ ] Non-aggregate `SELECT` columns all go in `GROUP BY`
- [ ] Aggregate conditions go in `HAVING`, not `WHERE`
- [ ] End every statement with `;`

## Clause Order
`SELECT → FROM → JOIN → WHERE → GROUP BY → HAVING → ORDER BY → LIMIT`

## Pick the Pattern

| Question wording | Pattern |
|---|---|
| "how many ___ per / for each / in each ___" | Join + `GROUP BY` + `COUNT` |
| "for **all** ___" (include ones with none) | `LEFT OUTER JOIN` from the parent + `COUNT(child.pk)` |
| "more than N" / "at least N" | `HAVING COUNT(*) > N` |
| "never" / "no ___" / "without" | `LEFT JOIN ... WHERE child.pk IS NULL` **or** `NOT IN (subquery)` |
| "must use a subquery" | `NOT IN` / `IN` / `= (SELECT ...)` |
| "highest" / "most" | `ORDER BY COUNT(*) DESC LIMIT 1` **or** `HAVING COUNT(*) = (SELECT MAX ...)` |
| "for record #N, show ..." | Chain `INNER JOIN`s + `WHERE pk = N` |
| "as one column" | `a \|\| ' ' \|\| b AS "Name"` |
| "create a view" | `CREATE VIEW name AS SELECT ...;` |
| "using the view" | `SELECT ... FROM view_name WHERE ...;` |

## Join Skeletons
```sql
-- inner: parents that have children
FROM parent P
INNER JOIN child C ON P.pk = C.fk

-- outer: ALL parents (child cols NULL if none)
FROM parent P
LEFT OUTER JOIN child C ON P.pk = C.fk

-- 3+ tables: keep chaining
FROM a
INNER JOIN b ON a.pk = b.fk
INNER JOIN c ON b.pk = c.fk
```
- `LEFT` = keep all of the table **before** the join, `RIGHT` = the one **after**
- Same table twice via different FKs → two different aliases
- Many-to-many goes through the junction table (two FKs): join through it

## Count Per Group
```sql
SELECT P.pk, P.description, COUNT(C.pk) AS "Total"
FROM parent P
LEFT OUTER JOIN child C ON P.pk = C.fk
GROUP BY P.pk, P.description;
```

| Function | Counts | After `LEFT JOIN` |
|---|---|---|
| `COUNT(*)` | all rows | counts the `NULL` row as **1** |
| `COUNT(C.pk)` | non-NULL values | gives **0** for no match |
| `COUNT(DISTINCT x)` | unique values | |

## HAVING
```sql
SELECT P.pk, P.description
FROM parent P
INNER JOIN child C ON P.pk = C.fk
GROUP BY P.pk, P.description
HAVING COUNT(*) > 3;
```

## Never / No Match
```sql
-- A: outer join + IS NULL
SELECT P.pk, P.description
FROM parent P
LEFT OUTER JOIN child C ON P.pk = C.fk
WHERE C.fk IS NULL;

-- B: subquery
SELECT P.pk, P.description
FROM parent P
WHERE P.pk NOT IN (SELECT C.fk FROM child C);
```
- `IS NULL`, never `= NULL`
- `NOT IN` returns nothing if the subquery list contains a `NULL`

## Subqueries

| Returns | Use with |
|---|---|
| One value | `= < > <= >=`: `WHERE x > (SELECT AVG(x) FROM t)` |
| List | `IN`, `NOT IN` |
| Table | `FROM (SELECT ...) alias` ← alias required |

## Top / Highest Count
```sql
-- simple (one row, ties lost)
... GROUP BY P.pk, P.name
ORDER BY COUNT(*) DESC
LIMIT 1;

-- ties kept
... GROUP BY P.pk, P.name
HAVING COUNT(*) = (SELECT MAX(T.n)
                   FROM (SELECT COUNT(*) AS n FROM child GROUP BY fk) T);
```

## Concatenation
```sql
P.first || ' ' || P.last                       AS "Full Name"
A.street || ', ' || A.city || ', ' || A.prov   AS "Full Address"
```
- Text separators go in quotes: `' '`, `', '`
- Any `NULL` part makes the whole result `NULL`

## Views
```sql
DROP VIEW IF EXISTS MyView;                 -- so the script can re-run
CREATE VIEW MyView AS
SELECT T.id, T.first || ' ' || T.last AS "Full Name", T.email
FROM thing T;

SELECT id, "Full Name", email
FROM MyView
WHERE id > 5;
```
- Alias in the view → column name of the view (keep the same quotes when selecting)
- Create the view **before** any query that uses it
- A view stores the query, not the data

## Script Skeleton
```
1. DROP tables (children first) → CREATE tables (parents first) → INSERTs
2. -- 1.  query ;
   -- 2.  query ;
   ...
3. DROP VIEW IF EXISTS ... ; CREATE VIEW ... ;
4. query using the view ;
```

## Common Errors

| Error | Fix |
|---|---|
| `must appear in the GROUP BY clause or be used in an aggregate` | Add the column to `GROUP BY` |
| `aggregate functions are not allowed in WHERE` | Move to `HAVING` |
| `column reference "x" is ambiguous` | Prefix with the table alias |
| `subquery in FROM must have an alias` | Add a name after the closing bracket |
| `more than one row returned by a subquery used as an expression` | Use `IN`, or make the subquery return one value |
| `relation "x" does not exist` | Create it first / check spelling / order |
| `relation "x" already exists` | `DROP ... IF EXISTS` first |
| Zero-count rows missing | `INNER` → `LEFT OUTER` join, `COUNT(child.pk)` |
