---
aliases: [Database Fundamentals - Day 05]
tags: [database-fundamentals, term1]
course: "[[Database Fundamentals]]"
---

# Database Fundamentals — Day 5: Normalization Forms

**Today's focus:** learn the normal forms and walk a table from 0NF through 3NF.

## Logistics
- 2 homework assignments today

## [[Normalization]]
A set of rules for designing relational databases.
- **Redundant data** — data stored in multiple places unnecessarily
- Big tables with many columns are hard to understand and increase redundancy and anomalies. Normalization breaks them into **smaller related tables**: easier to understand (one purpose each), less redundancy, safer updates/inserts/deletes.

**Normal forms:**

| Form | Removes |
|---|---|
| 1NF — First Normal Form | Repeating groups |
| 2NF — Second Normal Form | Partial dependencies |
| 3NF — Third Normal Form | Transitive dependencies |
| BCNF — Boyce-Codd Normal Form | A revision of 3NF |
| 4NF — Fourth Normal Form | Multi-valued dependencies |
| DKNF — Domain Key Normal Form | Theoretical ultimate form (not fully defined) |

This course focuses on **1NF, 2NF, 3NF**.

### The Trade-Off
Normalization trades **ease of maintenance** against **performance**. 3NF is the best balance for most applications.

| Positive | Negative |
|---|---|
| Redundancy decreases | Overhead increases |
| Fewer anomalies | Performance can suffer |
| Easier to maintain | More complex queries (joins) |

### [[Denormalization]]
Deliberately introducing a rule violation *after* completing a normalized design — accept some redundancy to gain **performance** (joins are slow) or **ease of use**. (An example comes later with the IQ School database.)

## Before You Start
- **Normal forms are based on keys.** If you pick the wrong [[Primary Key]], normalization won't give a good design.
- **[[Business Rules]] affect design.** Consulting firm example: if clients can be served by many consultants (M:N) you need an Assignment table (PK: ClientId + ConsultantId + StartDate); if each client has one permanent consultant (1:M) you don't. Understand the rules before normalizing.

## Worked Example: Employee Workload View
Rules: an employee works for one department; a department has many employees; a department develops many projects; an employee can be on max 4 projects; a project has many employees; Employee ID, Department Number and Project Number are unique identifiers.

**Step 0 — Entities & relationships:** Employee, Department, Project. Employee:Department N:1, Department:Project 1:N, Employee:Project N:M.

**Step 1 — Initial (0NF) table:** contains *all* data items; underline = PK, `( )` = repeating group.
`Employee(Employee ID, Name, Department Number, Department Name, (Project Number, Project Name, Sponsoring Department Name, Weekly Hours))`
- PK = **Employee ID** (each row describes one employee). Department Number and Project Number can't be the PK — many employees share each.
- **Repeating group** — one or more attributes with multiple values within the view: here the project attributes.

**Step 2 — 1NF** (atomic attributes, no repeating groups)
- Violations: `Name` is composite → LastName, FirstName; project attributes are a repeating group.
- **Fix:** remove the repeating group → new table → copy original PK as FK → set cardinality → pick a PK for the new table. Composite attributes → replace with atomic ones.
- Result: `Employee(Employee ID, LastName, FirstName, Department Number, Department Name)` and `WorksOn(Employee ID (FK), Project Number, Project Name, Sponsoring Department Name, Weekly Hours)`. WorksOn PK = Employee ID + Project Number (neither alone is unique).

**Step 3 — 2NF** (all non-key attributes fully depend on the *entire* PK)
- A 2NF violation can **only** happen with a **composite PK**. A single-attribute PK is automatically 2NF (so Employee is fine; WorksOn must be checked).
- "Fully depends": knowing the key value tells you the non-key value.
- Project Name and Sponsoring Dept Name depend only on Project Number → **partial dependency**. Weekly Hours depends on both → OK.
- **Fix:** remove partially dependent attributes → new table → copy the part of the PK they depend on (becomes an FK in the original) → set cardinality → pick a PK.
- Result: `Project(Project Number, Project Name, Sponsoring Department Name)`; `WorksOn(Employee ID (FK), Project Number (FK), Weekly Hours)` — now an associative entity (M:N became two 1:M).

**Step 4 — 3NF** (a non-key attribute can't depend on another non-key attribute)
- Needs **two or more non-key attributes** to be violated. A non-key depending on another non-key = **transitive dependency**.
- Employee: Department Name depends on Department Number (a non-key) → violation. WorksOn (one non-key) and Project (no dependency between its non-keys) are fine.
- **Fix:** move Department Name to a new table, copy Department Number (becomes the new PK and an FK in Employee).
- **Final 3NF:**
  - `Employee(Employee ID, LastName, FirstName, Department Number (FK))`
  - `Department(Department Number, Department Name)`
  - `WorksOn(Employee ID (FK), Project Number (FK), Weekly Hours)`
  - `Project(Project Number, Project Name, Sponsoring Department Name)`
  - Relationships: Department 1:M Employee · Employee 1:M WorksOn · Project 1:M WorksOn

See [[Database Fundamentals - Day 05 Normalization Cheat Sheet]] for the method sheet.

### Summary of Normal Forms

| Form | Rule | Violation | Fix |
|---|---|---|---|
| 1NF | Atomic attributes, no repeating groups | Repeating group | New table, copy PK as FK |
| 2NF | Non-keys fully depend on entire PK | [[Functional Dependencies\|Partial dependency]] | New table, copy PK part as FK |
| 3NF | No non-key depends on another non-key | [[Functional Dependencies\|Transitive dependency]] | New table, copy non-key as PK/FK |

## Guided Walkthrough — Movie/Actor
`Movie(Movie ID, Movie Title, (Actor ID, Actor Name, Role))`
- **1NF:** repeating group (Actor ID, Actor Name, Role) → `Movie(Movie ID, Movie Title)` + `Cast(Movie ID (FK), Actor ID, Actor Name, Role)`; Cast PK = Movie ID + Actor ID
- **2NF:** Actor Name depends only on Actor ID → new `Actor(Actor ID, Actor Name)`; `Cast(Movie ID (FK), Actor ID (FK), Role)`
- **3NF:** no transitive dependencies (Cast has only one non-key). Done.

## To Know
- 1NF: atomic, no repeating groups. 2NF: full dependency on the whole PK (only matters with composite PKs). 3NF: no transitive dependencies
- Pick the PK carefully and read the business rules first

## Homework
- Two homework assignments (see the Day 05 folder)

## Reflection
*What was the most surprising insight today?*
