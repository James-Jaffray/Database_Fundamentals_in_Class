---
aliases: [Database Fundamentals - Day 06]
tags: [database-fundamentals, term1]
course: "[[Database Fundamentals]]"
---

# Database Fundamentals — Day 6: Merging

**Today's focus:** recap the normal forms and merge normalized views into one design.

## Normal Forms Recap

| Normal Form | Rule | Violation | Fix |
|---|---|---|---|
| 1NF | Atomic attributes, no repeating group | Repeating group | Move to new table, copy PK as FK |
| 2NF | All non-key attributes fully depend on the entire PK | Partial dependency | Move to new table, copy PK part as FK |
| 3NF | No non-key attribute depends on another non-key attribute | Transitive dependency | Move to new table, copy non-key attribute as PK/FK |

See [[Normalization]] for the full picture, and [[Database Fundamentals - Day 05 Normalization Cheat Sheet]] for the step-by-step method.

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

## Homework
- Quiz on Friday, Sept 18

## To Know
- Merge when tables share a PK; never lose entities, attributes, or relationships

## Reflection
*What was the most surprising insight today?*
