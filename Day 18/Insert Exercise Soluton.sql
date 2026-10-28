-- Insert Exercise Solution
-- Use the IQSchool Database 

-- 1. Insert a new record into the Payment table for a student named Peter Pan who paid $450.00 using VISA on October 10, 2005. Use subqueries to look up the PaymentTypeID and StudentID.

Insert Into Payment
	(PaymentID, PaymentDate, Amount, 
	 PaymentTypeID,
	 StudentID)
Values
	(
    40, '2005-10-10', 450.00,
    (Select	PaymentTypeID
	 From	PaymentType
	 Where	PaymentTypeDescription = 'VISA'),
    (Select	StudentID 
	 From	Student
	 Where	FirstName = 'Peter' And
			LastName = 'Pan')
	);

-- 2. Add a new Registration record for student Robert Smith, who is taking course DMIT1514 in semester 2005J, with a mark of 87, WithdrawYN = 'N', from instructor Tess Agonor. Use subqueries to retrieve both the StudentID and the StaffID.

Insert Into Registration
	(StudentID,
	 CourseID, Semester, Mark, WithdrawYN,
	 StaffID)
Values
	(
    (Select	StudentID
	 From	Student
	 Where	FirstName = 'Robert' And
			LastName = 'Smith'),
    'DMIT1514', '2005J', 87, 'N',
    (Select	StaffID 
	 From	Staff 
	 Where	FirstName = 'Tess' And
			LastName = 'Agonor')
);

-- 3.	Insert three new clubs into the Club table in a single Insert statement using the following values:
-- a.	AI		Artificial Intelligence Society
-- b.	ROBO		Robotics Club
-- c.	CYBER	Cybersecurity League

Insert Into Club
	(ClubID, ClubName)
Values
    ('AI', 'Artificial Intelligence Society'),
    ('ROBO', 'Robotics Club'),
    ('CYBER', 'Cybersecurity League');

-- 4. Add a new student (201052481) named Helen Grant who lives at 12 Maple Ave, Spruce Grove, postal code T7X3P4, Gender F, BalanceOwing $1,800.00 and was born on September 1, 2000.

Insert Into Student
	 (StudentID, FirstName, LastName, Gender, StreetAddress, City, PostalCode, BalanceOwing, BirthDate)
Values
	(201052481, 'Helen', 'Grant', 'F', '12 Maple Ave', 'Spruce Grove', 'T7X3P4', 1800.00, '2000-09-01');

-- 5. A club called Artificial Intelligence Society has been created (Question 3). Insert records into Activity for all students from the city of Edmonton, assigning them to the club 'AI'. Use an Insert Into ... Select statement.

Insert Into Activity
	(StudentID, ClubID)
Select	StudentID, 'AI'
From	Student
Where	City = 'Edmonton';

-- 6.	Insert a new payment (number 50) for Robert Smith, equal to half of his current BalanceOwing dated today. Use subqueries and expressions to get the IDs and to calculate the amount dynamically.

Insert Into Payment
	(PaymentID, PaymentDate, 
	 Amount,
	 PaymentTypeID,
	 StudentID)
Values
	(50, Current_Date,
    (Select	BalanceOwing / 2
	 From	Student
	 Where	FirstName = 'Robert' And
			LastName = 'Smith'),
    (Select	PaymentTypeID
	 From	PaymentType
	 Where	PaymentTypeDescription = 'Cash'),
    (Select	StudentID
	 From	Student
	 Where	FirstName = 'Robert' And 
			LastName = 'Smith')
	);

-- 7. Enroll Isaac Newton as a new student with two separate Insert statements (one for Student, one for Registration).
-- a.	StudentID: 201052500
-- b.	Gender: N
-- c.	Address: '45 Science Rd, Edmonton' 
-- d.	Postal Code: 'T5A1L9'
-- e.	Balance Owing: 2,500.00
-- f.	Birth Date: 1995-09-10
-- g.	Register them in course DMIT1514 for semester 2005J, with instructor Tess Agonor

-- Step 1: insert student
Insert Into Student
	(StudentID, FirstName, LastName, Gender, StreetAddress, City, PostalCode, BalanceOwing, BirthDate)
Values
	(201052500, 'Isaac', 'Newton', 'N', '45 Science Rd', 'Edmonton', 'T5A1L9', 2500.00, '1995-09-10');

-- Step 2: register them in a course
Insert Into Registration
	(StudentID, CourseID, Semester, Mark, WithdrawYN,
	 StaffID)
Values
	(201052500, 'DMIT1514', '2005J', Null, 'N',
    (Select StaffID
	 From	Staff
	 Where	FirstName = 'Tess' And
			LastName = 'Agonor')
);

