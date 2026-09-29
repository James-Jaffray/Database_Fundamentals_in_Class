---
aliases: [Database Fundamentals - Day 08]
tags: [database-fundamentals, term1, erd]
course: "[[Database Fundamentals]]"
---

# Database Fundamentals — Day 8: Memories Forever (Merging Views into an ERD)

**Today's focus:** practice the full design process on a new scenario — normalize several views, merge them, and draw the 3NF ERD.

## Scenario
Memories Forever preserves memories on DVD and VHS (reunions, weddings, seminars) and also rents equipment like camcorders. The paper-based records need to become a relational database covering rentals, productions, staffing, and possibly payroll later.

## Phase I — Database Design
From the supplied views (including the **Project Invoice** view: project, client, rented items and labor, staff, subtotal/GST/total), build a 3NF design and **merge the 3 views into one 3NF ERD**.

Process reminder ([[Database Fundamentals - Day 05 Normalization Cheat Sheet]]):
1. Build the 0NF table for each view and find the repeating group
2. Normalize each view to 3NF
3. [[Merging Tables|Merge]] tables that share a PK, preserving every entity, attribute, and relationship
4. Draw the ERD with [[Cardinality]] on each relationship

## To Know
- Read relationships in both directions when setting cardinality (see the ERD Relationships image in the Day 08 folder)

## Homework

## Reflection
*What was the most surprising insight today?*
