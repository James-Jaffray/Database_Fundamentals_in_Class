---
aliases: [Database Fundamentals - Day 02]
tags: [database-fundamentals, term1]
course: "[[Database Fundamentals]]"
---

# Database Fundamentals — Day 2: Database Foundations

**Today's focus:** understand what databases and DBMSs are, the four language categories, and how to start designing a database.

## Logistics
- Homework: practice quiz — do it

## Why Databases? (Spreadsheets Aren't Enough)
For small, similar data a spreadsheet is fine. It breaks down as data grows (10 → 1,000 → 1,000,000 rows):

| Problem | Why it hurts |
|---|---|
| Size | A little data grows into a lot |
| Updating | Many people editing at once |
| Accuracy | Nothing stops bad data being entered |
| Security | No control over who sees what |
| Redundancy | Same data in many places → maintenance problems |
| Importance | For many businesses the data *is* the business |

**Redundancy example:** Joan Adams stored in Sales.xlsx, Shipping.xlsx and Support.xlsx — Support has a different phone number. Which one is right? Better: store it in **one** place.

A good database lets data **grow**, stay **accurate** (rules/constraints), stay **consistent** (no unnecessary duplication), stay **secure**, and stay **accessible**.

## Data vs. Information
- **Data** — raw, unorganized facts or figures, no context (e.g. `13, 15, 18`)
- **Information** — the processed and organized form of data, with context (e.g. "the last three days' temperatures were 13°, 15° and 18°")
- **Data + Context = Information** (`42` is data; "42 students are enrolled" is information)

## Relational Databases
A [[Relational Database]] stores data in **tables**:
- **Table** — information about one subject (a collection of related records)
- **Row** — one record (one customer)
- **Column** — one type of information / an [[Attribute]]

"Relational" means tables are connected: an ORDER row carries a Customer # that tells you which CUSTOMER placed it.

## Database vs. DBMS
See [[Database vs DBMS]] for the full breakdown.
- You don't talk to the database directly — you send requests to the DBMS, which does the work.
- **Database** — stores the data, plus the rules
- **DBMS** — manages and provides access to the database (the software you interact with)

**Example DBMS:**
- PostgreSQL — open source, powerful
- SQLite — lightweight, embedded
- Oracle — enterprise, large scale
- SQL Server — Microsoft-specific

**⚠ Quiz alert:**
![[Pasted image 20260904140143.png]]

### Database Language Categories
- **DDL** (Data Definition Language) — defines the database structure (metadata)
- **DML** (Data Manipulation Language) — creates and manipulates data
- **DCL** (Data Control Language) — controls access and security
- **Query Language** — retrieves data from the database

![[Pasted image 20260904140433.png]]

## Design Process
What to figure out:
- Purpose
- What needs to be stored
- What functions the DB will support

How to find this out:
- Talk to users
- Review source documents

[[Business Rules]] — statements that define or constrain some aspect of the business (restrictions that need to be enforced). Examples: a grade must be 0–100; an order must have at least one item.

![[Pasted image 20260904140741.png]]

## Entities and Attributes
An [[Entity]] (entity type/class) is what we're storing information about.

![[Pasted image 20260904140938.png]]

An [[Attribute]] is a characteristic of an entity.

![[Pasted image 20260904141028.png]]

Entities are related to each other.

## Entity-Relationship Diagram (ERD)
An [[Entity-Relationship Model|ERD]] is a visual representation of the entities. It shows:
- Entities — the things we store information about
- Attributes — the characteristics we store
- Relationships — how entities are connected
- [[Cardinality]] — how many instances can participate

![[Pasted image 20260904141224.png]]

[[Normalization]] — guidelines for the logical design of a relational database: how many tables, which attributes go where. Main goal: reduce unnecessary redundancy and prevent inconsistencies and anomalies (update / insert / delete). Covered properly from [[Database Fundamentals - Day 04]].
![[Pasted image 20260904141341.png]]

## Glossary

| Term | Definition |
|---|---|
| Database | Organized collection of data |
| DBMS | Software to manage databases |
| Table | Collection of related records |
| Row | One record |
| Column | One piece of information |
| Entity | Thing we store information about |
| Attribute | Characteristic of an entity |
| Relationship | Connection between entities |

## To Know
- Quiz alert: know Database vs DBMS and the DDL / DML / DCL / Query categories

## Slide Objectives
Define database/DBMS · explain why databases matter · data vs. information · spreadsheet problems · DDL/DML/query languages · tables, rows, columns · design process · purpose of normalization

## Reflection
*What was the most surprising insight today?*
