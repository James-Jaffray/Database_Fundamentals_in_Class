-- use The Monthly Desk tables
DROP VIEW IF EXISTS VW_OFFICETYPERENTSUMMARY;

DROP VIEW IF EXISTS VW_REFERRALDESKHOLDERCOUNT;

DROP VIEW IF EXISTS VW_LEASETYPETOTALS;

DROP VIEW IF EXISTS VW_INVOICETOTALS;

DROP VIEW IF EXISTS VW_OFFICESQUAREFOOTAGE;

DROP VIEW IF EXISTS VW_LEASEYEARSUMMARY;

DROP VIEW IF EXISTS VW_ADDONSALESSUMMARY;

DROP VIEW IF EXISTS VW_PAIDINVOICESUMMARY;

DROP VIEW IF EXISTS VW_DESKHOLDERLEASETOTALS;

DROP VIEW IF EXISTS VW_OFFICEWINDOWSUMMARY;




-- 1. Create a view named VW_OfficeTypeRentSummary that displays the OfficeTypeDescription and the average MonthlyRent for each office type. Write a Select statement to display all records from the view.

DROP VIEW IF EXISTS VW_OFFICETYPERENTSUMMARY;
CREATE VIEW VW_OFFICETYPErentsummary as 
select OT.officetypedescription, AVG(O.MONTHLYRENT) AS "AVERAGE MONTHLY RENT"
FROM OFFICETYPE OT
INNER JOIN OFFICE O
ON OT.OFFICETYPECODE = O.OFFICETYPECODE
GROUP BY OT.OFFICETYPEDESCRIPTION;

SELECT OFFICETYPEDESCRIPTION, "AVERAGE MONTHLY RENT"
FROM VW_OFFICETYPErentsummary;

-- 2. Create a view named VW_ReferralDeskHolderCount that displays the ReferralSourceDescription and the total number of desk holders for each referral source. Write a Select statement to display referral sources with more than 5 desk holders.

CREATE VIEW VW_ReferralDeskHolderCount as 
select RS.REFERRALSOURCEPEDESCRIPTION, COUNT(DH.DESKHOLDERID) AS "TOTAL DESK HOLDERS"
FROM REFERRALSOURCE RS
INNER JOIN DESKHOLDER DH
ON RS.REFERRALSOURCECODE = DH.REFERRALSOURCECODE
GROUP BY RS.REFERRALSOURCEPEDESCRIPTION;

SELECT REFERRALSOURCEDESCRIPTION, "TOTAL DESK HOLDERS"
FROM VW_ReferralDeskHolderCount
WHERE "TOTAL DESK HOLDERS" > 5;



-- 3. Create a view named VW_LeaseTypeTotals that displays the LeaseTypeDescription and the average TotalLeasePrice for each lease type. Write a Select statement to sort the results from highest average lease price to lowest.

CREATE VIEW VW_LEASETYPETOTALS
AS
SELECT LT.EASETYPEDESCRIPTION, AVG(L.TOTALLEASEPRICE) AS "AVERAGE LEASE PRICE"
FROM LEASETYPE LT
INNER JOIN LEASE L
ON LT.LEASETYPENUMBER = L.LEASETYPENUMBER
GROUP BY LT.LEASETYPEDESCRIPTION;

SELECT LEASETYPEDESCRIPTION, "AVERAGE LEASE PRICE"
FROM VW_LEASETYPETOTALS
ORDER BY "AVERAGE LEASE PRICE" DESC;

-- 4. Create a view named VW_InvoiceTotals that displays the InvoiceNumber and the total InvoiceAddOnPrice for each invoice using the InvoiceItem table. Write a Select statement to display invoices where the total exceeds 500.

-- 5. Create a view named VW_OfficeSquareFootage that displays the OfficeTypeDescription and the average SquareFootage for each office type. Write a Select statement to display office types with an average square footage greater than 300.

-- 6. Create a view named VW_LeaseYearSummary that displays the lease year and the number of leases started in each year. Write a Select statement to display all records sorted by lease year.

-- 7. Create a view named VW_AddOnSalesSummary that displays the AddOnDescription and the total QuantitySold for each add-on. Write a Select statement to display add-ons where more than 10 units have been sold.

-- 8. Create a view named VW_PaidInvoiceSummary that displays the PaidYN value and the average InvoiceTotal for each payment status. Write a Select statement to display all records from the view.

-- 9. Create a view named VW_DeskHolderLeaseTotals that displays each DeskHolderID and the total TotalLeasePrice for all leases associated with that desk holder. Write a Select statement to display desk holders whose total lease price exceeds 2000.

-- 10. Create a view named VW_OfficeWindowSummary that displays the WindowStatus and the total number of offices for each window status. Write a Select statement to display all records from the view.
