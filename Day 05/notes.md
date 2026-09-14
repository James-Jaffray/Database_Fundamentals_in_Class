---
aliases: [Database Fundamentals - Day 05]
tags: [database-fundamentals, term1]
course: "[[Database Fundamentals]]"
---

# Database Fundamentals — Day 5: Normalization Forms

## Logistics
- 2 homework assignments today

## [[Normalization]]
A set of rules for designing relational databases.
- **Redundant data** — data stored in multiple places unnecessarily

**Normal forms:**
| Form | Removes |
|---|---|
| 1NF — First Normal Form | Repeating groups |
| 2NF — Second Normal Form | Partial dependencies |
| 3NF — Third Normal Form | Transitive dependencies |
| BCNF — Boyce-Codd Normal Form | A revision of 3NF |
| 4NF — Fourth Normal Form | Multi-valued dependencies |
| DKNF — Domain Key Normal Form | Theoretical ultimate form |

### Denormalization
The process of deliberately introducing a rule violation *after* completing a normalized design — a trade-off: accept some redundancy to gain performance or ease of use.
**Reasons:** performance increase, ease of use.

## Normalization Process
0. Identify entities and relationships
1. Create the initial table, e.g.:
   `Employee(Employee ID, Name, Department Number, Dept Name(Project Number, Project Name, Sponsoring Dept Name, Weekly))`
   Then identify the **repeating group** — one or more attributes with multiple values within the view.
2. **Apply 1NF:**
   - A table must contain atomic attributes
   - Cannot contain repeating groups
   - **Fixing violations:**
     1. Remove the repeating group from the original table
     2. Place it in a new table
     3. Duplicate the original table's primary key into the new table as a foreign key
     4. Designate the cardinality of the relationship
     5. Designate a primary key for the new table
     - If a composite attribute exists, replace it with two or more atomic attributes
3. **Apply 2NF:** all non-key attributes must fully depend on the *entire* primary key
4. **Apply 3NF:** (not detailed in class yet)

### Quick Reference
- [ ] **1NF** — atomic attributes only, no repeating groups
- [ ] **2NF** — all non-key attributes fully depend on the entire PK
- [ ] **3NF** — a non-key attribute can't depend on another non-key attribute
