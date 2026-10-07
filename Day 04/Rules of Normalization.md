---
aliases: [Database Fundamentals - Day 04]
tags: [database-fundamentals, term1]
course: "[[Database Fundamentals]]"
---

# Database Fundamentals — Day 4: Rules of Normalization

**Today's focus:** see why normalization exists — reduce redundancy and avoid update, insert, and delete anomalies.

## Why Normalization?
Key design questions: *how many tables? what data goes in which table?*
- Early designers used **intuition** (group similar items together). Some had great instincts, others produced poor designs — there was no systematic method.
- **Edgar F. Codd** created the **Rules of [[Normalization]]** — a systematic guide to the number of tables and which attributes go where.
- The rules have evolved, but normalization is still the **industry standard** for relational design.

A design is judged on two criteria:
1. Does it minimize **redundant data**?
2. Does it minimize **anomalies**?

## Example: Employee + Department in One Table
Intuitive design: one `EmployeeDepartment` table (SSN, Name, Birthdate, Dept No, Dept Name, Dept Mgr SSN).
- Dept Name and Dept Mgr SSN repeat for every employee in the department (e.g. Research appears in 4 rows) — but the department itself hasn't changed.

**Normalized design:** two tables
- `EMPLOYEE` (SSN, Name, …, Dept No *(FK)*)
- `DEPARTMENT` (Dept No, Dept Name, Dept Mgr SSN)

Redundancy is **reduced, not eliminated** — Dept No still appears in both tables because it's what relates them.

## [[Data Anomalies]]
An **anomaly** is an inconsistency in the stored data. Three types:

| Type | Problem in the one-table design | Normalized fix |
|---|---|---|
| **Update** | Manager info repeated in 4 rows — update 3, forget 1 → inconsistent | Update **one row** in DEPARTMENT |
| **Insert** | To add John Doe you must also enter his dept number, name and manager — typo = bad data. Also can't add a new department until it has an employee (employee SSN is the PK) | Only need the Dept No; departments exist independently |
| **Delete** | Delete the last Marketing employee (Jennifer Wallace) → Marketing disappears entirely | Marketing stays in DEPARTMENT even with no employees |

## What Caused the Problems?
Different kinds of information (employees *and* departments) were combined in one table. Normalization splits them so each can be updated, inserted and deleted **independently**.

## Key Questions for Any Design
1. Does it minimize redundant data?
2. Does it minimize anomalies?
3. Can information be updated safely?
4. Can information be inserted independently?
5. Can information be deleted without losing unrelated information?

## Key Takeaways
- One data table is not necessarily better than two.
- Normalization reduces data redundancy — it doesn't eliminate it. Some repeated info may still exist after normalizing.
- It minimizes the *likelihood* of anomalies — it doesn't mean a database can never contain an error.

## To Know
- Three anomalies: update, insert, delete — and how splitting tables fixes each
- Normalization reduces redundancy; it doesn't eliminate it

## Reflection
*What was the most surprising insight today?*
