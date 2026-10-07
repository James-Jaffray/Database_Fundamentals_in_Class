---
aliases: [Database Fundamentals - Day 06]
tags: [database-fundamentals, term1]
course: "[[Database Fundamentals]]"
---

# Database Fundamentals — Day 6: Merging

**Today's focus:** recap the normal forms, normalize two Aurora views, and merge them into one design.

## Normal Forms Recap

| Normal Form | Rule | Violation | Fix |
|---|---|---|---|
| 1NF | Atomic attributes, no repeating group | Repeating group | Move to new table, copy PK as FK |
| 2NF | All non-key attributes fully depend on the entire PK | Partial dependency | Move to new table, copy PK part as FK |
| 3NF | No non-key attribute depends on another non-key attribute | Transitive dependency | Move to new table, copy non-key attribute as PK/FK |

See [[Normalization]] for the full picture, and [[Database Fundamentals - Day 05 Normalization Cheat Sheet]] for the step-by-step method.

## The Normalization Process (Whole Design)
1. Collect **views** (subsets of data) from source documents and [[Business Rules]]
2. Apply 1NF, 2NF, 3NF to each view → a schema
3. Repeat for every view
4. **Merge** all schemas into a single logical design — preserving all entities, attributes and relationships

## Aurora Example
Two views: **View 1** = employee & department info; **View 2** = project & assignment info.
Entities: Employee, Department, Project. Employee:Department N:1 · Department:Project 1:N · Employee:Project N:M. Candidate keys: Employee ID, Department Number, Project Number.

### View 1 (same as the Day 5 Employee Workload example)
- 0NF: `Employee(Employee ID, Name, Department Number, Department Name, (Project Number, Project Name, Sponsoring Department Name, Weekly Hours))`
- 1NF: Name → LastName/FirstName; repeating group → `WorksOn` (PK: Employee ID + Project Number)
- 2NF: Project Name and Sponsoring Dept Name depend only on Project Number → `Project` table
- 3NF: Department Name depends on Department Number → `Department` table
- Result: `Employee(Employee ID, LastName, FirstName, Department Number (FK))`, `Department(Department Number, Department Name)`, `WorksOn(Employee ID (FK), Project Number (FK), Weekly Hours)`, `Project(Project Number, Project Name, Sponsoring Department Name)`

### View 2 — Project Details
Rules: a project is developed by one department; a department develops many projects; a project has many employees and an employee can be on many projects; each assignment has weekly hours.
- 0NF: `Project(Project Number, Project Name, Department Number, Department Name, (Employee ID, Last Name, First Name, Weekly Hours))` — PK = **Project Number** (each row describes one project)
- 1NF: repeating group → `Assignment(Project Number (FK), Employee ID, Last Name, First Name, Weekly Hours)`; PK = Project Number + Employee ID
- 2NF: Last Name and First Name depend only on Employee ID → new `Employee` table; Weekly Hours depends on both → stays
- 3NF: Department Name depends on Department Number (a non-key in Project) → new `Department` table
- Result: `Project(Project Number, Project Name, Department Number (FK))`, `Department(Department Number, Department Name)`, `Assignment(Project Number (FK), Employee ID (FK), Weekly Hours)`, `Employee(Employee ID, Last Name, First Name)`

### Comparing the Two Views

| View 1 | View 2 | Same? |
|---|---|---|
| Employee | Employee | Similar — View 1 also has Department Number |
| Department | Department | Same |
| WorksOn | Assignment | Similar — both associative entities (same PK) |
| Project | Project | Similar — View 1 has Sponsoring Department Name, View 2 has Department Number |

## [[Merging Tables|Merging]]
Takes one table of data and merges it into another.

| Scenario | Action |
|---|---|
| Same table name, same PK | Merge attributes |
| Same table name, different PK | Keep separate, rename if needed |
| Different table name, same PK | Merge into one table |
| Different table name, different PK | Keep separate |

### Merging Rules

| Rule | Explanation |
|---|---|
| Tables with the same PK can be merged | Combine attributes from both tables into one |
| All entities must be preserved | Don't lose any tables |
| All attributes must be preserved | Don't lose any columns |
| All relationships must be preserved | Don't lose any connections |

Applied to Aurora: WorksOn and Assignment share a PK (Employee ID + Project Number) so they merge into one associative table; the two Project tables share Project Number and merge; Employee and Department merge on their PKs. Every entity, attribute and relationship from both views must survive.

## Homework
- Quiz on Friday, Sept 18

## To Know
- Merge when tables share a PK; never lose entities, attributes, or relationships
- Normalize each view separately first, then merge

## Reflection
*What was the most surprising insight today?*
