# Day 5
Normalization Day #2
2 homework Assignments

Normalization: A set of rules for designing relational

Redundant Data: Data stored in multiple places
unnecessarily



1NF - First normal form : removes repeating groups
2NF - second normal form : removes partial dependencies
3NF - Third Normal foram : Removes transitive dependencies
BCNF - boyce-Codd Normal form : a revision of 3NF
4NF - Fourth Normal Form : Additional rules for multu valued dependencies
DKNF - Domain Key Normal Form : Theoretical ultimate form


Denormalization is the process
where, after completing a design
that meets the rules of
normalization, you adjust the design
and introduce violation

Denormalization is a deliberate
trade-off. You accept some
redundancy to gain performance or
usability

Reason : 
- performance increase
- Ease of use 


Step 0 - Identify entities and relationships

Step 1 - create initial Table
 Employee(Employee ID, Name, Department Number, Dept Name(Project Number, Project Name, Sponsoring Dept Name, Weekly))

Step 1 - Identify Repeating group
- A repeating group is one or more
	attributes that have multiple
	values within the view

Step 2 — Apply 1NF Rules
 - A table must contain atomic attributes
 - cannot contain repeating groups of attributes

Step 2 — Fixing 1NF Violations
- If a repeating group exists:
- 1.Remove the repeating group from the original table
- 2.Place them in a new table
- 3.Duplicate the primary key of the original table and
	place in the new table as a foreign key
- 4.Designate the cardinality of the relationship
- 5.Designate a primary key for the new table
- If a composite attribute exists:
- Replace with two or more atomic attribute


Step 3 — Apply 2NF Rules
2NF has one rule:
All non-key attributes in a table must fully depend on the
entire primary key of the table

Step 4 - Apply 3NF



Simplified:

[] 1NF 
- Must contain atomic attributes
- Cannot contain any repeating groups of attributes

[] 2NF 
- All non-key attributes in a table must fully depend on the entire PK of the table
[] 3NF
-  A non key attribute cannot be fully depend on another key
