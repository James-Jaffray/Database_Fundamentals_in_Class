-- use The Monthly Desk tables

-- 1. Write an UPDATE statement to increase the MonthlyRent by 10% for all offices with an OfficeTypeCode of 1.

UPDATE OFFICE
SET MONTHLYRENT = MONTHLYRENT * 1.10
WHERE OFFICETYPECODE = 1;

-- 2. Write an UPDATE statement to change the WindowStatus to 'O' for OfficeNumber 223.

UPDATE OFFICE
SET WINDOWSTATUS = 'O'
WHERE OFFICENUMBER = 223;

-- 3. Write an UPDATE statement to set the BookShelfYN value to 'Y' for all offices with a SquareFootage greater than 400.

UPDATE OFFICE
SET BookShelfYN = 'Y'
WHERE SquareFootage > 400;

-- 4. Write an UPDATE statement to change the ReferralSourceCode to 14 for all desk holders currently using ReferralSourceCode 16.

UPDATE DESKHOLDER
SET ReferralSourceCode = 14
WHERE ReferralSourceCode = 16;

-- 5. Write an UPDATE statement to increase the CurrentPrice of all OfficeAddOn records by 5% where the CurrentCost is greater than 20.

UPDATE OFFICEADDON
SET CURRENTPRICE = CURRENTPRICE * 1.05
WHERE CURRENTCOST > 20;

-- 6. Write an UPDATE statement to change the LeaseTypeNumber to 5 for all leases that currently have LeaseTypeNumber 4 and a TotalLeasePrice greater than 1000.

UPDATE LEASE
SET LeaseTypeNumber = 5
WHERE LeaseTypeNumber = 4 AND TotalLeasePrice > 1000;

-- 7. Write an UPDATE statement that uses a subquery to set the OfficeTypeCode to the code for 'Office Suite' for OfficeNumber 210.

UPDATE OFFICE
SET OfficeTypeCode = (SELECT OFFICETYPECODE FROM OFFICETYPE WHERE OFFICETYPEDESCRIPTION = 'Office Suite')
WHERE OFFICENUMBER = 210;


-- 8. Write an UPDATE statement that uses information from multiple tables to increase the InvoiceAddOnPrice by 10 
-- for all invoice items associated with invoices belonging to DeskHolderID 'BUR001'.

UPDATE INVOICEITEM
SET
	INVOICEADDONPRICE = INVOICEADDONPRICE + 10
WHERE
	INVOICENUMBER IN (
		SELECT
			I.INVOICENUMBER
		FROM
			INVOICE I
			INNER JOIN LEASE L ON I.LEASENUMBER = L.LEASENUMBER
		WHERE
			L.DESKHOLDERID = 'BUR001'
	);
-- 9. Write an UPDATE statement using the FROM clause that increases the MonthlyRent by 200 for all offices leased by desk holders whose ReferralSourceCode is 14.
--    Use the Office, Lease, and DeskHolder tables.

UPDATE OFFICE O
SET MONTHLYRENT = O.MONTHLYRENT + 200
FROM LEASE L
INNER JOIN DESKHOLDER DH ON DH.DESKHOLDERID = L.DESKHOLDERID
WHERE O.OFFICENUMBER = L.OFFICENUMBER AND DH.REFERRALSOURCECODE = 14;

-- 10. Write an UPDATE statement using the FROM clause that changes the PaidYN value to 'Y' for all invoices associated with
--     leases that have a LeaseTypeDescription of 'One Year'. Use the Invoice, Lease, and LeaseType tables.

UPDATE INVOICE I
SET PaidYN = 'Y'
FROM LEASE L
INNER JOIN LEASETYPE LT ON L.LEASETYPENUMBER = LT.LEASETYPENUMBER
WHERE I.LEASENUMBER = L.LEASENUMBER AND LT.LeaseTypeDescription = 'One Year';



-- use The Monthly Desk tables

-- 1. Write a DELETE statement to remove the office add-on with an AddOnNumber of 14.
DELETE FROM OFFICEADDON
WHERE AddOnNumber = 4;

-- 2. Write a DELETE statement to remove all offices with a MonthlyRent of $1,150.

DELETE FROM OFFICE
WHERE MONTHLYRENT = 1150;

-- 3. Write a DELETE statement to remove the ReferralSourceCode of 18.

DELETE FROM REFERRALSOURCE
WHERE ReferralSourceCode = 18;

-- 4. Write a DELETE statement to remove all leases with a LeaseNumber of 241 or 247.

DELETE FROM LEASE
WHERE LEASENUMBER IN (241, 247);

-- 5. Write a DELETE statement to remove all invoice items where QuantitySold is greater than 20.

DELETE FROM INVOICEITEM
WHERE QuantitySold > 20;

-- 6. Delete all referral sources that are not currently referenced by any desk holder.
--    Use a subquery to identify referral sources that are safe to remove.

DELETE FROM REFERRALSOURCE
WHERE REFERRALSOURCECODE NOT IN (SELECT REFERRALSOURCECODE FROM DESKHOLDER);

-- 7. Delete all lease types that are not currently referenced by a lease.
--    Use a subquery to identify lease types that are safe to remove.

DELETE FROM LEASETYPE
WHERE LEASETYPENUMBER NOT IN (SELECT LEASETYPENUMBER FROM LEASE);

-- 8. Write a DELETE statement using subqueries to remove all invoices and their invoice items associated with all Leases belonging to DeskHolderID 'WIL001'.

DELETE FROM INVOICEITEM
WHERE INVOICENUMBER IN (SELECT INVOICENUMBER FROM INVOICE WHERE INVOICENUMBER IN
(SELECT INVOICENUMBER FROM LEASE WHERE DESKHOLDERID = 'WIL001'));

-- 9. Write a DELETE statement using the USING clause to remove invoice items associated with invoices that belong to LeaseNumber 168. Use the InvoiceItem and Invoice tables.

DELETE FROM INVOICEITEM II
USING INVOICE I
WHERE II.INVOICENUMBER = I.INVOICENUMBER AND I.LEASENUMBER = 168;

-- 10. Write a DELETE statement using the USING clause to remove leases associated with desk holders
--     whose ReferralSourceDescription is 'Search Engine'. Use the Lease, DeskHolder, and ReferralSource tables.

DELETE FROM LEASE L
USING DESKHOLDER DH, REFERRALSOURCE RS
WHERE DH.DESKHOLDERID = L.DESKHOLDERID AND
DH.REFERRALSOURCECODE = RS.REFERRALSOURCECODE AND
RS.REFERRALSOURCEDESCRIPTION = 'Search Engine';

