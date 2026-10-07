Drop Table If Exists OfficeType;
Create Table OfficeType
(
OfficeTypeCode decimal (2,0) not null,
OfficeTypeDescription varchar (35) not null
);
Select * From OfficeType;
 
Drop Table If Exists ReferralSource;
Create Table ReferralSource
(
ReferralSourceCode decimal (2,0) not null,
ReferralSourceDescription varchar (30) not null
);
Select * From ReferralSource;
 
Drop Table If Exists LeaseType;
Create Table LeaseType
(
LeaseTypeNumber decimal (2,0) not null,
LeaseTypeDescription varchar (50) not null
);
Select * From LeaseType;
 
Drop Table If Exists Office;
Create Table Office
(
OfficeNumber decimal (3,0) not null,
MonthlyRent decimal (6,2) not null,
SquareFootage decimal (6,2) not null,
BookShelfYN char (1) not null,
ExtraFilingCabinetYN char (1) not null,
MeetingTableYN char (1) not null,
WindowQuantity decimal (2,0) not null,
WindowStatus char (1) not null,
OfficeTypeCode decimal (2,0) not null
);
Select * From Office;
Drop Table If Exists DeskHolder;

Create Table DeskHolder    -- DH
(
    DeskHolderID          char (6) not null,
    FirstName             varchar (35) not null,
    LastName              varchar (40) not null,
    CompanyName           varchar (55) null,
    EmailAddress          varchar (75) not null,
    CellPhoneNumber       char (10) not null,
    CreditCardNumber      varchar (16) null,
    ReferralSourceCode    decimal (2,0) not null
);

Select * From DeskHolder;
Drop Table If Exists Lease;

Create Table Lease    
(
    LeaseNumber        decimal (6,0) not null,
    StartDate          timestamp not null,
    EndDate            timestamp null,
    TotalLeaseCost     decimal (15,2) null,
    TotalLeasePrice    decimal (15,2) null,
    OfficeNumber       decimal (3,0) not null,
    DeskHolderID       char (6) not null,
    LeaseTypeNumber    decimal (2,0) not null
);

Select * From Lease;

Drop Table If Exists OfficeAddOn;
Drop Table If Exists Invoice;

Create Table OfficeAddOn  
(
    AddOnNumber          decimal (4,0) not null,
    AddOnDescription     varchar (45) not null,
    CurrentCost          decimal (6,2) not null,
    CurrentPrice         decimal (6,2) not null,
    Discount             decimal (3,0) null
);

Select * From OfficeAddOn;

Create Table Invoice  
(
    InvoiceNumber    decimal (6,0) not null,
    InvoiceDate      timestamp not null,
    PaidYN           char (1) null,
    InvoiceGST       decimal (9,2) not null,
    InvoiceTotal     decimal (11,2) not null,
    LeaseNumber      decimal (6,0) not null
);

Select * From Invoice;
Drop Table If Exists InvoiceItem;

Create Table InvoiceItem    
(
    InvoiceNumber         decimal (6,0) not null,
    AddOnNumber           decimal (4,0) not null,
    QuantitySold          decimal (5,0) not null,
    InvoiceAddOnCost      decimal (6,2) not null,
    InvoiceAddOnPrice     decimal (6,2) not null
);

Select * From InvoiceItem;
