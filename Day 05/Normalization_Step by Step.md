# Normalization Cheat Sheet - 0NF → 3NF + ERD


---

## 1. The core vocabulary (know these cold)

- **Primary Key (PK)** - the attribute (or combination of attributes) that uniquely identifies a row in a table.
- **Composite key**  a PK made of two or more attributes together (neither one alone is unique).
- **Foreign Key (FK)** - a copy of another table's PK, used to link the two tables.
- **Repeating group** - a set of attributes that can occur multiple times for a single entity (e.g., one student can have many courses). Written in parentheses in 0NF notation.
- **Atomic attribute** - a value that can't be meaningfully split further (1NF requires every attribute to be atomic).
- **Partial dependency** - a non-key attribute depends on only *part* of a composite PK, not the whole thing. (This is what 2NF removes.)
- **Transitive dependency** - a non-key attribute depends on *another non-key attribute* instead of depending on the PK directly. (This is what 3NF removes.)

---

## 2. The method (same steps every time)

Run every new scenario through it in order, don't skip ahead.

### Step 0 Build the 0NF table
1. List every data item (attribute) mentioned in the scenario.
2. Identify the primary key. Ask: *what single row of data am I describing here - one transaction? one enrollment record?*
3. Find the repeating group - the attribute(s) that would repeat multiple times for the same PK value. Put them in parentheses next to the PK.

Notation: `TableName(PK, attr1, attr2, (repeating attr1, repeating attr2))`

### Step 1 Apply 1NF (remove repeating groups, make everything atomic)
1. Split any composite attributes into atomic pieces (e.g., a full name into first/last, if the scenario calls for it).
2. Pull the repeating group out into its own table.
3. Copy the original PK into the new table as an FK.
4. Figure out the new table's PK. Ask three questions in order:
   - Does the original PK alone uniquely identify a row in the new table? (Usually no - that's *why* it was repeating.)
   - Does the "repeating" attribute alone uniquely identify a row? (Usually no either.)
   - Does the combination of both uniquely identify a row? That combination is very often your new composite PK.

### Step 2 Apply 2NF (remove partial dependencies)
**2NF only matters for tables with a composite PK.** A table with a single-attribute PK automatically passes 2NF - don't waste time checking it.

For the table(s) with a composite PK:
1. List every non-key attribute.
2. For each one, ask: *does this depend on the entire composite key, or just one part of it?*
3. Anything that depends on only part of the key gets moved to a new table, keyed by that part.
4. Leave behind the FK reference so the tables still connect.

Tip: build a small table like Joe's Video Store did - one row per attribute, one column per part of the composite key, "Yes/No" for each - it makes partial dependencies obvious instead of something you have to hold in your head.

### Step 3 Apply 3NF (remove transitive dependencies)
**3NF only matters for tables with two or more non-key attributes.** If a table only has one non-key attribute, there's nothing for it to transitively depend on - it automatically passes.

For each table with 2+ non-key attributes:
1. Ask: *does one of these non-key attributes actually describe/depend on another non-key attribute, rather than on the PK?*
2. If yes, that's a transitive dependency. Move the dependent attribute(s) into a new table, keyed by the attribute they depend on.
3. Leave the FK behind to reconnect.

### Step 4 Draw the ERD
1. One box per table.
2. List the attributes inside each box.
3. Underline the PK.
4. Mark FKs explicitly, e.g. `CourseID (FK)`.
5. Draw a line between every pair of tables that share an FK relationship.
6. Label each line with cardinality - almost always **1** on the "parent" (PK) side and **M** on the "child" (FK) side for these kinds of scenarios.

---

## 3. Self-check checklist

Use this while you work tick each box before moving to the next step.

**0NF**
- [ ] I listed every attribute from the scenario.
- [ ] I identified the PK and can explain in one sentence why it's unique per row.
- [ ] I found the repeating group and wrote it in parentheses.

**1NF**
- [ ] Every attribute is atomic (nothing that's really two pieces of data crammed into one).
- [ ] No attribute holds multiple values for a single PK.
- [ ] The repeating group is now its own table.
- [ ] I tested all three PK candidates for the new table (original PK alone / repeating attribute alone / combination) before picking one.

**2NF**
- [ ] I only checked tables with a composite PK.
- [ ] For each non-key attribute in those tables, I explicitly asked "does this need the whole key, or just part of it?"
- [ ] Anything with a partial dependency has been moved out, with an FK left behind.

**3NF**
- [ ] I only checked tables with 2+ non-key attributes.
- [ ] For each one, I asked "does this attribute describe another non-key attribute instead of the PK?"
- [ ] Transitive dependencies are moved out, with an FK left behind.

**ERD**
- [ ] Every table is a box with its attributes listed.
- [ ] Every PK is underlined.
- [ ] Every FK is labeled.
- [ ] Every relationship line has a cardinality (1, M).

---

## 4. Common mistakes 

| Mistake                                                        | How to catch it                                                                                                                                                                                |
| -------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Forgetting to split composite attributes in 1NF                | Ask of every attribute: "could this reasonably be broken into smaller meaningful parts?"                                                                                                       |
| Misidentifying the repeating group                             | Look for whatever would show up more than once for the *same* PK value.                                                                                                                        |
| Guessing the new table's PK instead of testing it              | Always run the three-question test (original PK alone → repeating attribute alone → combination).                                                                                              |
| Checking 2NF on a table with a single-attribute PK             | Skip it  2NF violations are only possible with composite keys.                                                                                                                                 |
| Missing a partial dependency because it "seems related enough" | Literally ask, for each non-key attribute, which specific part(s) of the composite key it needs. If it's not *all* of them, it's partial.                                                      |
| Missing a transitive dependency                                | For every table with 2+ non-key attributes, ask whether any of them could be looked up just from another non-key attribute in that same table - if so, it doesn't need the whole row to exist. |
| Forgetting FKs in the ERD                                      | Every time you split a table, the piece that got left behind needs the FK explicitly marked.                                                                                                   |
| Not double-checking cardinality direction                      | The table holding the FK is the "many" side; the table being referenced is the "1" side.                                                                                                       |

---

## 5. Applying this to your Student/Course scenario

You've got: Student ID, Student Name, Course ID, Course Name, Instructor, Grade - with the same student showing up in multiple rows (once per course they're taking).

Work through it using the checklist above, but here are guiding questions to point you at what to look for at each stage - think them through rather than skipping to a table shape:

**0NF / PK:**
- What does one row of the raw data represent - a student, a course, or a specific *combination* of the two? That tells you your starting PK.
- Which attribute(s) repeat every time the same student shows up more than once?

**1NF:**
- Once the repeating group is pulled out, run the three-question PK test on the new table. What's the *smallest* combination that uniquely picks out one row (i.e., one specific student-in-one-specific-course)?

**2NF:**
- Look at your new composite-key table. For each non-key attribute in it, ask: does it need *both* halves of the key, or would it stay the same even if you only knew one half? (For example: would the course name change depending on *which student* is enrolled?)
- Any attribute that only needs one half of the key doesn't belong in that table anymore.

**3NF:**
- Look at whatever table ends up holding course-related details. Does it now have two or more non-key attributes? If so, ask whether one of them is really a property of *another* non-key attribute in that same table, rather than a property of the course itself.

**ERD:**
- Once your tables are settled, you should have one box per "thing" you've identified (how many entities did the scenario turn out to describe?). Connect them with FK relationships and mark cardinality - pay attention to which side is 1 and which is M for a student-takes-course type relationship.

If you get stuck on any single step, re-read that step's section in Joe's Video Store (your class handout already has it fully worked, including the "hints" callouts at each stage) - the *logic* is identical, only the attribute names change.

---

## 6. Quick reference - notation cheat sheet

```
TableName(PK, attr1, attr2)              → simple table, single-attribute PK
TableName(PK1, PK2, attr1, attr2)        → composite PK
TableName(PK, attr1, (repeating group))  → 0NF, not yet normalized
TableName(PK, attr1, FK_attr (FK))       → FK explicitly marked
```

ERD shorthand: underline = PK · `(FK)` = foreign key · line with **1** and **M** = one-to-many relationship, arrow/crow's-foot points to the "many" side.
