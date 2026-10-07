# SQL Table Building: The Short Version

The script follows one pattern: **drop children first, create parents first, then index the foreign keys.** Everything else is column definitions and constraints.

## 1. Order matters

- **Drop** tables child-to-parent. `INVOICEITEM` goes first because it references `INVOICE`, and `OFFICETYPE` goes last because nothing it depends on remains. Dropping a parent while a child still points at it throws an error.
- **Create** tables parent-to-child. A foreign key can only reference a table that already exists, so `OFFICETYPE` comes before `OFFICE`, and `LEASE` comes after `OFFICE`, `DESKHOLDER`, and `LEASETYPE`.
- `DROP TABLE IF EXISTS` lets you re-run the whole script without errors.

## 2. Anatomy of a column

```sql
OFFICENUMBER DECIMAL(3, 0) CONSTRAINT PK_OFFICE_OFFICENUMBER PRIMARY KEY CONSTRAINT NN_OFFICE_OFFICENUMBER NOT NULL
```

That is `column name`, then `data type`, then any number of named `CONSTRAINT`s. Naming constraints is optional, but it makes error messages readable and lets you drop them later.

## 3. Data types used here

- `DECIMAL(p, s)` is a precise number. `p` is total digits and `s` is digits after the decimal point. So `DECIMAL(6, 2)` holds up to `9999.99`, and `DECIMAL(3, 0)` is a whole number up to 999. Use it for money and IDs, never floating point.
- `VARCHAR(n)` is variable-length text up to `n` characters, used for names, emails, and descriptions.
- `CHAR(n)` is fixed-length text, good for things that are always the same size, like `CHAR(1)` Y/N flags, a 10-digit phone number, or a 6-character ID.
- `TIMESTAMP` is a date and time.

Pick sizes that fit the real data. Too small truncates or errors, and too big wastes space and signals you didn't think about it.

## 4. Constraints

- **PRIMARY KEY** uniquely identifies each row. It can't repeat and can't be null.
- **NOT NULL / NULL** says whether a value is required. `COMPANYNAME` is `NULL` because not every desk holder has a company, while `FIRSTNAME` is `NOT NULL`.
- **FOREIGN KEY** (`REFERENCES parent (column)`) forces the value to exist in the parent table. `OFFICE.OFFICETYPECODE` must match a real `OFFICETYPE` row. The data type must exactly match the parent's column, which is why both are `DECIMAL(2, 0)`.
- **Composite primary key** (`INVOICEITEM`) uses two columns together as the key, written as a table-level constraint at the bottom: `PRIMARY KEY (INVOICENUMBER, ADDONNUMBER)`. One invoice can have many add-ons, and one add-on can appear on many invoices, but the *pair* is unique. This is how you resolve a many-to-many relationship.

## 5. Naming convention

The script uses a consistent pattern, which is probably what your instructor grades on:

- `PK_TABLE_COLUMN` for primary keys
- `NN_TABLE_COLUMN` for NOT NULL
- `NL_TABLE_COLUMN` for NULL
- `FK_TABLE_COLUMN_PARENT_COLUMN` for foreign keys
- `IX_TABLE_COLUMN` for indexes

## 6. Indexes

Primary keys get an index automatically. Foreign keys usually don't, so you add them yourself with `CREATE INDEX IX_LEASE_OFFICENUMBER ON LEASE (OFFICENUMBER);`. That speeds up joins and lookups on those columns.

## 7. Process for building your own

1. Start from your ERD and make one table per entity.
2. Pick a primary key for each table.
3. Add foreign keys on the "many" side of each relationship.
4. Decide NULL vs NOT NULL for each column.
5. Sort the tables parent-to-child, then write the drops in reverse.
6. Create the tables, add the indexes, and run a `SELECT *` on each to confirm it exists.

## Issues in your script

- **`NN_` on nullable columns.** `NN_DESKHOLDER_COMPANYNAME NULL` and `NN_OFFICEADDON_DISCOUNT NULL` are named "not null" but allow nulls. Rename them to `NL_` to match your own convention elsewhere.
- **Redundant index.** `IX_INVOICEITEM_INVOICENUMBER` is probably unnecessary. `INVOICENUMBER` is the first column of the composite primary key, which is already indexed. The `ADDONNUMBER` index is useful, though.
- **Credit card numbers.** Storing them as plain `VARCHAR` is fine for a class project, but never do it in a real system.
