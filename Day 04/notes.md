# Day 4

Rules of Normalization - created by Edgar. F. Codd

Rules are a guide on a step by step creation of a database

1st - does it minimize redundancy
2nd - minimize the occurrence of anomalies within the data (anomalies = errors)
	Anomalies 
		- Update
			- Changing repeated information can create inconsistencies
		- Insert
			- Adding info may require unrelated info to be entered
		- Delete
			- Deleting one type of information may accidentally remove another type of info

-

1 data table is not necessarily better than 2

Applying normalization:
- Data redundancy is reduced - not eliminated - in the normalization design
- repeat info may still exist

