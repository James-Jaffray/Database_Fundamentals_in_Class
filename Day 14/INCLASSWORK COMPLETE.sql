-- use The Monthly Desk tables --Subqueries Practice Exercises

-- 1. Write a SELECT statement that displays the OfficeNumber and MonthlyRent for offices whose MonthlyRent is greater than the average MonthlyRent of all offices.

SELECT OFFICENUMBER, MONTHLYRENT
FROM OFFICE
WHERE MONTHLYRENT > (SELECT AVG(MONTHLYRENT) FROM OFFICE);

-- 2. Write a SELECT statement that displays the DeskHolderID, FirstName, and LastName of desk holders whose ReferralSourceCode matches the ReferralSourceCode for the referral source description 'Website'.

SELECT DESKHOLDERID, FIRSTNAME, LASTNAME
FROM DESKHOLDER
WHERE REFERRALSOURCECODE = (SELECT REFERRALSOURCECODE FROM REFERRALSOURCE WHERE REFERRALSOURCEDESCRIPTION = 'WEBSITE');

-- 3. Write a SELECT statement that displays the LeaseNumber and TotalLeasePrice for leases whose TotalLeasePrice is greater than the average TotalLeasePrice of all leases.

SELECT LEASENUMBER, TOTALLEASEPRICE
FROM LEASE
WHERE TOTALLEASEPRICE > (SELECT AVG(TOTALLEASEPRICE) FROM LEASE);

-- 4. Write a SELECT statement that displays the InvoiceNumber and InvoiceTotal for invoices whose InvoiceTotal equals the highest InvoiceTotal in the Invoice table.

SELECT INVOICENUMBER, INVOICETOTAL
FROM INVOICE
WHERE INVOICETOTAL = (SELECT MAX(INVOICETOTAL) FROM INVOICE);

-- 5. Write a SELECT statement that displays the AddOnDescription and CurrentPrice for office add-ons whose CurrentPrice is greater than the average CurrentPrice of all add-ons.

SELECT ADDONDESCRIPTION, CURRENTPRICE
FROM OFFICEADDON
WHERE CURRENTPRICE > (SELECT AVG(CURRENTPRICE) FROM OFFICEADDON);


-- 6. Write a SELECT statement that displays the OfficeNumber and SquareFootage for offices whose OfficeTypeCode matches the OfficeTypeCode of the office type description 'Executive Office'.

SELECT
	OFFICENUMBER,
	SQUAREFOOTAGE
FROM
	OFFICE
WHERE
	OFFICETYPECODE = (
		SELECT
			OFFICETYPECODE
		FROM
			OFFICETYPE
		WHERE
			OFFICETYPEDESCRIPTION = 'Executive Office'
	);


-- 7. Write a SELECT statement that displays the LeaseNumber, StartDate, and TotalLeasePrice for leases associated with offices that have a MonthlyRent greater than 1500.

SELECT
	LEASENUMBER,
	STARTDATE,
	TOTALLEASEPRICE
FROM
	LEASE
WHERE
	OFFICENUMBER IN (
		SELECT
			OFFICENUMBER
		FROM
			OFFICE
		WHERE
			MONTHLYRENT > 1500
	);
	
-- 8. Write a SELECT statement that displays the InvoiceNumber and InvoiceDate for invoices associated with leases belonging to the desk holder with DeskHolderID 'ABC123'.

SELECT
	INVOICENUMBER,
	INVOICEDATE
FROM
	INVOICE
WHERE
	LEASENUMBER = (
		SELECT
			LEASENUMBER
		FROM
			LEASE
		WHERE
			DeskHolderID = 'ABC123'
	);
	
-- 9. Write a SELECT statement that displays the DeskHolderID, FirstName, and LastName of desk holders who currently have at least one lease recorded in the Lease table.

SELECT
	DeskHolderID,
	FIRSTNAME,
	LASTNAME
FROM
	DESKHOLDER
WHERE
	DESKHOLDERID IN (
		SELECT
			DESKHOLDERID
		FROM
			LEASE
	);
	
-- 10. Write a SELECT statement that displays the AddOnDescription and CurrentPrice for add-ons that have never appeared in the InvoiceItem table using a subquery.

SELECT
	AddOnDescription,
	CurrentPrice
FROM
	OFFICEADDON
WHERE
	ADDONNUMBER NOT IN (
		SELECT
			ADDONNUMBER
		FROM
			INVOICEITEM
	);

-- use The Monthly Desk tables --Union Practice Exercises

-- 1. Write a Select statement that displays all OfficeNumber values from the Office table and all LeaseNumber values from the Lease table in a single column called "Office or Lease Number" using Union.

SELECT
	OfficeNumber AS "Office or Lease Number"
FROM
	OFFICE
UNION
SELECT
	LeaseNumber
FROM
	LEASE;

-- 2. Write a Select statement that displays all FirstName values from the DeskHolder table and all LeaseTypeDescription values from the LeaseType table in a single column called "Description List" using Union.

SELECT
	FIRSTNAME AS "Description List"
FROM
	DESKHOLDER
UNION
SELECT
	LeaseTypeDescription
FROM
	LEASETYPE;
	
-- 3. Write a Select statement that displays all unique OfficeTypeDescription values and ReferralSourceDescription values in a single result set using Union.

SELECT
	OfficeTypeDescription AS "Description"
FROM
	OFFICETYPE
UNION
SELECT
	ReferralSourceDescription
FROM
	ReferralSource;
	
-- 4. Write a Select statement that displays all OfficeNumber values for offices with MonthlyRent greater than 1500 and all OfficeNumber values from leases with TotalLeasePrice greater than 1000 using Union.

SELECT
	OfficeNumber
FROM
	OFFICE
WHERE MonthlyRent > 1500
UNION
SELECT
	OfficeNumber
FROM
	LEASE
WHERE TotalLeasePrice > 1000;
	
-- 5. Write a Select statement that displays all AddOnDescription values from the OfficeAddOn table and all LeaseTypeDescription values from the LeaseType table sorted alphabetically using Union.

-- 6. Write a Select statement that displays all DeskHolderID values from the DeskHolder table and all LeaseNumber values from the Lease table using Union ALL.

-- 7. Write a Select statement that displays all InvoiceNumber values from the Invoice table and all InvoiceNumber values from the InvoiceItem table using Union. Explain why duplicate values are removed.

-- 8. Write a Select statement that displays all unique years from the StartDate column in the Lease table and all unique years from the InvoiceDate column in the Invoice table using Union.

-- 9. Write a Select statement that displays all OfficeNumber values from offices with WindowStatus = 'O' and all OfficeNumber values from leases with TotalLeaseCost greater than 500 using Union ALL.

-- 10. Write a Select statement that displays all CompanyName values from the DeskHolder table and all OfficeTypeDescription values from the OfficeType table in a single column called "Names and Descriptions". Exclude NULL company names from the results

