# Day 6

## Topic: Merging

| Normal Form | Rule                                                         | Violation             | Fix                                                   |
| ----------- | ------------------------------------------------------------ | --------------------- | ----------------------------------------------------- |
| 1NF         | Atomic attributes, no repeating<br>group                     | Repeating group       | Move to new table, copy PK as<br>FK                   |
| 2NF         | All non-key attributes fully<br>depend on entire PK          | Partial dependency    | Move to new table, copy PK part<br>as FK              |
| 3NF         | No non-key attribute depends on<br>another non-key attribute | Transitive dependency | Move to new table, copy non-key<br>attribute as PK/FK |



Merging - takes one table of data and merges into another

| Scenario                              | Action                             |
| ------------------------------------- | ---------------------------------- |
| Same table name, same PK              | Merge attribute                    |
| Same table name, different PK         | Keep separate, rename if<br>needed |
| Different table name, same PK         | Merge into one tabl                |
| Different table name, different<br>PK | Keep separate                      |

| Rule                                     | Explanation                                     |
| ---------------------------------------- | ----------------------------------------------- |
| Tables with the same PK<br>can be merged | Combine attributes from<br>both tables into one |
| All entities must be<br>preserved        | Don't lose any tables                           |
| All attributes must be<br>preserved      | Don't lose any columns                          |
| All relationships must be<br>preserved   | Don't lose any connections                      |
## Homework

Quiz Friday Sept 18

## Key Terms
