---
aliases: [Database Fundamentals - Day 09 SQL Practice]
tags: [database-fundamentals, term1, sql]
course: "[[Database Fundamentals]]"
---

# Database Fundamentals — Day 9: First SQL Script (MickeyMouseStudent)

**Today's focus:** create tables in SQL — datatypes, `NULL` vs `NOT NULL`, `DROP TABLE`, and indexes.

Practice script for creating a table. Ties back to the DDL commands from [[Database Fundamentals - Day 02]] and the [[Attribute|attributes]] you'd normally get from an ERD.

```sql
Drop Table IF Exists MickeyMouseStudent; -- deletes the table
Create Table MickeyMouseStudent -- creates the table with below attributes
(
	StudentID decimal (8,0) not null,
	FirstName varchar (30) null,
	LastName varchar (40) null,
	Address varchar (50) null,
	Phone varchar (10) null,
	EnrollmentDate date null,
	Gender char (1) not null
);
Select * From MickeyMouseStudent; -- To show table in data output
```

## Breakdown

| Statement | What it does |
|---|---|
| `Drop Table IF Exists` | Deletes the table if it's already there, so the script can be re-run cleanly |
| `Create Table` | Builds the table with the listed attributes |
| `Select * From` | Shows the table in the data output |

## Columns

| Column | Type | Required? |
|---|---|---|
| StudentID | `decimal(8,0)` | Yes (`not null`) |
| FirstName | `varchar(30)` | No |
| LastName | `varchar(40)` | No |
| Address | `varchar(50)` | No |
| Phone | `varchar(10)` | No |
| EnrollmentDate | `date` | No |
| Gender | `char(1)` | Yes (`not null`) |

## Monthly Desk Code-Along
Build tables in dependency order — independent ones first (OfficeType, ReferralSource, LeaseType), then Office, DeskHolder, and finally Lease, which pulls the others together. Each script starts with `Drop Table If Exists` so it can be re-run.

**Null test:** could a real row legitimately not have this value yet? If yes, the column is `NULL`. (A lease that's still active has no end date or final total yet.)

Foreign-key columns like `OfficeTypeCode` are plain columns today; they become [[Foreign Key|foreign keys]] next class.

## To Know
- No primary keys, foreign keys, or other constraints yet — only columns, datatypes, `NULL` / `NOT NULL`, and indexes

## Homework
- Funky Flowers: create six tables (Vehicles, Products, Customers, Deliveries, Orders, OrderDetails) with sensible datatypes and null rules, then create an index on `Customers(LastName)` and `Orders(OrderDate)` and drop one of them

## Reflection
*What was the most surprising insight today?*

