-- drop tables
Drop Table If Exists InvoiceItem;
Drop Table If Exists Invoice;
Drop Table If Exists OfficeAddOn;
Drop Table If Exists Lease;
Drop Table If Exists LeaseType;
Drop Table If Exists DeskHolder;
Drop Table If Exists Office;
Drop Table If Exists ReferralSource;
Drop Table If Exists OfficeType;
Create Table OfficeType	-- OT
(
	OfficeTypeCode				decimal(2,0)	Constraint PK_Office_OfficeTypeCode
													Primary Key
												Constraint NN_Office_OfficeTypeCode
													Not Null,
	OfficeTypeDescription		varchar(35)		Constraint NN_Office_OfficeTypeDescription
													Not Null
);

Select * From OfficeType;
Create Table ReferralSource	-- RS
(
	ReferralSourceCode			decimal(2,0)	Constraint PK_ReferralSource_ReferralSourceCode
													Primary Key
												Constraint NN_ReferralSource_ReferralSourceCode
													Not Null,
	ReferralSourceDescription	varchar(30)		Constraint NN_ReferralSource_ReferralSourceDescription
													Not Null
);

Select * From ReferralSource;
Create Table Office	-- Off
(
	OfficeNumber				decimal(3,0)	Constraint PK_Office_OfficeNumber
													Primary Key
												Constraint NN_Office_OfficeNumber
													Not Null,
	MonthlyRent					decimal(6,2)	Constraint NN_Office_MonthlyRent
													Not Null,
	SquareFootage				decimal(6,2)	Constraint NN_Office_SquareFootage
													Not Null,
	BookShelfYN					char(1)			Constraint NN_Office_BookShelfYN
													Not Null,
	ExtraFilingCabinetYN		char(1)			Constraint NN_Office_ExtraFilingCabinetYN
													Not Null,
	MeetingTableYN				char(1)			Constraint NN_Office_MeetingTableYN	
													Not Null,
	WindowQuantity				decimal(2,0)	Constraint NN_Office_WindowQuantity	
													Not Null,
	WindowStatus				char(1)			Constraint NN_Office_WindowStatus	
													Not Null,
	OfficeTypeCode				decimal(2,0)	Constraint NN_Office_OfficeTypeCode	
													Not Null
												Constraint FK_Office_OfficeTypeCode_OfficeType_OfficeTypeCode	
													References OfficeType (OfficeTypeCode)
);

Select * From Office;
Create Table DeskHolder	-- DH
(
	DeskHolderID				char(6)			Constraint PK_DeskHolder_DeskHolderID 	
													Primary Key
												Constraint NN_DeskHolder_DeskHolderID 	
													Not Null,
	FirstName					varchar(35)		Constraint NN_DeskHolder_FirstName			
													Not Null,
	LastName					varchar(40)		Constraint NN_DeskHolder_LastName			
													Not Null,
	CompanyName					varchar(55)		Constraint NN_DeskHolder_CompanyName		
													Null,
	EmailAddress				varchar(75)		Constraint NN_DeskHolder_EmailAddress		
													Not Null,
	CellPhoneNumber				char(10)		Constraint NN_DeskHolder_CellPhoneNumber	
													Not Null,
	CreditCardNumber			varchar(16)		Constraint NL_DeskHolder_CreditCardNumber	
													Null,
	ReferralSourceCode			decimal(2,0)	Constraint NN_DeskHolder_ReferralSourceCode	
													Not Null
												Constraint FK_DeskHolder_ReferralSourceCode_RS_ReferralSourceCode		
													References ReferralSource (ReferralSourceCode)
);

Select * From DeskHolder;
Create Table LeaseType	-- LT
(
	LeaseTypeNumber 			decimal(2,0)	Constraint PK_LeaseType_LeaseTypeNumber 	
													Primary Key
												Constraint NN_LeaseType_LeaseTypeNumber	 	
													Not Null,
	LeaseTypeDescription		varchar(50) 	Constraint NN_LeaseType_LeaseTypeDescription
													Not Null
);

Select * From LeaseType;
Create Table Lease -- LSE
(
	LeaseNumber					decimal(6,0)	Constraint PK_Lease_LeaseNumber				
													Primary Key
												Constraint NN_Lease_LeaseNumber				
													Not Null,
	StartDate					timestamp		Constraint NN_Lease_StartDate				
													Not Null,
	EndDate						timestamp		Constraint NL_Lease_EndDate					
													Null,
	TotalLeaseCost				decimal(15,2)	Constraint NL_Lease_TotalLeaseCost			
													Null,
	TotalLeasePrice				decimal(15,2)	Constraint NL_Lease_TotalLeasePrice			
													Null,
	OfficeNumber				decimal(3,0)	Constraint NN_Lease_OfficeNumber			
													Not Null
												Constraint FK_Lease_OfficeNumber		
													References Office (OfficeNumber),
	DeskHolderID				char(6)			Constraint NN_Lease_DeskHolderID			
													Not Null
												Constraint FK_Lease_DeskHolderID_DeskHolder_DeskHolderID		
													References DeskHolder (DeskHolderID),
	LeaseTypeNumber				decimal(2,0)	Constraint NN_Lease_LeaseTypeNumber			
													Not Null
                                                Constraint FK_Lease_LeaseTypeNumber_LeaseType_LeaseTypeNumber		
													References LeaseType (LeaseTypeNumber)
);

Select * From Lease;
Create Table OfficeAddOn -- OAO
(       
	AddOnNumber					decimal(4,0)	Constraint PK_OfficeAddOn_AONum			
													Primary Key
												Constraint NN_OfficeAddOn_AONum			
													Not Null,
	AddOnDescription			varchar(45)		Constraint NN_OfficeAddOn_AddOnDescription
													Not Null,
	CurrentCost					decimal(6,2)	Constraint NN_OfficeAddOn_CurrentCost	
													Not Null,
	CurrentPrice				decimal(6,2)	Constraint NN_OfficeAddOn_CurrentPrice	
													Not Null,
	Discount					decimal(3,0)	Constraint NN_OfficeAddOn_Discount		
													Null
);

Select * From OfficeAddOn;
Create Table Invoice -- Inv
(
	InvoiceNumber				decimal(6,0)	Constraint PK_Invoice_InvoiceNumber		
													Primary Key
												Constraint NN_Invoice_InvoiceNumber		
													Not Null,
	InvoiceDate					timestamp		Constraint NN_Invoice_InvoiceDate 		
													Not Null,
	PaidYN						char(1)			Constraint NL_Invoice_PaidYN			
													Null,
	InvoiceGST					decimal(9,2)	Constraint NN_Invoice_InvoiceGST		
													Not Null,
	InvoiceTotal				decimal(11,2)	Constraint NN_Invoice_InvoiceTotal		
													Not Null,
	LeaseNumber					decimal(6,0)	Constraint NN_Invoice_LeaseNumber		
													Not Null
												Constraint FK_Invoice_LeaseNumber_Lease_LeaseNumber		
													References Lease (LeaseNumber)
);

Select * From Invoice;
Create Table InvoiceItem -- II
(
	InvoiceNumber				decimal(6,0)	Constraint NN_InvoiceItem_InvoiceNumber	
													Not Null
												Constraint FK_InvoiceItem_InvoiceNumber_Invoice_InvoiceNumber	
													References Invoice (InvoiceNumber),
	AddOnNumber					decimal(4,0)	Constraint NN_InvoiceItem_AddOnNumber	
													Not Null
												Constraint FK_InvoiceItem_AddOnNumber_OfficeAddOn_AddOnNumber	
													References OfficeAddOn (AddOnNumber),
	QuantitySold				decimal(5,0)	Constraint NN_InvoiceItem_QuantitySold	
													Not Null,
	InvoiceAddOnCost			decimal(6,2)	Constraint NN_InvoiceItem_InvoiceAddOnCost
													Not Null,
	InvoiceAddOnPrice			decimal(6,2)	Constraint NN_InvoiceItem_InvoiceAddOnPrice
													Not Null,
	Constraint PK_InvoiceItem_InvoiceNumber_AddOnNumber
		Primary Key (InvoiceNumber, AddOnNumber)
);

Select * From InvoiceItem;
Create Index IX_Office_OfficeTypeCode
    On Office (OfficeTypeCode);

Create Index IX_DeskHolder_ReferralSourceCode
    On DeskHolder (ReferralSourceCode);

Create Index IX_Lease_OfficeNumber
    On Lease (OfficeNumber);

Create Index IX_Lease_DeskHolderID
    On Lease (DeskHolderID);

Create Index IX_Lease_LeaseTypeNumber
    On Lease (LeaseTypeNumber);

Create Index IX_InvoiceItem_InvoiceNumber
    On InvoiceItem (InvoiceNumber);

Create Index IX_InvoiceItem_AddOnNumber
    On InvoiceItem (AddOnNumber);

Create Index IX_Invoice_LeaseNumber
    On Invoice (LeaseNumber);


