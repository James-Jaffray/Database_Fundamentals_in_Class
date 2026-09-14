---
aliases: [Database Fundamentals - Day 02]
tags: [database-fundamentals, term1]
course: "[[Database Fundamentals]]"
---

# Database Fundamentals — Day 2: Database Foundations

## Logistics
- Homework: practice quiz — do it

## Data vs. Information
- **Data** — raw, unorganized facts or figures
- **Information** — the processed and organized form of data

## Database vs. DBMS
See [[Database vs DBMS]] for the full breakdown.
- A **relational database** lets you connect related information.
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

**Business rules** — restrictions that need to be enforced.

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

[[Normalization]] matters:
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
