# Day 3

Homework:
- Quiz terminology checklist
- practice quiz / exercise
- go through Crows feet notation!

Quiz is an hour long
done when you're done - no lecture
- fri sept 18

ERD's are todays focus


Entity relationship model - The Entity-Relationship (ER) Model is
a tool that organizes and documents
the logical design of a database

simplified definition: manipulate data while maintaining connections

QUIZ ALERT
entities vs. instances

**Entity**: Customer
|
|---**instance**: Customer #100 - John Adams
|---**instance**: Customer #200 - Miles Smith
|---**instance**: Customer #300 - Sarah Jones
|---**instance**: Customer #400 - David Chen


Physical vs. Conceptual Entities:
physical:
- real world object - customer, Employee, Vehicle
Conceptual:
- An idea, event or business concept - Course, order, enrollment

Key points
Entity is anything about which the organization needs to store data


Attributes are the specific Details

a piece of data that describe an entity


Atomic vs composite Attributes

Atomic attribute
- cannot be meaningfully broken down
- contains a single, indivisible value

Atomic Attribute            Value
Customer Number         100
First Name                      Joan
Phone                             780-488-8712


Composite Attribute
- can be broken down into smaller, meaningful parts
- the parts are often atomic attributes


Composite Attribute              Can Be Broken Down Into
Address                                  Street Address, City, Province, Postal Code
Full Name                               First Name, Last Name



Business Rule Consideration:
A national company stores address as atomic parts. An international company may store
address as a single composite attribute because formats vary.


Stored vs. Derived Attributes

Stored Attributes
- Value is physically stored in the data base
- Directly enter and saved

Concise explanation:
Stored is SET data
Derived is 'Learned' or 'calculated' data

Store Derived Attribute             Don't Store Derived Attribute
Uses more storage space          Saves storage space
Faster retrieval                           Calculated each time (slower)


Domains and Null Values
Domains are the rulesets of which characters are allowed in the dataset

Null = unknown or N/A


NULL propagates through expressions. Any
expression using an attribute that contains
NULL will result in NULL.
Example: Price + NULL = NULL (not 0!)


PK - Primary Key
- an attribute or group of attributes that uniquely identifies each instance of an identity
-  example: Student Id #
- cannot be repeated
- never null
- stable - cannot be changed over time



Special keys of primary keys
Technical Key (surrogate key)
- A PK created by the database designer when there is no naturally occurring unique attribute
- often an auto-incrementing number

Composite Key (concatenated Key)
- A Pk made up of 2 or more attributes
- The combination of all attributes must be unique


Relationships:

one-to-one (1:1) - One instance of Entity A
relates to one instance
of Entity B

One-to-Many (1:M) - One instance of Entity A
relates to many
instances of Entity B

Many-to-Many (M:N) - Many instances of
Entity A relate to many
instances of Entity B

An Associative Entity is a third entity created to resolve a many-to-many relationship

It contains:
1. The primary keys of the two related entities (as foreign keys)
2. Any other attributes that describe the association
Example: STUDENT — enrolls in — COURSE


Foreign Keys (FK)
A Foreign Key (FK) is the mechanism that defines a relationship between entities.
Definition:
A primary key of one entity (the parent) that appears as an attribute of another entity (the child).



Foreign Key Rules
A foreign key does more than simply "connect two boxes."
A foreign key:
• References a primary key in another table/entity
• Helps enforce the relationship between parent and child
• Must use a compatible data type with the referenced primary key
• Does not have to have the same attribute name as the primary key it references
Example:
CUSTOMER.CustomerID → ORDER.CustomerID
The names match here, but they do not have to.
Important:
The FK value must correspond to a valid PK value in the parent when the relationship requires a matching parent.


Cardinality = Minimum + Maximum
Cardinality defines the number of instances of one
entity that can be related to a single instance of
another entity.
A useful way to read cardinality is as a minimum
and maximum.
Minimum = Is participation required?
O = zero → optional
| = one → mandatory
Maximum = How many are allowed?
| = one
Crow's foot = many
Common combinations:




Cardinality Examples
Example 1: Country and Capital City (1:1)
COUNTRY |---| has |---| CAPITAL
• Country has exactly one capital.
• Capital belongs to exactly one country.


Example 2: Department and Employee (1:M)
DEPARTMENT |---| employs 0<--- EMPLOYEE
• A department employs zero or many employees.
• An employee belongs to exactly one department.


How to Read Cardinality
When reading an ERD:
Step 1: Start at one entity.
Step 2: Look at the symbols at the other end of the relationship.
Step 3: Read the symbols as the minimum and maximum number of related instances.


Example:
CUSTOMER |---O< ORDER
Starting with CUSTOMER:
One customer can have zero or many orders.
Starting with ORDER:
One order must belong to exactly one customer.
Always read the relationship in both directions.
Read it as a sentence:
A CUSTOMER places zero or many ORDERs.
An ORDER is placed by one and only one CUSTOMER.
Key Point:
The meaning comes from the symbol at the other entity's end of the relationship.



Step-by-Step ERD Construction
Step 1: Identify Entities
Read the business rules. Underline the "nouns" — these are potential entities.
Step 2: Identify Attributes
What information do we need to store about each entity?
Step 3: Identify Primary Keys
What uniquely identifies each instance of an entity? Is there a natural key? Do we need a technical key?
Step 4: Identify Relationships
How are entities connected? What are the "verbs" between them?
Name relationships with verb phrases and make sure they make sense in both directions.
Step 5: Determine Cardinality
How many instances can participate in each relationship? (1:1, 1:M, M:N)
Step 6: Create Associative Entities
If you have a M:N relationship, create an associative entity to resolve it.
Step 7: Draw the ERD
Use IDEF1X notation with proper symbols




Question Answer
What is an entity? A person, place, thing, or concept about which we store data.
What is an instance? One specific occurrence of an entity.
What is a primary key? An attribute that uniquely identifies each instance of an entity.
What is a foreign key? A primary key from one entity that appears in another entity.
What is an associative entity? A third entity created to resolve a many-to-many relationship.
What is cardinality? The number of instances of one entity that can relate to another.
What is a composite attribute? An attribute that can be broken down into smaller parts.
What is a derived attribute? An attribute calculated from other stored attributes



Concept Key Point
ER Model A blueprint for database design
Entities The "things" we store information about
Attributes The characteristics of entities
PKs and FKs Unique identifiers and relationship links
1:1 Relationships Rare — one to one
1:M Relationships Most common — one to many
M:N Relationships Must be resolved with an associative entity
Cardinality Defines how many instances can participate
Participation Defines whether participation is required or
optional
IDEF1X Notation The notation used in this course
Identifying Relationship FK is part of the child's PK
Non-Identifying Relationship FK is not part of the child's PK

