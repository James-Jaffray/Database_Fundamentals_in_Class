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
