---
aliases: [Database Fundamentals - SQL Definitions Reference]
tags: [database-fundamentals, term1, sql, cheat-sheet]
course: "[[Database Fundamentals]]"
---

# SQL Definitions Reference — CREATE TABLE (Lessons 9–11)

Every Create Table concept for the unit in one place. Tags: **Day 9** · **L10** = Primary/Foreign Keys · **L11** = Default/Check/Unique/Alter Table. Basics sheet: [[Database Fundamentals - Day 09 Reference Sheet]].

**Rule of thumb for the whole unit:** every constraint gets a name (`PK_`, `NN_`, `FK_`, `CK_`, `DF_`, `UQ_`), and every foreign key column gets an index (`IX_`) — except when it's already covered by the leading column of a composite PK.

## Day 9

### Create a table — [[SQL CREATE TABLE]]
```sql
Create Table Vehicles
(
    VehicleNumber    integer      not null,
    DriverFirstName  varchar (35) not null,
    DriverLastName   varchar (35) not null
);
```
Each line inside `( )` is one column: name, datatype, can-it-be-blank. Every column line except the last ends with a comma.

### Delete a table — Drop Table
```sql
Drop Table If Exists Vehicles;
```
Removes the table **and all its data**. `If Exists` stops an error if the table isn't there yet — always include it when re-running scripts.

### Not Null vs Null — [[NULL Values]]
```sql
FirstName   varchar (35) not null,  -- every row MUST have this
MiddleName  varchar (35) null,      -- this row can leave it blank
```
`Not Null` = required (rejected if blank). `Null` or leaving it off = optional. Test: *could a real row legitimately not have a value here yet?* → Null.

### Index — [[SQL Indexes]]
```sql
Create Index IX_Deliveries_VehicleNumber On Deliveries (VehicleNumber);
Drop Index IX_Deliveries_VehicleNumber;
```
Without an index PostgreSQL scans every row; an index jumps straight to the match — useful on columns you search or sort by often. Name it `IX_<Table>_<Column>`. Dropping an index leaves the table and data untouched.

## Lesson 10 — Keys (see [[SQL Constraints]])

### Primary Key
```sql
VehicleNumber  integer
    Constraint PK_Vehicles_VehicleNumber Primary Key
    Constraint NN_Vehicles_VehicleNumber Not Null,
```
A [[Primary Key]] can never be null, so it's always marked Not Null too. `Constraint <name>` names the rule so an error message says exactly which rule failed — **every constraint gets a name**.
Naming: `PK_<Table>_<Column>`, `NN_<Table>_<Column>`, `FK_<Table>_<Column>_To_<RefTable>_<RefColumn>`.

### Composite Primary Key
```sql
Create Table OrderDetails
(
    OrderNumber    integer   not null,
    ProductNumber  char (7)  not null,
    Quantity       integer   not null,
    Constraint PK_OrderDetails_OrderNumber_ProductNumber
        Primary Key (OrderNumber, ProductNumber)
);
```
Add the PK as its own line at the end, listing both columns. Use when no single column is unique alone (an order has many products; a product is on many orders; each pair appears once). This is the SQL form of an [[Associative Entity]].

### Foreign Key
```sql
VehicleNumber  integer
    Constraint NN_Deliveries_VehicleNumber Not Null
    Constraint FK_Deliveries_VehicleNumber_to_Vehicles_VehicleNumber
        References Vehicles (VehicleNumber)
```
`References <table> (<column>)` = this value must already exist as a PK value over there ([[Foreign Key]]). The referenced table (Vehicles) must be created **before** the table referencing it (Deliveries) — table order matters once FKs exist.

## Lesson 11 — More Constraints & Alter Table

### Default
```sql
OrderDate  date
    Constraint DF_Orders_OrderDate_Current_Date Default Current_Date,
```
If an insert doesn't mention the column, it's filled in automatically. `Current_Date` = today.

### Check
```sql
Quantity  integer
    Constraint CK_OrderDetails_Quantity_GrEqZero
        Check (Quantity >= 0),
```
Rejects any insert/update that breaks the condition — "can't be negative", "must match a pattern", and other [[Business Rules]].

### Unique
```sql
PhoneNumber  char (12)
    Constraint UQ_Customers_PhoneNumber Unique
```
Same uniqueness as a PK, but for a column that isn't the row's identifier (two customers can't share a phone number, but we don't look customers up by it).

### Alter Table
```sql
-- add a new column
Alter Table Deliveries
    Add PrepaidCollect char (1) Null;

-- add a constraint to an existing column
Alter Table Orders
    Add Constraint CK_Orders_GSTAmount_GrEqZero
        Check (GSTAmount >= 0);
```
Use when the table already exists and you don't want to lose its data by dropping and recreating. Two common uses: add a new column, add a constraint to an existing column.

## Constraint Naming Cheat

| Prefix | Constraint | Pattern |
|---|---|---|
| `PK_` | Primary Key | `PK_<Table>_<Column>` |
| `NN_` | Not Null | `NN_<Table>_<Column>` |
| `FK_` | Foreign Key | `FK_<Table>_<Column>_To_<RefTable>_<RefColumn>` |
| `CK_` | Check | `CK_<Table>_<Column>_<Rule>` |
| `DF_` | Default | `DF_<Table>_<Column>_<Value>` |
| `UQ_` | Unique | `UQ_<Table>_<Column>` |
| `IX_` | Index (not a constraint) | `IX_<Table>_<Column>` |
