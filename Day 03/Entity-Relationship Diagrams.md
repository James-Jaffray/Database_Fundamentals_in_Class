---
aliases: [Database Fundamentals - Day 03]
tags: [database-fundamentals, term1, erd]
course: "[[Database Fundamentals]]"
---

# Database Fundamentals — Day 3: Entity-Relationship Diagrams

## Logistics
- **Homework:** quiz terminology checklist, practice quiz/exercise, review crow's foot notation
- **Quiz:** 1 hour, self-paced (no lecture) — Fri Sept 18
- Today's focus: [[Entity-Relationship Model|ERDs]]

## Why Plan First? (Poor Design Problems)
Redundancy, inconsistency, update/insert/delete anomalies — see [[Data Anomalies]]. The fix: plan with the ER model *before* building.

## Entity-Relationship Model
It's a blueprint for the database, helps communicate with stakeholders, and documents the design. The [[Entity-Relationship Model|ER Model]] is a tool that organizes and documents the logical design of a database.
> Simplified: manipulate data while maintaining connections.

### Entities vs. Instances
- **Entity**: Customer
  - *Instance*: Customer #100 — John Adams
  - *Instance*: Customer #200 — Miles Smith
  - *Instance*: Customer #300 — Sarah Jones
  - *Instance*: Customer #400 — David Chen
- An [[Entity]] is anything about which the organization needs to store data.

### Physical vs. Conceptual Entities

| Type | Definition | Examples |
|---|---|---|
| Physical | Real-world object | Customer, Employee, Vehicle |
| Conceptual | An idea, event, or business concept | Course, Order, Enrollment |

## Attributes
[[Attribute|Attributes]] are the specific details — a piece of data that describes an entity.

### Atomic vs. Composite Attributes
**Atomic attribute** — cannot be meaningfully broken down; a single, indivisible value.

| Atomic Attribute | Value |
|---|---|
| Customer Number | 100 |
| First Name | Joan |
| Phone | 780-488-8712 |

**Composite attribute** — can be broken down into smaller, meaningful parts (often atomic attributes).

| Composite Attribute | Can Be Broken Down Into |
|---|---|
| Address | Street Address, City, Province, Postal Code |
| Full Name | First Name, Last Name |

> **Business rule consideration:** a national company stores address as atomic parts. An international company may store address as a single composite attribute, because formats vary.

### Stored vs. Derived Attributes
- **Stored** — value is physically stored in the database; directly entered and saved. ("Stored is *set* data.")
- **Derived** — "learned" or calculated data (Order Amount = Quantity × Price; Age = today − DOB).

| | Stored | Derived |
|---|---|---|
| Storage | Uses more storage space | Saves storage space |
| Retrieval | Faster retrieval | Calculated each time (slower) |

## Domains and Null Values
- **Domain** — the ruleset of which values/characters are allowed for an attribute.
- **Data type** — the kind of data (integer, string, date); the domain narrows it further (e.g. integer *and* > 0 → 1, 100 OK; -5, 0, "ABC" not OK)
- **Null** — the *absence* of a value; not zero, blank or empty string. See [[NULL Values]].
  - Means either **unknown** (new customer, postal code not given yet) or **doesn't apply** (single employee, no spouse)
- NULL propagates through expressions: any expression using a NULL attribute results in NULL.
  - Example: `Price + NULL = NULL` (not 0!)

## Keys

### Primary Key ([[Primary Key|PK]])
An attribute (or group of attributes) that uniquely identifies each instance of an entity.
- Example: Student ID #
- Cannot be repeated
- Never null
- Stable — cannot change over time

**Special kinds of primary keys:**
- **Technical / surrogate key** — created by the designer when no naturally occurring unique attribute exists; often an auto-incrementing number.
- **Composite / concatenated key** — made up of 2+ attributes; the *combination* must be unique.

**Exercise:** ENROLLMENT(Student ID, Course Code, Grade) → PK is **Student ID + Course Code** (composite).

### Foreign Key ([[Foreign Key|FK]])
The mechanism that defines a relationship between entities: a primary key of one entity (the parent) that appears as an attribute of another entity (the child).

**Rules:**
- References a primary key in another table/entity
- Helps enforce the relationship between parent and child
- Must use a compatible data type with the referenced primary key
- Does **not** have to share the same attribute name as the PK it references
  - Example: `CUSTOMER.CustomerID → ORDER.CustomerID` (names match here, but don't have to)
- The FK value must correspond to a valid PK value in the parent, when the relationship requires a matching parent
- An attribute can be **both PK and FK** — common in an associative entity (ENROLLMENT: Student ID + Course Code are each PK + FK; Grade and Enrollment Date are non-key)

**Parent vs. child:** parent = the "one" side (CUSTOMER), child = the "many" side (ORDER).
**Rule of thumb:** the parent does *not* contain the FK; the child does.

| Relationship | Where the FK goes |
|---|---|
| 1:1 | Where the business rules make most sense; avoid unnecessary NULLs. If the FK enforces 1:1 it should be **UNIQUE** |
| 1:M | In the "many" entity (child) |
| M:N | Create an [[Associative Entity]] holding both PKs |

**1:1 example (department manager):** put `ManagerID (FK)` in DEPARTMENT (every department has a manager → no NULLs), not `ManagesDept` in EMPLOYEE (most employees aren't managers → lots of NULLs).

## Relationships & Cardinality
A relationship is a business association between two entities. All relationships are **bi-directional** (read from either side). Relationships are named with **verb phrases** ("places", "contains", "enrolls in") that make sense both ways.

- **One-to-one (1:1)** — one instance of Entity A relates to one instance of Entity B
- **One-to-many (1:M)** — one instance of Entity A relates to many instances of Entity B
- **Many-to-many (M:N)** — many instances of Entity A relate to many instances of Entity B

An **[[Associative Entity]]** is a third entity created to resolve a many-to-many relationship. It contains:
1. The primary keys of the two related entities (as foreign keys)
2. Any other attributes that describe the association
   - Example: STUDENT — *enrolls in* — COURSE

### [[Participation]]
Is the relationship required? **Mandatory** (every ORDER must belong to a CUSTOMER) vs. **Optional** (a CUSTOMER may have no ORDERs yet).
- Participation = *whether* the relationship is required; cardinality = *how many* are possible. They work together.

### [[Cardinality]]
Cardinality = minimum + maximum — the number of instances of one entity that can relate to a single instance of another.
- **Minimum** — is participation required? `O` = zero (optional), `|` = one (mandatory)
- **Maximum** — how many are allowed? `|` = one, crow's foot = many

**Crow's foot symbols:** circle = zero, bar = one, crow's foot = many.

| Symbol | Meaning |
|---|---|
| `O\|` | zero or one |
| `\|\|` | one and only one |
| `O<` | zero or many |
| `\|<` | one or many |

Crow's foot is used here only to make cardinality easier to understand — **IDEF1X is the notation used in this course**.

**Business rules determine cardinality** (Business Rule → Relationship → Cardinality → ERD). Don't pick a symbol because it "looks right"; derive it from the [[Business Rules]]. E.g. "a student can enroll in many courses; a course has many students" → M:N → needs an associative entity.

**Examples:**
- Country ↔ Capital City (1:1): `COUNTRY |---| has |---| CAPITAL` — a country has exactly one capital; a capital belongs to exactly one country.
- Department ↔ Employee (1:M): `DEPARTMENT |---| employs 0<--- EMPLOYEE` — a department employs zero or many employees; an employee belongs to exactly one department.

**How to read cardinality:**
1. Start at one entity.
2. Look at the symbols at the *other* end of the relationship.
3. Read the symbols as the min/max number of related instances — always read in both directions.

Example: `CUSTOMER |---O< ORDER`
- A CUSTOMER places zero or many ORDERs.
- An ORDER is placed by one and only one CUSTOMER.

**Cardinality types:** to one (driver's license) · to zero or one (parking stall) · to one or many (timecards) · to zero, one or many (projects) · to many (course → students).

## IDEF1X Notation
See [[IDEF1X Notation]].
- **Base entity** — square corners, has its own PK
- **Associative entity** — rounded corners, resolves M:N
- Foreign key attributes are suffixed **(FK)**
- **Solid line = identifying** relationship; **dashed line = non-identifying**

### Identifying vs. Non-Identifying
Key question: *is the FK part of the child's primary key?* See [[Identifying Relationships]].

| Type | Line | FK in child is… | Example |
|---|---|---|---|
| Non-identifying | Dashed | NOT part of child's PK | CUSTOMER → ORDER (Order has its own Order ID) |
| Identifying | Solid | part of child's PK | ORDER → ORDER_DETAILS (PK = Order ID + Item Number) |

## Step-by-Step ERD Construction
1. **Identify entities** — underline the "nouns" in the business rules
2. **Identify attributes** — what info do we need to store about each entity?
3. **Identify primary keys** — natural key or technical key?
4. **Identify relationships** — the "verbs" between entities; name with verb phrases that read sensibly both directions
5. **Determine cardinality** — 1:1, 1:M, or M:N
6. **Create associative entities** for any M:N relationship
7. **Draw the ERD** using IDEF1X notation

### Worked Example — College Registration
Rules: departments offer many courses; a course is offered by exactly one department; students enroll in many courses; courses have many students.
- Entities: DEPARTMENT, COURSE, STUDENT, ENROLLMENT
- DEPARTMENT offers COURSE → 1:M (Dept ID is an FK in COURSE)
- STUDENT enrolls in COURSE → M:N → resolved by ENROLLMENT (Student ID FK + Course Code FK, plus Grade, Enrollment Date)

## How to Read an ERD
1. Identify entities → 2. attributes → 3. PKs → 4. FKs → 5. relationships → 6. cardinality & participation → 7. identifying vs. non-identifying → 8. read each relationship as a sentence in both directions.
Goal: explain the design in plain language.

## Quiz Prep — Q&A

| Question | Answer |
|---|---|
| What is an entity? | A person, place, thing, or concept about which we store data |
| What is an instance? | One specific occurrence of an entity |
| What is a primary key? | An attribute that uniquely identifies each instance of an entity |
| What is a foreign key? | A primary key from one entity that appears in another entity |
| What is an associative entity? | A third entity created to resolve a many-to-many relationship |
| What is cardinality? | The number of instances of one entity that can relate to another |
| What is a composite attribute? | An attribute that can be broken down into smaller parts |
| What is a derived attribute? | An attribute calculated from other stored attributes |

## Key Concepts Summary

| Concept | Key Point |
|---|---|
| [[Entity-Relationship Model\|ER Model]] | Blueprint for database design |
| [[Entity]] | The "things" we store information about |
| [[Attribute]] | The characteristics of entities |
| [[Primary Key]] / [[Foreign Key]] | Unique identifiers and relationship links |
| 1:1 Relationships | Rare — one to one |
| 1:M Relationships | Most common — one to many |
| M:N Relationships | Must be resolved with an [[Associative Entity]] |
| [[Cardinality]] | Defines how many instances can participate |
| [[Participation]] | Defines whether participation is required or optional |
| [[IDEF1X Notation]] | The notation used in this course |
| [[Identifying Relationships\|Identifying Relationship]] | FK is part of the child's PK |
| Non-Identifying Relationship | FK is not part of the child's PK |

## Reflection
*What was the most surprising insight today?*
