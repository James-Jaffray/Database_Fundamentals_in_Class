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

## Entity-Relationship Model
The [[Entity-Relationship Model|ER Model]] is a tool that organizes and documents the logical design of a database.
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
- **Derived** — "learned" or calculated data.

| | Stored | Derived |
|---|---|---|
| Storage | Uses more storage space | Saves storage space |
| Retrieval | Faster retrieval | Calculated each time (slower) |

## Domains and Null Values
- **Domain** — the ruleset of which values/characters are allowed for an attribute.
- **Null** — unknown or N/A.
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

### Foreign Key ([[Foreign Key|FK]])
The mechanism that defines a relationship between entities: a primary key of one entity (the parent) that appears as an attribute of another entity (the child).

**Rules:**
- References a primary key in another table/entity
- Helps enforce the relationship between parent and child
- Must use a compatible data type with the referenced primary key
- Does **not** have to share the same attribute name as the PK it references
  - Example: `CUSTOMER.CustomerID → ORDER.CustomerID` (names match here, but don't have to)
- The FK value must correspond to a valid PK value in the parent, when the relationship requires a matching parent

## Relationships & Cardinality
- **One-to-one (1:1)** — one instance of Entity A relates to one instance of Entity B
- **One-to-many (1:M)** — one instance of Entity A relates to many instances of Entity B
- **Many-to-many (M:N)** — many instances of Entity A relate to many instances of Entity B

An **[[Associative Entity]]** is a third entity created to resolve a many-to-many relationship. It contains:
1. The primary keys of the two related entities (as foreign keys)
2. Any other attributes that describe the association
   - Example: STUDENT — *enrolls in* — COURSE

### [[Cardinality]]
Cardinality = minimum + maximum — the number of instances of one entity that can relate to a single instance of another.
- **Minimum** — is participation required? `O` = zero (optional), `|` = one (mandatory)
- **Maximum** — how many are allowed? `|` = one, crow's foot = many

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

## Step-by-Step ERD Construction
1. **Identify entities** — underline the "nouns" in the business rules
2. **Identify attributes** — what info do we need to store about each entity?
3. **Identify primary keys** — natural key or technical key?
4. **Identify relationships** — the "verbs" between entities; name with verb phrases that read sensibly both directions
5. **Determine cardinality** — 1:1, 1:M, or M:N
6. **Create associative entities** for any M:N relationship
7. **Draw the ERD** using IDEF1X notation

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
| Participation | Defines whether participation is required or optional |
| IDEF1X Notation | The notation used in this course |
| Identifying Relationship | FK is part of the child's PK |
| Non-Identifying Relationship | FK is not part of the child's PK |
