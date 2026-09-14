---
aliases: [Database Fundamentals - Day 04]
tags: [database-fundamentals, term1]
course: "[[Database Fundamentals]]"
---

# Database Fundamentals — Day 4: Rules of Normalization

## [[Normalization]] Basics
Rules created by **Edgar F. Codd** — a step-by-step guide for designing a database.

1. Does it minimize redundancy?
2. Does it minimize anomalies (errors) in the data?

### Anomalies
- **Update** — changing repeated information can create inconsistencies
- **Insert** — adding info may require unrelated info to also be entered
- **Delete** — deleting one type of information may accidentally remove another

## Key Takeaways
- One data table is not necessarily better than two.
- Normalization reduces data redundancy — it doesn't eliminate it. Some repeated info may still exist after normalizing.
