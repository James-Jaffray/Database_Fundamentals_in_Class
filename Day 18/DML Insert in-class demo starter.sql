-- use The Monthly Desk tables

-- 1. Write an INSERT statement to add a new office type with an OfficeTypeCode of 6 and an OfficeTypeDescription of 'Premium Suite'.


-- 2. Write an INSERT statement to add multiple new referral sources in one statement:
--		ReferralSourceCode = 17, ReferralSourceDescription = 'LinkedIn Advertisement'
--		ReferralSourceCode = 18, ReferralSourceDescription = 'Podcast Advertisement'
--		ReferralSourceCode = 19, ReferralSourceDescription = 'Business Conference'


-- 3. Write an INSERT statement to add a new office using the following values: OfficeNumber = 260, MonthlyRent = 2200, SquareFootage = 500, BookShelfYN = 'Y', ExtraFilingCabinetYN = 'Y', MeetingTableYN = 'Y', WindowQuantity = 4, WindowStatus = 'O', OfficeTypeCode = 6


-- 4. Write an INSERT statement to add a new desk holder using the ReferralSourceCode for 'Business Conference'.


-- 5. Write an INSERT statement to add multiple new lease types in one statement: LeaseTypeNumber = 10, LeaseTypeDescription = 'Corporate Lease'; LeaseTypeNumber = 11, LeaseTypeDescription = 'Weekend Lease'


-- 6. Write an INSERT statement to add a new lease using: the OfficeNumber for office 260, the DeskHolderID 'ROB001', the LeaseTypeNumber for 'Corporate Lease'


-- 7. Write an INSERT statement to add multiple new office add-ons in one statement: AddOnNumber = 15, AddOnDescription = 'Private Parking Stall', CurrentCost = 100.00, CurrentPrice = 175.00, Discount = 5; AddOnNumber = 16, AddOnDescription = 'Dedicated Reception Service', CurrentCost = 300.00, CurrentPrice = 500.00, Discount = NULL


-- 8. Write an INSERT statement to add a new invoice for LeaseNumber 241 with: InvoiceNumber = 350, InvoiceDate = '15-JAN-2027', PaidYN = 'N', InvoiceGST = 125.00, InvoiceTotal = 2500.00


-- 9. Write INSERT statements that add a new invoice and multiple invoice items for an existing lease. Use LeaseNumber 185. The invoice should include: InvoiceNumber = 353, InvoiceDate = '2027-04-01', PaidYN = 'N', InvoiceGST = 18.75, InvoiceTotal = 393.75; Add three invoice items with their associated InvoiceAddOnCost and InvoiceAddOnPrice: Access Card Deposit, QuantitySold = 1, Photocopy (black and white), QuantitySold = 20, Postage, QuantitySold = 10


-- 10. Write an INSERT statement that adds a new invoice item using: the InvoiceNumber for the invoice associated with LeaseNumber 211, the AddOnNumber for 'Access Card Deposit', QuantitySold = 2, InvoiceAddOnCost = 100.00, InvoiceAddOnPrice = 175.00

