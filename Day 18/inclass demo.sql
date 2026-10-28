-- use The Monthly Desk tables
-- 1. Write an INSERT statement to add a new office type with an OfficeTypeCode of 6 and an OfficeTypeDescription of 'Premium Suite'.
INSERT INTO
	OFFICETYPE (OFFICETYPECODE, OFFICETYPEDESCRIPTION)
VALUES
	(6, 'Premium Suite');

-- 2. Write an INSERT statement to add multiple new referral sources in one statement:
--		ReferralSourceCode = 17, ReferralSourceDescription = 'LinkedIn Advertisement'
--		ReferralSourceCode = 18, ReferralSourceDescription = 'Podcast Advertisement'
--		ReferralSourceCode = 19, ReferralSourceDescription = 'Business Conference'
INSERT INTO
	REFERRALSOURCE (REFERRALSOURCECODE, REFERRALSOURCEDESCRIPTION)
VALUES
	(17, 'LinkedIn Advertisement'),
	(18, 'Podcast Advertisement'),
	(19, 'Business Conference');

-- 3. Write an INSERT statement to add a new office using the following values: OfficeNumber = 260, MonthlyRent = 2200, SquareFootage = 500,
-- BookShelfYN = 'Y', ExtraFilingCabinetYN = 'Y', MeetingTableYN = 'Y', WindowQuantity = 4, WindowStatus = 'O', OfficeTypeCode = 6
INSERT INTO
	OFFICE (
		OFFICENUMBER,
		MONTHLYRENT,
		SQUAREFOOTAGE,
		BOOKSHELFYN,
		EXTRAFILINGCABINETYN,
		MEETINGTABLEYN,
		WINDOWQUANTITY,
		WINDOWSTATUS,
		OFFICETYPECODE
	)
VALUES
	(260, 2200, 500, 'Y', 'Y', 'Y', 4, 'O', 6);

-- 4. Write an INSERT statement to add a new desk holder using the ReferralSourceCode for 'Business Conference'.
INSERT INTO
	DESKHOLDER (
		DESKHOLDERID,
		FIRSTNAME,
		LASTNAME,
		COMPANYNAME,
		EMAILADDRESS,
		CELLPHONENUMBER,
		CREDITCARDNUMBER,
		REFERRALSOURCECODE
	)
VALUES
	(
		'ROB101',
		'Robert',
		'Brown',
		'Brown Business Group',
		'Robert.grown@gmail.com',
		'780-555-5555',
		NULL,
		(
			SELECT
				REFERRALSOURCECODE
			FROM
				REFERRALSOURCE
			WHERE
				REFERRALSOURCEDESCRIPTION = 'Business Conference'
		)
	);

-- 5. Write an INSERT statement to add multiple new lease types in one statement: LeaseTypeNumber = 10, LeaseTypeDescription = 'Corporate Lease'; LeaseTypeNumber = 11, LeaseTypeDescription = 'Weekend Lease'
INSERT INTO
	LEASETYPE (LEASETYPENUMBER, LEASETYPEDESCRIPTION)
VALUES
	(10, 'Corporate Lease'),
	(11, 'Weekend Lease');

-- 6. Write an INSERT statement to add a new lease using: the OfficeNumber for office 260, the DeskHolderID 'ROB001', the LeaseTypeNumber for 'Corporate Lease'
INSERT INTO
	LEASE (
		LEASENUMBER,
		STARTDATE,
		ENDDATE,
		TOTALLEASECOST,
		TOTALLEASEPRICE,
		OFFICENUMBER,
		DESKHOLDERID,
		LEASETYPENUMBER
	)
VALUES
	(
		500260,
		'2027-01-01',
		'2027-12-31',
		18000.00,
		24000.00,
		260,
		'ROB001',
		(
			SELECT
				LEASETYPENUMBER
			FROM
				LEASETYPE
			WHERE
				LEASETYPEDESCRIPTION = 'Corporate Lease'
		)
	);

-- 7. Write an INSERT statement to add multiple new office add-ons in one statement: AddOnNumber = 15, AddOnDescription = 'Private Parking Stall', CurrentCost = 100.00, CurrentPrice = 175.00, Discount = 5; AddOnNumber = 16, AddOnDescription = 'Dedicated Reception Service', CurrentCost = 300.00, CurrentPrice = 500.00, Discount = NULL
INSERT INTO
	OFFICEADDON (
		ADDONNUMBER,
		ADDONDESCRIPTION,
		CURRENTCOST,
		CURRENTPRICE,
		DISCOUNT
	)
VALUES
	(15, 'Private Parking Stall', 100.00, 175.00, 5),
	(
		16,
		'Dedicated Reception Service',
		300.00,
		500.00,
		NULL
	);

-- 8. Write an INSERT statement to add a new invoice for LeaseNumber 241 with: InvoiceNumber = 350, InvoiceDate = '15-JAN-2027', PaidYN = 'N', InvoiceGST = 125.00, InvoiceTotal = 2500.00
INSERT INTO
	INVOICE (
		INVOICENUMBER,
		INVOICEDATE,
		PAIDYN,
		INVOICEGST,
		INVOICETOTAL,
		LEASENUMBER
	)
VALUES
	(350, '15-JAN-2027', 'N', 125.00, 2500.00, 241);

-- 9. Write INSERT statements that add a new invoice and multiple invoice items for an existing lease.
-- Use LeaseNumber 185. The invoice should include: InvoiceNumber = 353, InvoiceDate = '2027-04-01', PaidYN = 'N', InvoiceGST = 18.75, InvoiceTotal = 393.75;
-- Add three invoice items with their associated InvoiceAddOnCost and InvoiceAddOnPrice: Access Card Deposit, QuantitySold = 1, Photocopy (black and white), QuantitySold = 20, Postage, QuantitySold = 10
INSERT INTO
	INVOICE (
		INVOICENUMBER,
		INVOICEDATE,
		PAIDYN,
		INVOICEGST,
		INVOICETOTAL,
		LEASENUMBER
	)
VALUES
	(353, '2027-04-01', 'N', 18.75, 393.75, 185);

INSERT INTO
	INVOICEITEM (
		INVOICENUMBER,
		ADDONNUMBER,
		QUANTITYSOLD,
		INVOICEADDONCOST,
		INVOICEADDONPRICE
	)
VALUES
	(
		353,
		(
			SELECT
				ADDONNUMBER
			FROM
				OFFICEADDON
			WHERE
				ADDONDESCRIPTION = 'Access Card Deposit'
		),
		1,
		(
			SELECT
				CURRENTCOST
			FROM
				OFFICEADDON
			WHERE
				ADDONDESCRIPTION = 'Access Card Deposit'
		),
		(
			SELECT
				CURRENTCOST
			FROM
				OFFICEADDON
			WHERE
				ADDONDESCRIPTION = 'Access Card Deposit'
		)
	),
	(
		353,
		(
			SELECT
				ADDONNUMBER
			FROM
				OFFICEADDON
			WHERE
				ADDONDESCRIPTION = 'Photocopy (black and white)'
		),
		20,
		(
			SELECT
				CURRENTCOST
			FROM
				OFFICEADDON
			WHERE
				ADDONDESCRIPTION = 'Photocopy (black and white)'
		),
		(
			SELECT
				CURRENTCOST
			FROM
				OFFICEADDON
			WHERE
				ADDONDESCRIPTION = 'Photocopy (black and white)'
		)
	),
	(
		353,
		(
			SELECT
				ADDONNUMBER
			FROM
				OFFICEADDON
			WHERE
				ADDONDESCRIPTION = 'Postage'
		),
		10,
		(
			SELECT
				CURRENTCOST
			FROM
				OFFICEADDON
			WHERE
				ADDONDESCRIPTION = 'Postage'
		),
		(
			SELECT
				CURRENTCOST
			FROM
				OFFICEADDON
			WHERE
				ADDONDESCRIPTION = 'Postage'
		)
	);

-- 10. Write an INSERT statement that adds a new invoice item using:
-- the InvoiceNumber for the invoice associated with LeaseNumber 211, the AddOnNumber for 'Access Card Deposit', QuantitySold = 2, InvoiceAddOnCost = 100.00, InvoiceAddOnPrice = 175.00
INSERT INTO
	INVOICE (
		INVOICENUMBER,
		ADDONNUMBER,
		INVOICEADDONCOST,
		INVOICEADDONPRICE
	)
VALUES
	(
		(
			SELECT
				INVOICENUMBER
			FROM
				INVOICE
			WHERE
				LEASENUMBER = 211
		),
		(
			SELECT
				ADDONNUMBER
			FROM
				OFFICEADDON
			WHERE
				ADDONDESCRIPTION = 'Access Card Deposit'
		),
		2,
		100.00,
		175.00
	);