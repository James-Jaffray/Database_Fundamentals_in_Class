---
aliases: [Database Fundamentals - Day 09 Reference Sheet]
tags: [database-fundamentals, term1, sql, cheat-sheet]
course: "[[Database Fundamentals]]"
---

# Day 9 Reference Sheet — CREATE TABLE Basics

Quick reference for [[SQL CREATE TABLE]]. Class notes: [[Database Fundamentals - Day 09 SQL Practice]]. Full definitions (incl. keys and constraints): [[Database Fundamentals - SQL Definitions Reference]].

## Checklist
- [ ] pgAdmin connected and working
- [ ] Created a table with datatypes and Not Null / Null
- [ ] Built all nine Monthly Desk tables
- [ ] Created an index on a column
- [ ] Dropped an index

## Syntax
```sql
Create Table TableName
(
    ColumnName  datatype,
    ColumnName  datatype  not null,
    ColumnName  datatype  null
);

Drop Table If Exists TableName;

Create Index IX_Table_Column On Table (Column);
Drop Index IX_Table_Column;
```

## Datatypes
See [[SQL Data Types]].

| Type | Use it for | Example |
|---|---|---|
| `integer` | A whole number | `42` |
| `decimal (p, s)` | Money / precise number: `p` total digits, `s` after the decimal | `decimal (6,2)` → 1234.56 |
| `varchar (n)` | Text up to `n` characters | `varchar (50)` |
| `char (n)` | Text that's always exactly `n` characters — codes, short fixed values | `char (1)` for a Y/N flag |
| `date` | A calendar date, no time | `2026-09-26` |
| `timestamp` | A date and a time | `2026-09-26 14:30:00` |

## Rules
- [ ] Every column needs a datatype — no exceptions
- [ ] Every column line **except the last** ends with a comma
- [ ] Every statement ends with a semicolon
- [ ] `Not Null` = required; `Null` (or leaving the word off) = optional
- [ ] Null test: *could a real row legitimately not have this value yet?* If yes → `Null`. See [[NULL Values]]
- [ ] Type everything by hand — don't copy-paste

## Common Errors

| Error | What it means | Fix |
|---|---|---|
| `syntax error at or near ","` | A missing column, or one comma too many | Look at the line just before the error |
| `relation "X" already exists` | Table wasn't dropped first | Add `Drop Table If Exists X;` before `Create Table` |
| `column "Y" does not exist` | Typo in a column name | Check spelling and capitalization |
| `null value in column violates not-null constraint` | A Not Null column got no value on insert | Provide a value for that column |
| `permission denied` | Connected as the wrong user | Reconnect as the correct database user |

## Not Covered Yet
[[Primary Key]], [[Foreign Key]], composite keys, Default, Check, Unique, Alter Table — covered next, see [[SQL Constraints]].
