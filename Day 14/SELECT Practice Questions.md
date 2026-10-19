---
aliases: [SELECT Practice, SQL SELECT Practice Questions]
tags: [database-fundamentals, term1, practice, sql, select]
course: "[[Database Fundamentals]]"
---

# SELECT Practice Questions

Practice questions for everything from [[Basic SELECT Statements]] through [[Counting, Subqueries and Views]], in the same format as the in-class exercises. All questions use **The Monthly Desk** tables. Try each one first, then click the answer to check it.

Quick lookups: [[SELECT Reference Sheet]] · [[Query Patterns Reference]] · [[PostgreSQL Functions Reference]]

## Course Rules
- [ ] Prefix **every** column with its table alias when 2+ tables
- [ ] Name every calculated / aggregate column: `AS "Name"`
- [ ] No `*` in the column list (`COUNT(*)` is fine)
- [ ] Non-aggregate `SELECT` columns all go in `GROUP BY`
- [ ] Aggregate conditions go in `HAVING`, not `WHERE`
- [ ] End every statement with `;`

## Basic SELECT, WHERE, ORDER BY
Same ideas as [[Basic SELECT Statements]] — columns, filters, pattern matching, sorting.

**1.** Write a SELECT statement that displays the DeskHolderID, FirstName, LastName, and EmailAddress for all desk holders in the DeskHolder table.

> [!success]- Answer
> ```sql
> SELECT DeskHolderID, FirstName, LastName, EmailAddress
> FROM DeskHolder;
> ```
>
> *50 rows*

**2.** Write a SELECT statement that displays the LeaseNumber, StartDate, and TotalLeasePrice of all leases whose LeaseTypeNumber is 4.

> [!success]- Answer
> ```sql
> SELECT LeaseNumber, StartDate, TotalLeasePrice
> FROM Lease
> WHERE LeaseTypeNumber = 4;
> ```
>
> *5 rows*

**3.** Write a SELECT statement that displays the DeskHolderID and a concatenated column called "Contact Name" in the format LastName, FirstName (for example Annesley, Rip) from the DeskHolder table.

> [!success]- Answer
> ```sql
> SELECT DeskHolderID,
>        LastName || ', ' || FirstName AS "Contact Name"
> FROM DeskHolder;
> ```
>
> *50 rows*

**4.** Write a SELECT statement that displays the OfficeNumber, SquareFootage, and MonthlyRent for offices where the SquareFootage is less than 300 and MeetingTableYN is 'Y'.

> [!success]- Answer
> ```sql
> SELECT OfficeNumber, SquareFootage, MonthlyRent
> FROM Office
> WHERE SquareFootage < 300
>   AND MeetingTableYN = 'Y';
> ```
>
> *6 rows*

**5.** Write a SELECT statement that displays all office add-ons whose AddOnDescription begins with the letter 'P' using the LIKE operator.

> [!success]- Answer
> ```sql
> SELECT AddOnNumber, AddOnDescription, CurrentCost, CurrentPrice
> FROM OfficeAddOn
> WHERE AddOnDescription LIKE 'P%';
> ```
>
> *4 rows*

**6.** Write a SELECT statement that displays the FirstName and LastName of desk holders whose last name contains the letters "er" anywhere in the value using the LIKE operator.

> [!success]- Answer
> ```sql
> SELECT FirstName, LastName
> FROM DeskHolder
> WHERE LastName LIKE '%er%';
> ```
>
> *10 rows*

**7.** Write a SELECT statement that displays the DeskHolderID, FirstName, and LastName of desk holders whose CellPhoneNumber starts with a digit from 5 to 7 and ends with a 0 or a 5 using a PostgreSQL regular expression.

> [!success]- Answer
> ```sql
> SELECT DeskHolderID, FirstName, LastName
> FROM DeskHolder
> WHERE CellPhoneNumber ~ '^[5-7].*[05]$';
> ```
>
> *5 rows*

**8.** Write a SELECT statement that displays the AddOnNumber, AddOnDescription, and CurrentPrice from the OfficeAddOn table sorted by CurrentPrice from highest to lowest, with ties sorted by AddOnDescription alphabetically.

> [!success]- Answer
> ```sql
> SELECT AddOnNumber, AddOnDescription, CurrentPrice
> FROM OfficeAddOn
> ORDER BY CurrentPrice DESC, AddOnDescription ASC;
> ```
>
> *14 rows*

**9.** Write a SELECT statement that displays a unique list of LeaseTypeNumber values from the Lease table sorted in descending order.

> [!success]- Answer
> ```sql
> SELECT DISTINCT LeaseTypeNumber
> FROM Lease
> ORDER BY LeaseTypeNumber DESC;
> ```
>
> *6 rows*

**10.** Write a SELECT statement that displays the OfficeNumber, SquareFootage, and MonthlyRent for offices where the MonthlyRent is between 700 and 1400, sorted from highest rent to lowest rent.

> [!success]- Answer
> ```sql
> SELECT OfficeNumber, SquareFootage, MonthlyRent
> FROM Office
> WHERE MonthlyRent BETWEEN 700 AND 1400
> ORDER BY MonthlyRent DESC;
> ```
>
> *14 rows*

**11.** Write a SELECT statement that displays the OfficeNumber, WindowQuantity, and WindowStatus for offices where the WindowStatus is not 'F'.

> [!success]- Answer
> ```sql
> SELECT OfficeNumber, WindowQuantity, WindowStatus
> FROM Office
> WHERE WindowStatus <> 'F';
> ```
>
> *8 rows*

**12.** Write a SELECT statement that displays the InvoiceNumber, InvoiceTotal, and PaidYN for invoices that are unpaid (PaidYN = 'N') or have an InvoiceTotal greater than 1000.

> [!success]- Answer
> ```sql
> SELECT InvoiceNumber, InvoiceTotal, PaidYN
> FROM Invoice
> WHERE PaidYN = 'N'
>    OR InvoiceTotal > 1000;
> ```
>
> *23 rows*

**13.** Write a SELECT statement that displays the FirstName, LastName, and ReferralSourceCode of desk holders whose ReferralSourceCode is 1, 2, 3, or 4 using IN.

> [!success]- Answer
> ```sql
> SELECT FirstName, LastName, ReferralSourceCode
> FROM DeskHolder
> WHERE ReferralSourceCode IN (1, 2, 3, 4);
> ```
>
> *13 rows*

**14.** Write a SELECT statement that displays the AddOnNumber and AddOnDescription of add-ons whose AddOnNumber is not 1, 2, or 3 using NOT IN.

> [!success]- Answer
> ```sql
> SELECT AddOnNumber, AddOnDescription
> FROM OfficeAddOn
> WHERE AddOnNumber NOT IN (1, 2, 3);
> ```
>
> *11 rows*

**15.** Write a SELECT statement that displays the OfficeNumber and MonthlyRent for offices whose MonthlyRent is NOT between 700 and 1400.

> [!success]- Answer
> ```sql
> SELECT OfficeNumber, MonthlyRent
> FROM Office
> WHERE MonthlyRent NOT BETWEEN 700 AND 1400;
> ```
>
> *11 rows*

**16.** Write a SELECT statement that displays the DeskHolderID, FirstName, and LastName of desk holders who do not have a CompanyName (the value is NULL).

> [!success]- Answer
> ```sql
> SELECT DeskHolderID, FirstName, LastName
> FROM DeskHolder
> WHERE CompanyName IS NULL;
> ```
>
> *28 rows*

**17.** Write a SELECT statement that displays the LeaseNumber, StartDate, and EndDate of leases that have an EndDate.

> [!success]- Answer
> ```sql
> SELECT LeaseNumber, StartDate, EndDate
> FROM Lease
> WHERE EndDate IS NOT NULL;
> ```
>
> *6 rows*

## Simple SELECT Practice
Mirrors the Simple Select Exercise from Day 12, on The Monthly Desk tables.

**1.** Select all the information from the OfficeType table (list the columns, no asterisk).

> [!success]- Answer
> ```sql
> SELECT OfficeTypeCode, OfficeTypeDescription
> FROM OfficeType;
> ```
>
> *6 rows*

**2.** Select the FirstName and LastName of all the desk holders.

> [!success]- Answer
> ```sql
> SELECT FirstName, LastName
> FROM DeskHolder;
> ```
>
> *50 rows*

**3.** Select the AddOnNumber and AddOnDescription of all the add-ons. Create column aliases "Add-On Number" and "Description".

> [!success]- Answer
> ```sql
> SELECT AddOnNumber AS "Add-On Number",
>        AddOnDescription AS "Description"
> FROM OfficeAddOn;
> ```
>
> *14 rows*

**4.** Select all the lease type information for LeaseTypeNumber 4.

> [!success]- Answer
> ```sql
> SELECT LeaseTypeNumber, LeaseTypeDescription
> FROM LeaseType
> WHERE LeaseTypeNumber = 4;
> ```
>
> *1 row*

**5.** Select the first and last names of the desk holders who have a ReferralSourceCode of 6.

> [!success]- Answer
> ```sql
> SELECT FirstName, LastName
> FROM DeskHolder
> WHERE ReferralSourceCode = 6;
> ```
>
> *6 rows*

**6.** Select the AddOnDescriptions whose CurrentPrice is less than 5.

> [!success]- Answer
> ```sql
> SELECT AddOnDescription
> FROM OfficeAddOn
> WHERE CurrentPrice < 5;
> ```
>
> *4 rows*

**7.** Select the InvoiceNumber, AddOnNumber, and QuantitySold where the QuantitySold is between 2 and 5.

> [!success]- Answer
> ```sql
> SELECT InvoiceNumber, AddOnNumber, QuantitySold
> FROM InvoiceItem
> WHERE QuantitySold BETWEEN 2 AND 5;
> ```
>
> *21 rows*

**8.** Select the InvoiceNumber, AddOnNumber, and QuantitySold where the QuantitySold is between 2 and 5 and the AddOnNumber is 3 or 4.

> [!success]- Answer
> ```sql
> SELECT InvoiceNumber, AddOnNumber, QuantitySold
> FROM InvoiceItem
> WHERE QuantitySold BETWEEN 2 AND 5
>   AND (AddOnNumber = 3 OR AddOnNumber = 4);
> ```
>
> *10 rows*

**9.** Select the first and last names of the desk holders who have last names starting with B.

> [!success]- Answer
> ```sql
> SELECT FirstName, LastName
> FROM DeskHolder
> WHERE LastName LIKE 'B%';
> ```
>
> *6 rows*

**10.** Select the DeskHolderIDs that have a 2 as the sixth character.

> [!success]- Answer
> ```sql
> SELECT DeskHolderID
> FROM DeskHolder
> WHERE DeskHolderID LIKE '_____2';
> ```
>
> *1 row*

**11.** Select the add-on descriptions that contain the word 'Photocopy'.

> [!success]- Answer
> ```sql
> SELECT AddOnDescription
> FROM OfficeAddOn
> WHERE AddOnDescription LIKE '%Photocopy%';
> ```
>
> *2 rows*

**12.** Select all the referral source descriptions that start with F or W.

> [!success]- Answer
> ```sql
> SELECT ReferralSourceDescription
> FROM ReferralSource
> WHERE ReferralSourceDescription LIKE 'F%'
>    OR ReferralSourceDescription LIKE 'W%';
> ```
>
> *4 rows*

**13.** Select the desk holder first and last names and email address where the last name is exactly 5 characters long.

> [!success]- Answer
> ```sql
> SELECT FirstName, LastName, EmailAddress
> FROM DeskHolder
> WHERE Length(LastName) = 5;
> ```
>
> *7 rows*

**14.** Select the InvoiceNumbers where the InvoiceTotal is less than 100 or the invoice is paid (PaidYN is 'Y').

> [!success]- Answer
> ```sql
> SELECT InvoiceNumber
> FROM Invoice
> WHERE InvoiceTotal < 100
>    OR PaidYN = 'Y';
> ```
>
> *18 rows*

## Aggregates, Functions, GROUP BY and HAVING
Covers the aggregate, string, conversion and date functions plus `GROUP BY` / `HAVING`. See [[PostgreSQL Functions Reference]]. Always name aggregate and calculated columns.

**1.** Write a SELECT statement that displays the average MonthlyRent of all offices with an OfficeTypeCode of 1, named "Average Monthly Rent".

> [!success]- Answer
> ```sql
> SELECT AVG(MonthlyRent) AS "Average Monthly Rent"
> FROM Office
> WHERE OfficeTypeCode = 1;
> ```
>
> *1 row*

**2.** Write a SELECT statement that displays the total InvoiceTotal for all invoices belonging to LeaseNumber 85, named "Total Invoiced".

> [!success]- Answer
> ```sql
> SELECT SUM(InvoiceTotal) AS "Total Invoiced"
> FROM Invoice
> WHERE LeaseNumber = 85;
> ```
>
> *1 row*

**3.** Write a SELECT statement that displays the lowest and the highest CurrentPrice in the OfficeAddOn table as "Lowest Price" and "Highest Price".

> [!success]- Answer
> ```sql
> SELECT MIN(CurrentPrice) AS "Lowest Price",
>        MAX(CurrentPrice) AS "Highest Price"
> FROM OfficeAddOn;
> ```
>
> *1 row*

**4.** Write a SELECT statement that displays the number of leases that have an EndDate, named "Number of Ended Leases". Then write a second query for the number of lease records.

> [!success]- Answer
> ```sql
> SELECT COUNT(EndDate) AS "Number of Ended Leases"   -- non-null values only
> FROM Lease;
> 
> SELECT COUNT(*) AS "Number of Leases"              -- all records
> FROM Lease;
> ```
>
> *1 rows, then 1 rows*

**5.** Write a SELECT statement that displays the number of desk holders and the number of desk holders that belong to a company. Name the columns "Desk Holders" and "Company Desk Holders".

> [!success]- Answer
> ```sql
> SELECT COUNT(*) AS "Desk Holders",
>        COUNT(CompanyName) AS "Company Desk Holders"   -- NULL company names are ignored
> FROM DeskHolder;
> ```
>
> *1 row*

**6.** Write a SELECT statement that displays the number of different OfficeTypeCode values used by the offices, named "Office Types in Use".

> [!success]- Answer
> ```sql
> SELECT COUNT(DISTINCT OfficeTypeCode) AS "Office Types in Use"
> FROM Office;
> ```
>
> *1 row*

**7.** Write a SELECT statement that displays the FirstName and LastName of desk holders whose first name is 4 characters long.

> [!success]- Answer
> ```sql
> SELECT FirstName, LastName
> FROM DeskHolder
> WHERE Length(FirstName) = 4;
> ```
>
> *8 rows*

**8.** Write a SELECT statement that displays the LastName and a column called "Short Code" containing the first 3 characters of the last name in uppercase.

> [!success]- Answer
> ```sql
> SELECT LastName,
>        Upper(Left(LastName, 3)) AS "Short Code"
> FROM DeskHolder;
> ```
>
> *50 rows*

**9.** Write a SELECT statement that displays the DeskHolderID and a column called "ID Number" containing the last 3 characters of the DeskHolderID. Then do the same using Substring.

> [!success]- Answer
> ```sql
> SELECT DeskHolderID,
>        Right(DeskHolderID, 3) AS "ID Number"
> FROM DeskHolder;
> 
> SELECT DeskHolderID,
>        Substring(DeskHolderID, 4, 3) AS "ID Number"   -- positions start at 1
> FROM DeskHolder;
> ```
>
> *50 rows, then 50 rows*

**10.** Write a SELECT statement that displays the AddOnDescription in uppercase, in lowercase, and reversed, named "Uppercase", "Lowercase", and "Backwards".

> [!success]- Answer
> ```sql
> SELECT Upper(AddOnDescription) AS "Uppercase",
>        Lower(AddOnDescription) AS "Lowercase",
>        Reverse(AddOnDescription) AS "Backwards"
> FROM OfficeAddOn;
> ```
>
> *14 rows*

**11.** Write a SELECT statement that displays the text '   The Monthly Desk   ' with the spaces removed from both sides, named "Trimmed".

> [!success]- Answer
> ```sql
> SELECT Ltrim(Rtrim('   The Monthly Desk   ')) AS "Trimmed";
> ```
>
> *1 row*

**12.** Write a SELECT statement that displays the InvoiceNumber, the InvoiceTotal converted to text with Cast named "Total as Text", and the InvoiceTotal formatted with To_Char as 9,999.99 named "Formatted Total".

> [!success]- Answer
> ```sql
> SELECT InvoiceNumber,
>        Cast(InvoiceTotal AS Varchar) AS "Total as Text",
>        To_Char(InvoiceTotal, '9,999.99') AS "Formatted Total"
> FROM Invoice;
> ```
>
> *32 rows*

**13.** Write a SELECT statement that displays the date '25 Dec 2026' converted with To_Date, named "Holiday", and the text '4,321.50' converted with To_Number, named "Amount".

> [!success]- Answer
> ```sql
> SELECT To_Date('25 Dec 2026', 'DD Mon YYYY') AS "Holiday",
>        To_Number('4,321.50', '9,999.99') AS "Amount";
> ```
>
> *1 row*

**14.** Write a SELECT statement that displays the LeaseNumber, the year of the StartDate named "Start Year", and the day of the week of the StartDate named "Start Day" (for example Monday).

> [!success]- Answer
> ```sql
> SELECT LeaseNumber,
>        Date_Part('year', StartDate) AS "Start Year",
>        To_Char(StartDate, 'Day') AS "Start Day"   -- 'DAY' would give MONDAY
> FROM Lease;
> ```
>
> *25 rows*

**15.** Write a SELECT statement that displays the OfficeTypeCode and the average MonthlyRent for each office type, named "Average Monthly Rent".

> [!success]- Answer
> ```sql
> SELECT OfficeTypeCode,
>        AVG(MonthlyRent) AS "Average Monthly Rent"
> FROM Office
> GROUP BY OfficeTypeCode;
> ```
>
> *5 rows*

**16.** Write a SELECT statement that displays the LeaseNumber and the total InvoiceTotal for each lease, only for leases whose total is greater than 1000, sorted from highest total to lowest.

> [!success]- Answer
> ```sql
> SELECT LeaseNumber,
>        SUM(InvoiceTotal) AS "Total Invoiced"
> FROM Invoice
> GROUP BY LeaseNumber
> HAVING SUM(InvoiceTotal) > 1000
> ORDER BY "Total Invoiced" DESC;
> ```
>
> *5 rows*

**17.** Show each ReferralSourceCode and how many desk holders it has, only for referral sources with more than 3 desk holders.

> [!success]- Answer
> ```sql
> SELECT ReferralSourceCode,
>        COUNT(*) AS "Number of Desk Holders"   -- "for each" source
> FROM DeskHolder
> GROUP BY ReferralSourceCode                   -- one row per source
> HAVING COUNT(*) > 3;                          -- keep groups with 4+
> ```
>
> *5 rows*

**18.** Write a SELECT statement that displays the WindowStatus and the number of offices for each status, only for offices with a MonthlyRent above 700 (filter the rows first), and only statuses with at least 5 offices.

> [!success]- Answer
> ```sql
> SELECT WindowStatus,
>        COUNT(*) AS "Number of Offices"
> FROM Office
> WHERE MonthlyRent > 700          -- WHERE filters rows before grouping
> GROUP BY WindowStatus
> HAVING COUNT(*) >= 5;            -- HAVING filters groups after
> ```
>
> *2 rows*

## Inner Joins
Same pattern as the Day 13 join practice: child FK matches parent PK, and every column is prefixed with its table alias. See [[Advanced SELECT and Joins]] and [[SQL Joins]].

**1.** Write a SELECT statement that displays the OfficeNumber, WindowQuantity, and OfficeTypeDescription by joining the Office and OfficeType tables.

> [!success]- Answer
> ```sql
> SELECT O.OfficeNumber, O.WindowQuantity, OT.OfficeTypeDescription
> FROM Office O
> INNER JOIN OfficeType OT ON O.OfficeTypeCode = OT.OfficeTypeCode;
> ```
>
> *25 rows*

**2.** Write a SELECT statement that displays the DeskHolderID, EmailAddress, and ReferralSourceDescription by joining the DeskHolder and ReferralSource tables.

> [!success]- Answer
> ```sql
> SELECT DH.DeskHolderID, DH.EmailAddress, RS.ReferralSourceDescription
> FROM DeskHolder DH
> INNER JOIN ReferralSource RS ON DH.ReferralSourceCode = RS.ReferralSourceCode;
> ```
>
> *50 rows*

**3.** Write a SELECT statement that displays the LeaseNumber, EndDate, and LeaseTypeDescription by joining the Lease and LeaseType tables.

> [!success]- Answer
> ```sql
> SELECT L.LeaseNumber, L.EndDate, LT.LeaseTypeDescription
> FROM Lease L
> INNER JOIN LeaseType LT ON L.LeaseTypeNumber = LT.LeaseTypeNumber;
> ```
>
> *25 rows*

**4.** Write a SELECT statement that displays the LeaseNumber, SquareFootage, and WindowStatus by joining the Lease and Office tables.

> [!success]- Answer
> ```sql
> SELECT L.LeaseNumber, O.SquareFootage, O.WindowStatus
> FROM Lease L
> INNER JOIN Office O ON L.OfficeNumber = O.OfficeNumber;
> ```
>
> *25 rows*

**5.** Write a SELECT statement that displays the InvoiceNumber, InvoiceTotal, and StartDate of the lease by joining the Invoice and Lease tables.

> [!success]- Answer
> ```sql
> SELECT I.InvoiceNumber, I.InvoiceTotal, L.StartDate
> FROM Invoice I
> INNER JOIN Lease L ON I.LeaseNumber = L.LeaseNumber;
> ```
>
> *32 rows*

**6.** Write a SELECT statement that displays the InvoiceNumber, AddOnDescription, QuantitySold, and InvoiceAddOnCost by joining the InvoiceItem and OfficeAddOn tables.

> [!success]- Answer
> ```sql
> SELECT II.InvoiceNumber, OAO.AddOnDescription, II.QuantitySold, II.InvoiceAddOnCost
> FROM InvoiceItem II
> INNER JOIN OfficeAddOn OAO ON II.AddOnNumber = OAO.AddOnNumber;
> ```
>
> *50 rows*

**7.** Write a SELECT statement that displays the DeskHolderID, CompanyName, LeaseNumber, and TotalLeaseCost by joining the DeskHolder and Lease tables.

> [!success]- Answer
> ```sql
> SELECT DH.DeskHolderID, DH.CompanyName, L.LeaseNumber, L.TotalLeaseCost
> FROM DeskHolder DH
> INNER JOIN Lease L ON DH.DeskHolderID = L.DeskHolderID;
> ```
>
> *25 rows*

**8.** Write a SELECT statement that displays the OfficeNumber, OfficeTypeDescription, and MonthlyRent for offices with a MonthlyRent less than 800 by joining the Office and OfficeType tables.

> [!success]- Answer
> ```sql
> SELECT O.OfficeNumber, OT.OfficeTypeDescription, O.MonthlyRent
> FROM Office O
> INNER JOIN OfficeType OT ON O.OfficeTypeCode = OT.OfficeTypeCode
> WHERE O.MonthlyRent < 800;
> ```
>
> *5 rows*

**9.** Write a SELECT statement that displays the InvoiceNumber, InvoiceDate, and TotalLeasePrice for invoices associated with leases whose TotalLeasePrice is greater than 1500 by joining the Invoice and Lease tables.

> [!success]- Answer
> ```sql
> SELECT I.InvoiceNumber, I.InvoiceDate, L.TotalLeasePrice
> FROM Invoice I
> INNER JOIN Lease L ON I.LeaseNumber = L.LeaseNumber
> WHERE L.TotalLeasePrice > 1500;
> ```
>
> *11 rows*

**10.** Write a SELECT statement that displays the LeaseNumber, a column called "Desk Holder Name" (FirstName and LastName combined), the OfficeNumber, and the MonthlyRent by joining the Lease, DeskHolder, and Office tables.

> [!success]- Answer
> ```sql
> SELECT L.LeaseNumber,
>        DH.FirstName || ' ' || DH.LastName AS "Desk Holder Name",
>        O.OfficeNumber,
>        O.MonthlyRent
> FROM Lease L
> INNER JOIN DeskHolder DH ON L.DeskHolderID = DH.DeskHolderID
> INNER JOIN Office O ON L.OfficeNumber = O.OfficeNumber;
> ```
>
> *25 rows*

**11.** Write a SELECT statement that displays the InvoiceNumber, LeaseNumber, AddOnDescription, and QuantitySold by joining the Invoice, InvoiceItem, and OfficeAddOn tables, sorted by InvoiceNumber.

> [!success]- Answer
> ```sql
> SELECT I.InvoiceNumber, I.LeaseNumber, OAO.AddOnDescription, II.QuantitySold
> FROM Invoice I
> INNER JOIN InvoiceItem II ON I.InvoiceNumber = II.InvoiceNumber
> INNER JOIN OfficeAddOn OAO ON II.AddOnNumber = OAO.AddOnNumber
> ORDER BY I.InvoiceNumber;
> ```
>
> *50 rows*

**12.** Write a SELECT statement that displays the DeskHolderID, a "Desk Holder Name" column, the ReferralSourceDescription, and the LeaseTypeDescription for every lease by joining DeskHolder, ReferralSource, Lease, and LeaseType.

> [!success]- Answer
> ```sql
> SELECT DH.DeskHolderID,
>        DH.FirstName || ' ' || DH.LastName AS "Desk Holder Name",
>        RS.ReferralSourceDescription,
>        LT.LeaseTypeDescription
> FROM DeskHolder DH
> INNER JOIN ReferralSource RS ON DH.ReferralSourceCode = RS.ReferralSourceCode
> INNER JOIN Lease L ON DH.DeskHolderID = L.DeskHolderID
> INNER JOIN LeaseType LT ON L.LeaseTypeNumber = LT.LeaseTypeNumber;
> ```
>
> *25 rows*

## Joins with Aggregates and Outer Joins
Same pattern as the second half of the Day 13 join practice. "For each" means `GROUP BY`; "include ones with none" means an outer join from the parent with `COUNT(child.pk)`.

**1.** Write a SELECT statement that displays the OfficeTypeDescription and the average SquareFootage for each office type by using an INNER JOIN between the Office and OfficeType tables. Group the results by OfficeTypeDescription.

> [!success]- Answer
> ```sql
> SELECT OT.OfficeTypeDescription,
>        AVG(O.SquareFootage) AS "Average Square Footage"
> FROM OfficeType OT
> INNER JOIN Office O ON OT.OfficeTypeCode = O.OfficeTypeCode
> GROUP BY OT.OfficeTypeDescription;
> ```
>
> *5 rows*

**2.** Write a SELECT statement that displays the LeaseTypeDescription and the total number of leases for each lease type using an INNER JOIN between the Lease and LeaseType tables. Sort the results from highest to lowest number of leases.

> [!success]- Answer
> ```sql
> SELECT LT.LeaseTypeDescription,
>        COUNT(L.LeaseNumber) AS "Number of Leases"
> FROM LeaseType LT
> INNER JOIN Lease L ON LT.LeaseTypeNumber = L.LeaseTypeNumber
> GROUP BY LT.LeaseTypeDescription
> ORDER BY "Number of Leases" DESC;
> ```
>
> *6 rows*

**3.** Write a SELECT statement that displays the DeskHolderID, FirstName, LastName, and the total TotalLeasePrice of their leases using an INNER JOIN between the DeskHolder and Lease tables. Group the results by DeskHolderID, FirstName, and LastName.

> [!success]- Answer
> ```sql
> SELECT DH.DeskHolderID, DH.FirstName, DH.LastName,
>        SUM(L.TotalLeasePrice) AS "Total Lease Price"
> FROM DeskHolder DH
> INNER JOIN Lease L ON DH.DeskHolderID = L.DeskHolderID
> GROUP BY DH.DeskHolderID, DH.FirstName, DH.LastName;
> ```
>
> *22 rows*

**4.** Write a SELECT statement that displays the AddOnDescription and the total quantity sold for each add-on using an INNER JOIN between InvoiceItem and OfficeAddOn. Group the results by AddOnDescription.

> [!success]- Answer
> ```sql
> SELECT OAO.AddOnDescription,
>        SUM(II.QuantitySold) AS "Total Quantity Sold"
> FROM InvoiceItem II
> INNER JOIN OfficeAddOn OAO ON II.AddOnNumber = OAO.AddOnNumber
> GROUP BY OAO.AddOnDescription;
> ```
>
> *9 rows*

**5.** Write a SELECT statement that displays the InvoiceNumber and the total InvoiceAddOnPrice of its items for each invoice using an INNER JOIN between Invoice and InvoiceItem. Group the results by InvoiceNumber.

> [!success]- Answer
> ```sql
> SELECT I.InvoiceNumber,
>        SUM(II.InvoiceAddOnPrice) AS "Total Add-On Price"
> FROM Invoice I
> INNER JOIN InvoiceItem II ON I.InvoiceNumber = II.InvoiceNumber
> GROUP BY I.InvoiceNumber;
> ```
>
> *32 rows*

**6.** Write a SELECT statement that displays all OfficeTypeDescription values and the average MonthlyRent of the offices in each type using a LEFT OUTER JOIN between OfficeType and Office. Include office types even if they currently have no offices assigned.

> [!success]- Answer
> ```sql
> SELECT OT.OfficeTypeDescription,
>        AVG(O.MonthlyRent) AS "Average Monthly Rent"   -- NULL for a type with no offices
> FROM OfficeType OT
> LEFT OUTER JOIN Office O ON OT.OfficeTypeCode = O.OfficeTypeCode
> GROUP BY OT.OfficeTypeDescription;
> ```
>
> *6 rows*

**7.** Write a SELECT statement that displays all desk holders (DeskHolderID, FirstName, LastName) and the number of leases each one has using a LEFT OUTER JOIN between DeskHolder and Lease. Include desk holders with no leases.

> [!success]- Answer
> ```sql
> SELECT DH.DeskHolderID, DH.FirstName, DH.LastName,
>        COUNT(L.LeaseNumber) AS "Number of Leases"   -- COUNT(child.pk) gives 0, COUNT(*) would give 1
> FROM DeskHolder DH
> LEFT OUTER JOIN Lease L ON DH.DeskHolderID = L.DeskHolderID
> GROUP BY DH.DeskHolderID, DH.FirstName, DH.LastName;
> ```
>
> *50 rows*

**8.** Write a SELECT statement that displays all LeaseTypeDescription values and the total TotalLeasePrice for each lease type using a LEFT OUTER JOIN between LeaseType and Lease. Include lease types with no leases.

> [!success]- Answer
> ```sql
> SELECT LT.LeaseTypeDescription,
>        SUM(L.TotalLeasePrice) AS "Total Lease Price"
> FROM LeaseType LT
> LEFT OUTER JOIN Lease L ON LT.LeaseTypeNumber = L.LeaseTypeNumber
> GROUP BY LT.LeaseTypeDescription;
> ```
>
> *9 rows*

**9.** Write a SELECT statement that displays all leases and any matching invoices using a LEFT OUTER JOIN between Lease and Invoice. Display the LeaseNumber, InvoiceNumber, and InvoiceTotal. Include leases that have not been invoiced yet.

> [!success]- Answer
> ```sql
> SELECT L.LeaseNumber, I.InvoiceNumber, I.InvoiceTotal
> FROM Lease L
> LEFT OUTER JOIN Invoice I ON L.LeaseNumber = I.LeaseNumber;
> ```
>
> *38 rows*

**10.** Write a SELECT statement that displays all office add-ons and the total quantity sold of each using a LEFT OUTER JOIN between OfficeAddOn and InvoiceItem. Include add-ons that have never been sold.

> [!success]- Answer
> ```sql
> SELECT OAO.AddOnDescription,
>        SUM(II.QuantitySold) AS "Total Quantity Sold"
> FROM OfficeAddOn OAO
> LEFT OUTER JOIN InvoiceItem II ON OAO.AddOnNumber = II.AddOnNumber
> GROUP BY OAO.AddOnDescription;
> ```
>
> *14 rows*

**11.** Write a SELECT statement that displays all office types and the number of offices in each type, but write it as a RIGHT OUTER JOIN with Office listed first and OfficeType listed second.

> [!success]- Answer
> ```sql
> SELECT OT.OfficeTypeDescription,
>        COUNT(O.OfficeNumber) AS "Number of Offices"
> FROM Office O
> RIGHT OUTER JOIN OfficeType OT ON O.OfficeTypeCode = OT.OfficeTypeCode   -- RIGHT keeps all of OfficeType
> GROUP BY OT.OfficeTypeDescription;
> ```
>
> *6 rows*

## Subqueries
A subquery is a SELECT in brackets that runs first. One value → `=` `>` `<`; a list → `IN` / `NOT IN`; other comparisons against a list → `ANY` / `ALL`. See [[Counting, Subqueries and Views]].

**1.** Write a SELECT statement that displays the OfficeNumber and SquareFootage for offices whose SquareFootage is less than the average SquareFootage of all offices.

> [!success]- Answer
> ```sql
> SELECT OfficeNumber, SquareFootage
> FROM Office
> WHERE SquareFootage < (SELECT AVG(SquareFootage) FROM Office);
> ```
>
> *17 rows*

**2.** Write a SELECT statement that displays the DeskHolderID, FirstName, and LastName of desk holders whose ReferralSourceCode matches the ReferralSourceCode for the referral source description 'Google Ads'.

> [!success]- Answer
> ```sql
> SELECT DeskHolderID, FirstName, LastName
> FROM DeskHolder
> WHERE ReferralSourceCode = (SELECT ReferralSourceCode
>                             FROM ReferralSource
>                             WHERE ReferralSourceDescription = 'Google Ads');
> ```
>
> *3 rows*

**3.** Write a SELECT statement that displays the LeaseNumber and TotalLeaseCost for leases whose TotalLeaseCost is greater than the average TotalLeaseCost of all leases.

> [!success]- Answer
> ```sql
> SELECT LeaseNumber, TotalLeaseCost
> FROM Lease
> WHERE TotalLeaseCost > (SELECT AVG(TotalLeaseCost) FROM Lease);
> ```
>
> *6 rows*

**4.** Write a SELECT statement that displays the InvoiceNumber and InvoiceTotal for invoices whose InvoiceTotal equals the lowest InvoiceTotal in the Invoice table.

> [!success]- Answer
> ```sql
> SELECT InvoiceNumber, InvoiceTotal
> FROM Invoice
> WHERE InvoiceTotal = (SELECT MIN(InvoiceTotal) FROM Invoice);
> ```
>
> *1 row*

**5.** Write a SELECT statement that displays the InvoiceNumber, AddOnNumber, and QuantitySold for invoice items whose QuantitySold is greater than the average QuantitySold of all invoice items.

> [!success]- Answer
> ```sql
> SELECT InvoiceNumber, AddOnNumber, QuantitySold
> FROM InvoiceItem
> WHERE QuantitySold > (SELECT AVG(QuantitySold) FROM InvoiceItem);
> ```
>
> *16 rows*

**6.** Write a SELECT statement that displays the OfficeNumber and MonthlyRent for offices whose OfficeTypeCode matches the OfficeTypeCode of the office type description 'Double Office'.

> [!success]- Answer
> ```sql
> SELECT OfficeNumber, MonthlyRent
> FROM Office
> WHERE OfficeTypeCode = (SELECT OfficeTypeCode
>                         FROM OfficeType
>                         WHERE OfficeTypeDescription = 'Double Office');
> ```
>
> *3 rows*

**7.** Write a SELECT statement that displays the LeaseNumber, StartDate, and TotalLeasePrice for leases associated with offices that have a meeting table (MeetingTableYN = 'Y').

> [!success]- Answer
> ```sql
> SELECT LeaseNumber, StartDate, TotalLeasePrice
> FROM Lease
> WHERE OfficeNumber IN (SELECT OfficeNumber
>                        FROM Office
>                        WHERE MeetingTableYN = 'Y');
> ```
>
> *11 rows*

**8.** Write a SELECT statement that displays the InvoiceNumber and InvoiceDate for invoices associated with leases belonging to the desk holder with DeskHolderID 'LOB001'.

> [!success]- Answer
> ```sql
> SELECT InvoiceNumber, InvoiceDate
> FROM Invoice
> WHERE LeaseNumber IN (SELECT LeaseNumber
>                       FROM Lease
>                       WHERE DeskHolderID = 'LOB001');
> ```
>
> *1 row*

**9.** Write a SELECT statement that displays the OfficeNumber, MonthlyRent, and SquareFootage of offices that currently have at least one lease recorded in the Lease table.

> [!success]- Answer
> ```sql
> SELECT OfficeNumber, MonthlyRent, SquareFootage
> FROM Office
> WHERE OfficeNumber IN (SELECT OfficeNumber FROM Lease);
> ```
>
> *16 rows*

**10.** Write a SELECT statement that displays the LeaseTypeNumber and LeaseTypeDescription for lease types that have never appeared in the Lease table using a subquery.

> [!success]- Answer
> ```sql
> SELECT LeaseTypeNumber, LeaseTypeDescription
> FROM LeaseType
> WHERE LeaseTypeNumber NOT IN (SELECT LeaseTypeNumber FROM Lease);
> ```
>
> *3 rows*

**11.** Write a SELECT statement that displays the AddOnDescription and CurrentPrice for add-ons whose CurrentPrice is greater than the CurrentPrice of any add-on whose description contains 'Photocopy' (use ANY).

> [!success]- Answer
> ```sql
> SELECT AddOnDescription, CurrentPrice
> FROM OfficeAddOn
> WHERE CurrentPrice > ANY (SELECT CurrentPrice
>                           FROM OfficeAddOn
>                           WHERE AddOnDescription LIKE '%Photocopy%');
> ```
>
> *12 rows*

**12.** Write a SELECT statement that displays the AddOnDescription and CurrentPrice for add-ons whose CurrentPrice is greater than the CurrentPrice of every add-on whose description contains 'Photocopy' (use ALL).

> [!success]- Answer
> ```sql
> SELECT AddOnDescription, CurrentPrice
> FROM OfficeAddOn
> WHERE CurrentPrice > ALL (SELECT CurrentPrice
>                           FROM OfficeAddOn
>                           WHERE AddOnDescription LIKE '%Photocopy%');
> ```
>
> *11 rows*

**13.** Write a SELECT statement that displays the OfficeTypeCode that has the most offices, using GROUP BY, HAVING, and ALL.

> [!success]- Answer
> ```sql
> SELECT OfficeTypeCode
> FROM Office
> GROUP BY OfficeTypeCode
> HAVING COUNT(OfficeNumber) >= ALL (SELECT COUNT(OfficeNumber)   -- >= ALL means "at least as big as every group"
>                                    FROM Office
>                                    GROUP BY OfficeTypeCode);
> ```
>
> *1 row*

## UNION
Same number of columns, similar datatypes, column names come from the first query, and `ORDER BY` goes at the very end. `UNION` removes duplicates; `UNION ALL` keeps them.

**1.** Write a SELECT statement that displays all AddOnNumber values from the OfficeAddOn table and all LeaseTypeNumber values from the LeaseType table in a single column called "Number List" using UNION.

> [!success]- Answer
> ```sql
> SELECT AddOnNumber AS "Number List"
> FROM OfficeAddOn
> UNION
> SELECT LeaseTypeNumber
> FROM LeaseType;
> ```
>
> *14 rows*

**2.** Write a SELECT statement that displays all LastName values from the DeskHolder table and all OfficeTypeDescription values from the OfficeType table in a single column called "Name List" using UNION.

> [!success]- Answer
> ```sql
> SELECT LastName AS "Name List"
> FROM DeskHolder
> UNION
> SELECT OfficeTypeDescription
> FROM OfficeType;
> ```
>
> *56 rows*

**3.** Write a SELECT statement that displays all unique LeaseTypeDescription values and OfficeTypeDescription values in a single result set using UNION.

> [!success]- Answer
> ```sql
> SELECT LeaseTypeDescription AS "Description"
> FROM LeaseType
> UNION
> SELECT OfficeTypeDescription
> FROM OfficeType;
> ```
>
> *15 rows*

**4.** Write a SELECT statement that displays all OfficeNumber values for offices with a SquareFootage greater than 300 and all OfficeNumber values from leases with a TotalLeasePrice greater than 500 using UNION.

> [!success]- Answer
> ```sql
> SELECT OfficeNumber
> FROM Office
> WHERE SquareFootage > 300
> UNION
> SELECT OfficeNumber
> FROM Lease
> WHERE TotalLeasePrice > 500;
> ```
>
> *13 rows*

**5.** Write a SELECT statement that displays all FirstName values from the DeskHolder table and all ReferralSourceDescription values from the ReferralSource table sorted alphabetically using UNION.

> [!success]- Answer
> ```sql
> SELECT FirstName AS "Name or Description"
> FROM DeskHolder
> UNION
> SELECT ReferralSourceDescription
> FROM ReferralSource
> ORDER BY "Name or Description";   -- ORDER BY only after the last query
> ```
>
> *67 rows*

**6.** Write a SELECT statement that displays all InvoiceNumber values from the Invoice table and all InvoiceNumber values from the InvoiceItem table using UNION ALL.

> [!success]- Answer
> ```sql
> SELECT InvoiceNumber
> FROM Invoice
> UNION ALL
> SELECT InvoiceNumber
> FROM InvoiceItem;   -- keeps every duplicate: 32 + 50 rows
> ```
>
> *82 rows*

**7.** Write a SELECT statement that displays all LeaseNumber values from the Lease table and all LeaseNumber values from the Invoice table using UNION. Explain why duplicate values are removed.

> [!success]- Answer
> ```sql
> SELECT LeaseNumber
> FROM Lease
> UNION
> SELECT LeaseNumber
> FROM Invoice;
> -- UNION returns only unique rows. A lease with several invoices appears many times in Invoice,
> -- and every invoiced lease also appears in Lease, so the repeats collapse into one row each.
> ```
>
> *25 rows*

**8.** Write a SELECT statement that displays all unique years from the StartDate column in the Lease table and all unique years from the InvoiceDate column in the Invoice table using UNION.

> [!success]- Answer
> ```sql
> SELECT Date_Part('year', StartDate) AS "Year"
> FROM Lease
> UNION
> SELECT Date_Part('year', InvoiceDate)
> FROM Invoice;
> ```
>
> *5 rows*

**9.** Write a SELECT statement that displays all OfficeNumber values from offices with WindowStatus = 'F' and all OfficeNumber values from leases with TotalLeaseCost greater than 1000 using UNION ALL.

> [!success]- Answer
> ```sql
> SELECT OfficeNumber
> FROM Office
> WHERE WindowStatus = 'F'
> UNION ALL
> SELECT OfficeNumber
> FROM Lease
> WHERE TotalLeaseCost > 1000;
> ```
>
> *18 rows*

**10.** Write a SELECT statement that displays all CompanyName values from the DeskHolder table and all AddOnDescription values from the OfficeAddOn table in a single column called "Names and Descriptions". Exclude NULL company names from the results.

> [!success]- Answer
> ```sql
> SELECT CompanyName AS "Names and Descriptions"
> FROM DeskHolder
> WHERE CompanyName IS NOT NULL
> UNION
> SELECT AddOnDescription
> FROM OfficeAddOn;
> ```
>
> *36 rows*

## Query Patterns (Counting, Never Happened, Most, Views)
Practice for each pattern in [[Query Patterns Reference]].

**1.** **How many per ___ (for all):** Write a SELECT statement that displays the LeaseNumber, StartDate, and the number of invoices each lease has. Include leases that have no invoices (they should show 0).

> [!success]- Answer
> ```sql
> SELECT L.LeaseNumber, L.StartDate,
>        COUNT(I.InvoiceNumber) AS "Number of Invoices"
> FROM Lease L
> LEFT OUTER JOIN Invoice I ON L.LeaseNumber = I.LeaseNumber
> GROUP BY L.LeaseNumber, L.StartDate;
> ```
>
> *25 rows*

**2.** **More than N times:** Write a SELECT statement that displays the AddOnNumber and AddOnDescription of add-ons that appear on more than 5 invoice lines.

> [!success]- Answer
> ```sql
> SELECT OAO.AddOnNumber, OAO.AddOnDescription
> FROM OfficeAddOn OAO
> INNER JOIN InvoiceItem II ON OAO.AddOnNumber = II.AddOnNumber
> GROUP BY OAO.AddOnNumber, OAO.AddOnDescription
> HAVING COUNT(*) > 5;
> ```
>
> *5 rows*

**3.** **Never happened (outer join):** Write a SELECT statement that displays the ReferralSourceCode and ReferralSourceDescription of referral sources that no desk holder has ever used. Use a LEFT OUTER JOIN.

> [!success]- Answer
> ```sql
> SELECT RS.ReferralSourceCode, RS.ReferralSourceDescription
> FROM ReferralSource RS
> LEFT OUTER JOIN DeskHolder DH ON RS.ReferralSourceCode = DH.ReferralSourceCode
> WHERE DH.ReferralSourceCode IS NULL;
> ```
>
> *2 rows*

**4.** **Never happened (subquery):** Write the same query again — referral sources no desk holder has ever used — but you must use a subquery.

> [!success]- Answer
> ```sql
> SELECT RS.ReferralSourceCode, RS.ReferralSourceDescription
> FROM ReferralSource RS
> WHERE RS.ReferralSourceCode NOT IN (SELECT DH.ReferralSourceCode FROM DeskHolder DH);
> ```
>
> *2 rows*

**5.** **The one with the most (simple):** Write a SELECT statement that displays the AddOnDescription of the add-on that appears on the most invoice lines. Show only one row.

> [!success]- Answer
> ```sql
> SELECT OAO.AddOnDescription
> FROM OfficeAddOn OAO
> INNER JOIN InvoiceItem II ON OAO.AddOnNumber = II.AddOnNumber
> GROUP BY OAO.AddOnNumber, OAO.AddOnDescription
> ORDER BY COUNT(*) DESC
> LIMIT 1;
> ```
>
> *1 row*

**6.** **The one with the most (handles ties):** Write a SELECT statement that displays the AddOnDescription of the add-on that appears on the most invoice lines. If two add-ons tie, show both.

> [!success]- Answer
> ```sql
> SELECT OAO.AddOnDescription
> FROM OfficeAddOn OAO
> INNER JOIN InvoiceItem II ON OAO.AddOnNumber = II.AddOnNumber
> GROUP BY OAO.AddOnNumber, OAO.AddOnDescription
> HAVING COUNT(*) = (
>     SELECT MAX(Counts.Total)
>     FROM (SELECT COUNT(*) AS Total
>           FROM InvoiceItem
>           GROUP BY AddOnNumber) Counts
> );
> ```
>
> *3 rows*

**7.** **One row, many tables:** Write a SELECT statement that displays, for LeaseNumber 113, the LeaseNumber, StartDate, a "Desk Holder Name" column, the OfficeNumber, the OfficeTypeDescription, and the LeaseTypeDescription.

> [!success]- Answer
> ```sql
> SELECT L.LeaseNumber, L.StartDate,
>        DH.FirstName || ' ' || DH.LastName AS "Desk Holder Name",
>        O.OfficeNumber,
>        OT.OfficeTypeDescription,
>        LT.LeaseTypeDescription
> FROM Lease L
> INNER JOIN DeskHolder DH ON L.DeskHolderID = DH.DeskHolderID
> INNER JOIN Office O ON L.OfficeNumber = O.OfficeNumber
> INNER JOIN OfficeType OT ON O.OfficeTypeCode = OT.OfficeTypeCode
> INNER JOIN LeaseType LT ON L.LeaseTypeNumber = LT.LeaseTypeNumber
> WHERE L.LeaseNumber = 113;
> ```
>
> *1 row*

**8.** **Calculated column:** Write a SELECT statement that displays the InvoiceNumber, AddOnNumber, QuantitySold, and a calculated column called "Line Profit" equal to (InvoiceAddOnPrice - InvoiceAddOnCost) multiplied by QuantitySold.

> [!success]- Answer
> ```sql
> SELECT II.InvoiceNumber, II.AddOnNumber, II.QuantitySold,
>        (II.InvoiceAddOnPrice - II.InvoiceAddOnCost) * II.QuantitySold AS "Line Profit"
> FROM InvoiceItem II;
> ```
>
> *50 rows*

**9.** **Create a view:** Create a view called LeaseOfficeView that shows the LeaseNumber, a "Desk Holder Name" column, the OfficeNumber, and the MonthlyRent for every lease.

> [!success]- Answer
> ```sql
> DROP VIEW IF EXISTS LeaseOfficeView;
> ```
>
> ```sql
> CREATE VIEW LeaseOfficeView AS
> SELECT L.LeaseNumber,
>        DH.FirstName || ' ' || DH.LastName AS "Desk Holder Name",
>        O.OfficeNumber,
>        O.MonthlyRent
> FROM Lease L
> INNER JOIN DeskHolder DH ON L.DeskHolderID = DH.DeskHolderID
> INNER JOIN Office O ON L.OfficeNumber = O.OfficeNumber;
> ```

**10.** **Using the view:** Write a SELECT statement that uses LeaseOfficeView to display the LeaseNumber and "Desk Holder Name" for leases with a MonthlyRent over 1000.

> [!success]- Answer
> ```sql
> SELECT LeaseNumber, "Desk Holder Name"
> FROM LeaseOfficeView
> WHERE MonthlyRent > 1000;
> ```
>
> *12 rows*

