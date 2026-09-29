-- PostgreSQL

-- Delete all old records
Delete From InvoiceItem;
Delete From Invoice;
Delete From OfficeAddOn;
Delete From Lease;
Delete From LeaseType;
Delete From DeskHolder;
Delete From Office;
Delete From ReferralSource;
Delete From OfficeType;

-- Insert Into OfficeType

Insert Into OfficeType
	(OfficeTypeCode, OfficeTypeDescription)
Values
	(6, 'Virtual Office (Full Service)');

Insert Into OfficeType
	(OfficeTypeCode, OfficeTypeDescription)
Values
	(4, 'Shared Office');

Insert Into OfficeType
	(OfficeTypeCode, OfficeTypeDescription)
Values
	(3, 'Office Suite');

Insert Into OfficeType
	(OfficeTypeCode, OfficeTypeDescription)
Values
	(5, 'Virtual Office (Address only)');

Insert Into OfficeType
	(OfficeTypeCode, OfficeTypeDescription)
Values
	(2, 'Double Office');

Insert Into OfficeType
	(OfficeTypeCode, OfficeTypeDescription)
Values
	(1, 'Single Office');


-- Insert Into ReferralSource

Insert Into ReferralSource
	(ReferralSourceCode, ReferralSourceDescription)
Values
	(7, 'Twitter post');

Insert Into ReferralSource
	(ReferralSourceCode, ReferralSourceDescription)
Values
	(12, 'Existing Desk Holder Referral');

Insert Into ReferralSource
	(ReferralSourceCode, ReferralSourceDescription)
Values
	(13, 'Newspaper');

Insert Into ReferralSource
	(ReferralSourceCode, ReferralSourceDescription)
Values
	(6, 'Facebook post/group');

Insert Into ReferralSource
	(ReferralSourceCode, ReferralSourceDescription)
Values
	(2, 'Google Ads');

Insert Into ReferralSource
	(ReferralSourceCode, ReferralSourceDescription)
Values
	(10, 'Email Campaign');

Insert Into ReferralSource
	(ReferralSourceCode, ReferralSourceDescription)
Values
	(8, 'Instagram post/story');

Insert Into ReferralSource
	(ReferralSourceCode, ReferralSourceDescription)
Values
	(4, 'YouTube Ads');

Insert Into ReferralSource
	(ReferralSourceCode, ReferralSourceDescription)
Values
	(16, 'Other');

Insert Into ReferralSource
	(ReferralSourceCode, ReferralSourceDescription)
Values
	(3, 'Facebook Ads');

Insert Into ReferralSource
	(ReferralSourceCode, ReferralSourceDescription)
Values
	(17, 'Previous Desk Holder');

Insert Into ReferralSource
	(ReferralSourceCode, ReferralSourceDescription)
Values
	(11, 'Radio');

Insert Into ReferralSource
	(ReferralSourceCode, ReferralSourceDescription)
Values
	(15, 'Walk-In');

Insert Into ReferralSource
	(ReferralSourceCode, ReferralSourceDescription)
Values
	(9, 'Other social media');

Insert Into ReferralSource
	(ReferralSourceCode, ReferralSourceDescription)
Values
	(18, 'Business Partner Referral');

Insert Into ReferralSource
	(ReferralSourceCode, ReferralSourceDescription)
Values
	(1, 'Search Engine');

Insert Into ReferralSource
	(ReferralSourceCode, ReferralSourceDescription)
Values
	(5, 'Other social media advertising');

Insert Into ReferralSource
	(ReferralSourceCode, ReferralSourceDescription)
Values
	(14, 'Word of mouth');


-- Insert Into Office

Insert Into Office
	(OfficeNumber, MonthlyRent, SquareFootage, BookShelfYN, ExtraFilingCabinetYN, MeetingTableYN, WindowQuantity, WindowStatus, OfficeTypeCode)  
Values
	(217, 1100, 400, 'Y', 'Y', 'N', 4, 'F', 3); 

Insert Into Office
	(OfficeNumber, MonthlyRent, SquareFootage, BookShelfYN, ExtraFilingCabinetYN, MeetingTableYN, WindowQuantity, WindowStatus, OfficeTypeCode)  
Values
	(234, 1400, 300, 'Y', 'Y', 'Y', 2, 'O', 1); 

Insert Into Office
	(OfficeNumber, MonthlyRent, SquareFootage, BookShelfYN, ExtraFilingCabinetYN, MeetingTableYN, WindowQuantity, WindowStatus, OfficeTypeCode)  
Values
	(228, 1900, 250, 'Y', 'N', 'Y', 1, 'O', 1); 

Insert Into Office
	(OfficeNumber, MonthlyRent, SquareFootage, BookShelfYN, ExtraFilingCabinetYN, MeetingTableYN, WindowQuantity, WindowStatus, OfficeTypeCode)  
Values
	(223, 1750, 250, 'N', 'Y', 'Y', 2, 'F', 1); 

Insert Into Office
	(OfficeNumber, MonthlyRent, SquareFootage, BookShelfYN, ExtraFilingCabinetYN, MeetingTableYN, WindowQuantity, WindowStatus, OfficeTypeCode)  
Values
	(204, 650, 300, 'N', 'Y', 'N', 5, 'F', 1); 

Insert Into Office
	(OfficeNumber, MonthlyRent, SquareFootage, BookShelfYN, ExtraFilingCabinetYN, MeetingTableYN, WindowQuantity, WindowStatus, OfficeTypeCode)  
Values
	(172, 1950, 250, 'Y', 'Y', 'Y', 5, 'F', 1); 

Insert Into Office
	(OfficeNumber, MonthlyRent, SquareFootage, BookShelfYN, ExtraFilingCabinetYN, MeetingTableYN, WindowQuantity, WindowStatus, OfficeTypeCode)  
Values
	(156, 600, 450, 'N', 'Y', 'N', 4, 'F', 4); 

Insert Into Office
	(OfficeNumber, MonthlyRent, SquareFootage, BookShelfYN, ExtraFilingCabinetYN, MeetingTableYN, WindowQuantity, WindowStatus, OfficeTypeCode)  
Values
	(179, 1600, 250, 'N', 'Y', 'Y', 1, 'O', 3); 

Insert Into Office
	(OfficeNumber, MonthlyRent, SquareFootage, BookShelfYN, ExtraFilingCabinetYN, MeetingTableYN, WindowQuantity, WindowStatus, OfficeTypeCode)  
Values
	(221, 1150, 400, 'Y', 'N', 'N', 5, 'F', 1); 

Insert Into Office
	(OfficeNumber, MonthlyRent, SquareFootage, BookShelfYN, ExtraFilingCabinetYN, MeetingTableYN, WindowQuantity, WindowStatus, OfficeTypeCode)  
Values
	(118, 850, 300, 'N', 'N', 'Y', 2, 'F', 2); 

Insert Into Office
	(OfficeNumber, MonthlyRent, SquareFootage, BookShelfYN, ExtraFilingCabinetYN, MeetingTableYN, WindowQuantity, WindowStatus, OfficeTypeCode)  
Values
	(174, 1250, 400, 'Y', 'Y', 'N', 2, 'F', 3); 

Insert Into Office
	(OfficeNumber, MonthlyRent, SquareFootage, BookShelfYN, ExtraFilingCabinetYN, MeetingTableYN, WindowQuantity, WindowStatus, OfficeTypeCode)  
Values
	(196, 750, 100, 'Y', 'Y', 'N', 1, 'O', 5); 

Insert Into Office
	(OfficeNumber, MonthlyRent, SquareFootage, BookShelfYN, ExtraFilingCabinetYN, MeetingTableYN, WindowQuantity, WindowStatus, OfficeTypeCode)  
Values
	(207, 950, 300, 'Y', 'N', 'Y', 5, 'O', 1); 

Insert Into Office
	(OfficeNumber, MonthlyRent, SquareFootage, BookShelfYN, ExtraFilingCabinetYN, MeetingTableYN, WindowQuantity, WindowStatus, OfficeTypeCode)  
Values
	(122, 1300, 200, 'N', 'N', 'Y', 3, 'F', 1); 

Insert Into Office
	(OfficeNumber, MonthlyRent, SquareFootage, BookShelfYN, ExtraFilingCabinetYN, MeetingTableYN, WindowQuantity, WindowStatus, OfficeTypeCode)  
Values
	(245, 1900, 450, 'N', 'N', 'N', 1, 'F', 1); 

Insert Into Office
	(OfficeNumber, MonthlyRent, SquareFootage, BookShelfYN, ExtraFilingCabinetYN, MeetingTableYN, WindowQuantity, WindowStatus, OfficeTypeCode)  
Values
	(129, 1550, 300, 'Y', 'N', 'N', 3, 'F', 1); 

Insert Into Office
	(OfficeNumber, MonthlyRent, SquareFootage, BookShelfYN, ExtraFilingCabinetYN, MeetingTableYN, WindowQuantity, WindowStatus, OfficeTypeCode)  
Values
	(166, 850, 400, 'Y', 'N', 'N', 3, 'F', 1); 

Insert Into Office
	(OfficeNumber, MonthlyRent, SquareFootage, BookShelfYN, ExtraFilingCabinetYN, MeetingTableYN, WindowQuantity, WindowStatus, OfficeTypeCode)  
Values
	(233, 1550, 200, 'Y', 'Y', 'N', 1, 'F', 2); 

Insert Into Office
	(OfficeNumber, MonthlyRent, SquareFootage, BookShelfYN, ExtraFilingCabinetYN, MeetingTableYN, WindowQuantity, WindowStatus, OfficeTypeCode)  
Values
	(210, 1450, 300, 'N', 'Y', 'Y', 4, 'F', 4); 

Insert Into Office
	(OfficeNumber, MonthlyRent, SquareFootage, BookShelfYN, ExtraFilingCabinetYN, MeetingTableYN, WindowQuantity, WindowStatus, OfficeTypeCode)  
Values
	(109, 1250, 400, 'N', 'N', 'Y', 1, 'F', 1); 

Insert Into Office
	(OfficeNumber, MonthlyRent, SquareFootage, BookShelfYN, ExtraFilingCabinetYN, MeetingTableYN, WindowQuantity, WindowStatus, OfficeTypeCode)  
Values
	(158, 1000, 200, 'N', 'N', 'N', 1, 'O', 2); 

Insert Into Office
	(OfficeNumber, MonthlyRent, SquareFootage, BookShelfYN, ExtraFilingCabinetYN, MeetingTableYN, WindowQuantity, WindowStatus, OfficeTypeCode)  
Values
	(148, 750, 200, 'N', 'Y', 'Y', 2, 'F', 1); 

Insert Into Office
	(OfficeNumber, MonthlyRent, SquareFootage, BookShelfYN, ExtraFilingCabinetYN, MeetingTableYN, WindowQuantity, WindowStatus, OfficeTypeCode)  
Values
	(145, 550, 300, 'Y', 'Y', 'Y', 1, 'O', 3); 

Insert Into Office
	(OfficeNumber, MonthlyRent, SquareFootage, BookShelfYN, ExtraFilingCabinetYN, MeetingTableYN, WindowQuantity, WindowStatus, OfficeTypeCode)  
Values
	(128, 1000, 450, 'N', 'N', 'N', 3, 'F', 3); 

Insert Into Office
	(OfficeNumber, MonthlyRent, SquareFootage, BookShelfYN, ExtraFilingCabinetYN, MeetingTableYN, WindowQuantity, WindowStatus, OfficeTypeCode)  
Values
	(248, 850, 300, 'N', 'Y', 'Y', 4, 'O', 3); 


-- Insert Into DeskHolder

Insert Into DeskHolder
	(DeskHolderID, FirstName, LastName, CompanyName, EmailAddress, CellPhoneNumber, CreditCardNumber, ReferralSourceCode)  
Values
	('SHA001', 'Maria', 'Shailer', Null, 'mshailer12@sohu.com', 7043626443, Null, 15); 

Insert Into DeskHolder
	(DeskHolderID, FirstName, LastName, CompanyName, EmailAddress, CellPhoneNumber, CreditCardNumber, ReferralSourceCode)  
Values
	('GIA001', 'Mead', 'Gianasi', Null, 'mgianasi7@twitpic.com', 9814097192, Null, 15); 

Insert Into DeskHolder
	(DeskHolderID, FirstName, LastName, CompanyName, EmailAddress, CellPhoneNumber, CreditCardNumber, ReferralSourceCode)  
Values
	('WIN001', 'Zolly', 'Wingatt', Null, 'zwingatt4@home.pl', 3774357423, '372301310747573', 1); 

Insert Into DeskHolder
	(DeskHolderID, FirstName, LastName, CompanyName, EmailAddress, CellPhoneNumber, CreditCardNumber, ReferralSourceCode)  
Values
	('BRE001', 'Consuela', 'Brear', 'Zava', 'cbreark@parallels.com', 3195091759, Null, 6); 

Insert Into DeskHolder
	(DeskHolderID, FirstName, LastName, CompanyName, EmailAddress, CellPhoneNumber, CreditCardNumber, ReferralSourceCode)  
Values
	('OUL001', 'Carson', 'Oullette', 'Skyvu', 'coullette1@mtv.com', 7165753443, '372301971559465', 12); 

Insert Into DeskHolder
	(DeskHolderID, FirstName, LastName, CompanyName, EmailAddress, CellPhoneNumber, CreditCardNumber, ReferralSourceCode)  
Values
	('ING001', 'Mack', 'Inglesfield', Null, 'minglesfieldv@soup.io', 8928403652, '5007666130770787', 10); 

Insert Into DeskHolder
	(DeskHolderID, FirstName, LastName, CompanyName, EmailAddress, CellPhoneNumber, CreditCardNumber, ReferralSourceCode)  
Values
	('EIL001', 'Brandon', 'Eilhermann', 'Wordify', 'beilhermannt@gravatar.com', 5628107721, Null, 4); 

Insert Into DeskHolder
	(DeskHolderID, FirstName, LastName, CompanyName, EmailAddress, CellPhoneNumber, CreditCardNumber, ReferralSourceCode)  
Values
	('GAZ001', 'Marty', 'Gaze', 'Nlounge', 'mgazeu@etsy.com', 3716803018, '5007667454076025', 5); 

Insert Into DeskHolder
	(DeskHolderID, FirstName, LastName, CompanyName, EmailAddress, CellPhoneNumber, CreditCardNumber, ReferralSourceCode)  
Values
	('BRO001', 'Venus', 'Brolechan', 'Edgewire', 'vbrolechanl@cdbaby.com', 4182889147, '372301443489333', 8); 

Insert Into DeskHolder
	(DeskHolderID, FirstName, LastName, CompanyName, EmailAddress, CellPhoneNumber, CreditCardNumber, ReferralSourceCode)  
Values
	('UND001', 'Paolo', 'Underdown', Null, 'punderdownb@salon.com', 7931967336, Null, 14); 

Insert Into DeskHolder
	(DeskHolderID, FirstName, LastName, CompanyName, EmailAddress, CellPhoneNumber, CreditCardNumber, ReferralSourceCode)  
Values
	('MEA001', 'Jasmin', 'Meacher', 'Browsedrive', 'jmeacher1b@salon.com', 8875329768, '5002359780113194', 7); 

Insert Into DeskHolder
	(DeskHolderID, FirstName, LastName, CompanyName, EmailAddress, CellPhoneNumber, CreditCardNumber, ReferralSourceCode)  
Values
	('GRI001', 'Stanwood', 'Gricewood', Null, 'sgricewoodp@unicef.org', 4479195503, '5002354631798178', 10); 

Insert Into DeskHolder
	(DeskHolderID, FirstName, LastName, CompanyName, EmailAddress, CellPhoneNumber, CreditCardNumber, ReferralSourceCode)  
Values
	('PLE001', 'Sigvard', 'Plevin', Null, 'splevinc@state.tx.us', 5208491534, '5002357887676014', 2); 

Insert Into DeskHolder
	(DeskHolderID, FirstName, LastName, CompanyName, EmailAddress, CellPhoneNumber, CreditCardNumber, ReferralSourceCode)  
Values
	('GAU001', 'Constance', 'Gauch', Null, 'cgauchf@creativecommons.org', 9614350212, Null, 6); 

Insert Into DeskHolder
	(DeskHolderID, FirstName, LastName, CompanyName, EmailAddress, CellPhoneNumber, CreditCardNumber, ReferralSourceCode)  
Values
	('FER001', 'Jilly', 'Fernehough', 'Trunyx', 'jfernehough1c@cbslocal.com', 1187428751, '5007668231195054', 14); 

Insert Into DeskHolder
	(DeskHolderID, FirstName, LastName, CompanyName, EmailAddress, CellPhoneNumber, CreditCardNumber, ReferralSourceCode)  
Values
	('LYS001', 'Wildon', 'Lyster', 'Kazio', 'wlyster10@parallels.com', 2538844400, Null, 10); 

Insert Into DeskHolder
	(DeskHolderID, FirstName, LastName, CompanyName, EmailAddress, CellPhoneNumber, CreditCardNumber, ReferralSourceCode)  
Values
	('LON001', 'Martita', 'Longmate', 'Feedbug', 'mlongmatee@typepad.com', 7991665535, Null, 13); 

Insert Into DeskHolder
	(DeskHolderID, FirstName, LastName, CompanyName, EmailAddress, CellPhoneNumber, CreditCardNumber, ReferralSourceCode)  
Values
	('MCG001', 'Angelica', 'McGavin', Null, 'amcgavin15@cargocollective.com', 7392702227, '5010124650641801', 12); 

Insert Into DeskHolder
	(DeskHolderID, FirstName, LastName, CompanyName, EmailAddress, CellPhoneNumber, CreditCardNumber, ReferralSourceCode)  
Values
	('CRU001', 'Matty', 'Cruces', Null, 'mcruces18@arstechnica.com', 7152904365, '372301642851556', 4); 

Insert Into DeskHolder
	(DeskHolderID, FirstName, LastName, CompanyName, EmailAddress, CellPhoneNumber, CreditCardNumber, ReferralSourceCode)  
Values
	('HAT001', 'Franklyn', 'Hatherley', 'Skiptube', 'fhatherley8@arstechnica.com', 8207416412, '372301554571887', 8); 

Insert Into DeskHolder
	(DeskHolderID, FirstName, LastName, CompanyName, EmailAddress, CellPhoneNumber, CreditCardNumber, ReferralSourceCode)  
Values
	('BIL001', 'Erika', 'Bilson', Null, 'ebilson14@deviantart.com', 3271467333, Null, 16); 

Insert Into DeskHolder
	(DeskHolderID, FirstName, LastName, CompanyName, EmailAddress, CellPhoneNumber, CreditCardNumber, ReferralSourceCode)  
Values
	('DEA001', 'Drew', 'Deane', 'Flashset', 'ddeanes@marketwatch.com', 8889460459, '5002358855991542', 13); 

Insert Into DeskHolder
	(DeskHolderID, FirstName, LastName, CompanyName, EmailAddress, CellPhoneNumber, CreditCardNumber, ReferralSourceCode)  
Values
	('HOO001', 'Boris', 'Hoovart', Null, 'bhoovartd@scientificamerican.com', 4453980242, Null, 6); 

Insert Into DeskHolder
	(DeskHolderID, FirstName, LastName, CompanyName, EmailAddress, CellPhoneNumber, CreditCardNumber, ReferralSourceCode)  
Values
	('ANN001', 'Rip', 'Annesley', Null, 'rannesley19@naver.com', 6876796278, Null, 1); 

Insert Into DeskHolder
	(DeskHolderID, FirstName, LastName, CompanyName, EmailAddress, CellPhoneNumber, CreditCardNumber, ReferralSourceCode)  
Values
	('CHA001', 'Clare', 'Chace', Null, 'cchace0@privacy.gov.au', 7436121165, Null, 12); 

Insert Into DeskHolder
	(DeskHolderID, FirstName, LastName, CompanyName, EmailAddress, CellPhoneNumber, CreditCardNumber, ReferralSourceCode)  
Values
	('BUR002', 'Charity', 'Burr', Null, 'cburr1a@sphinn.com', 8477827624, Null, 6); 

Insert Into DeskHolder
	(DeskHolderID, FirstName, LastName, CompanyName, EmailAddress, CellPhoneNumber, CreditCardNumber, ReferralSourceCode)  
Values
	('DOW001', 'Norman', 'Dowsey', 'Rhyzio', 'ndowsey3@gov.ab', 5804642354, '5007667705030292', 14); 

Insert Into DeskHolder
	(DeskHolderID, FirstName, LastName, CompanyName, EmailAddress, CellPhoneNumber, CreditCardNumber, ReferralSourceCode)  
Values
	('REP001', 'Kyle', 'Reppaport', 'Zoonder', 'kreppaport9@upenn.edu', 1705354990, Null, 3); 

Insert Into DeskHolder
	(DeskHolderID, FirstName, LastName, CompanyName, EmailAddress, CellPhoneNumber, CreditCardNumber, ReferralSourceCode)  
Values
	('BOO001', 'Morgan', 'Boots', Null, 'mboots1d@mashable.com', 6018601062, Null, 2); 

Insert Into DeskHolder
	(DeskHolderID, FirstName, LastName, CompanyName, EmailAddress, CellPhoneNumber, CreditCardNumber, ReferralSourceCode)  
Values
	('KNO001', 'Floris', 'Knowles', Null, 'fknowlesj@hexun.com', 6906284045, '5007663795500328', 3); 

Insert Into DeskHolder
	(DeskHolderID, FirstName, LastName, CompanyName, EmailAddress, CellPhoneNumber, CreditCardNumber, ReferralSourceCode)  
Values
	('HAN001', 'Fernando', 'Handke', 'Eabox', 'fhandkeo@nbcnews.com', 7073124520, '5010128679576831', 5); 

Insert Into DeskHolder
	(DeskHolderID, FirstName, LastName, CompanyName, EmailAddress, CellPhoneNumber, CreditCardNumber, ReferralSourceCode)  
Values
	('PAT001', 'Andrea', 'Patek', Null, 'apatek@wufoo.com', 4129573902, Null, 13); 

Insert Into DeskHolder
	(DeskHolderID, FirstName, LastName, CompanyName, EmailAddress, CellPhoneNumber, CreditCardNumber, ReferralSourceCode)  
Values
	('VIT001', 'Dom', 'Vittery', Null, 'dvittery2@kickstarter.com', 4964352152, '372301694670987', 15); 

Insert Into DeskHolder
	(DeskHolderID, FirstName, LastName, CompanyName, EmailAddress, CellPhoneNumber, CreditCardNumber, ReferralSourceCode)  
Values
	('WIL001', 'Lee', 'Wilshere', Null, 'lwilshereq@foxnews.com', 8607641978, Null, 9); 

Insert Into DeskHolder
	(DeskHolderID, FirstName, LastName, CompanyName, EmailAddress, CellPhoneNumber, CreditCardNumber, ReferralSourceCode)  
Values
	('SOM001', 'Melissa', 'Sommer', 'Gigaclub', 'msommer13@godaddy.com', 6369499691, Null, 4); 

Insert Into DeskHolder
	(DeskHolderID, FirstName, LastName, CompanyName, EmailAddress, CellPhoneNumber, CreditCardNumber, ReferralSourceCode)  
Values
	('LOB001', 'Vanda', 'Lobell', 'Blogtag', 'vlobellg@globo.com', 8853267362, '5002353099888893', 3); 

Insert Into DeskHolder
	(DeskHolderID, FirstName, LastName, CompanyName, EmailAddress, CellPhoneNumber, CreditCardNumber, ReferralSourceCode)  
Values
	('BUR001', 'Bert', 'Burdess', 'Zoovu', 'bburdessw@fotki.com', 6979636429, '5007666713848547', 7); 

Insert Into DeskHolder
	(DeskHolderID, FirstName, LastName, CompanyName, EmailAddress, CellPhoneNumber, CreditCardNumber, ReferralSourceCode)  
Values
	('CAT001', 'Alicia', 'Cathro', 'Mydo', 'acathro6@techcrunch.com', 9254669971, '372301318053644', 13); 

Insert Into DeskHolder
	(DeskHolderID, FirstName, LastName, CompanyName, EmailAddress, CellPhoneNumber, CreditCardNumber, ReferralSourceCode)  
Values
	('SIM001', 'Veronica', 'Simonin', Null, 'vsimonini@patch.com', 3124808950, '5002356792057740', 11); 

Insert Into DeskHolder
	(DeskHolderID, FirstName, LastName, CompanyName, EmailAddress, CellPhoneNumber, CreditCardNumber, ReferralSourceCode)  
Values
	('COR001', 'Mary', 'Corpes', 'Einti', 'mcorpesa@mapquest.com', 5164557732, '5007669883853354', 9); 

Insert Into DeskHolder
	(DeskHolderID, FirstName, LastName, CompanyName, EmailAddress, CellPhoneNumber, CreditCardNumber, ReferralSourceCode)  
Values
	('NOT001', 'Alli', 'Note', 'Roodel', 'anoter@t.co', 1455510396, Null, 4); 

Insert Into DeskHolder
	(DeskHolderID, FirstName, LastName, CompanyName, EmailAddress, CellPhoneNumber, CreditCardNumber, ReferralSourceCode)  
Values
	('GRE001', 'Nichole', 'Greiswood', Null, 'ngreiswoody@msu.edu', 3183488833, '5007669585311644', 7); 

Insert Into DeskHolder
	(DeskHolderID, FirstName, LastName, CompanyName, EmailAddress, CellPhoneNumber, CreditCardNumber, ReferralSourceCode)  
Values
	('JOB001', 'Dorene', 'Jobbing', 'Riffwire', 'djobbing11@mozilla.com', 4839702712, Null, 8); 

Insert Into DeskHolder
	(DeskHolderID, FirstName, LastName, CompanyName, EmailAddress, CellPhoneNumber, CreditCardNumber, ReferralSourceCode)  
Values
	('DON001', 'Georges', 'Doniso', 'Ozu', 'gdoniso16@disqus.com', 3493222744, '372301997634037', 6); 

Insert Into DeskHolder
	(DeskHolderID, FirstName, LastName, CompanyName, EmailAddress, CellPhoneNumber, CreditCardNumber, ReferralSourceCode)  
Values
	('TOO001', 'Roger', 'Tootal', Null, 'rtootaln@weebly.com', 4657355251, '372301224236036', 10); 

Insert Into DeskHolder
	(DeskHolderID, FirstName, LastName, CompanyName, EmailAddress, CellPhoneNumber, CreditCardNumber, ReferralSourceCode)  
Values
	('COL001', 'Loren', 'Coleby', Null, 'lcoleby5@amazon.co.jp', 6578726039, '5002357020090909', 13); 

Insert Into DeskHolder
	(DeskHolderID, FirstName, LastName, CompanyName, EmailAddress, CellPhoneNumber, CreditCardNumber, ReferralSourceCode)  
Values
	('HAC001', 'Lisbeth', 'Hachard', Null, 'lhachard17@gizmodo.com', 9112373678, '5002354883962100', 14); 

Insert Into DeskHolder
	(DeskHolderID, FirstName, LastName, CompanyName, EmailAddress, CellPhoneNumber, CreditCardNumber, ReferralSourceCode)  
Values
	('DEC001', 'Irwinn', 'DeCarlo', Null, 'idecarlom@scribd.com', 8394044663, Null, 2); 

Insert Into DeskHolder
	(DeskHolderID, FirstName, LastName, CompanyName, EmailAddress, CellPhoneNumber, CreditCardNumber, ReferralSourceCode)  
Values
	('SYN001', 'Bert', 'Synan', Null, 'bsynanh@unblog.fr', 2175023834, '372301072057047', 1); 

Insert Into DeskHolder
	(DeskHolderID, FirstName, LastName, CompanyName, EmailAddress, CellPhoneNumber, CreditCardNumber, ReferralSourceCode)  
Values
	('JAQ001', 'Gratiana', 'Jaquemar', Null, 'gjaquemarx@oaic.gov.au', 5043969448, '372301127375733', 6); 


-- Insert Into LeaseType

Insert Into LeaseType
	(LeaseTypeNumber, LeaseTypeDescription)
Values
	(7, 'Virtual Weekly');

Insert Into LeaseType
	(LeaseTypeNumber, LeaseTypeDescription)
Values
	(5, 'Two Year');

Insert Into LeaseType
	(LeaseTypeNumber, LeaseTypeDescription)
Values
	(1, 'Monthly');

Insert Into LeaseType
	(LeaseTypeNumber, LeaseTypeDescription)
Values
	(9, 'Shared Lease');

Insert Into LeaseType
	(LeaseTypeNumber, LeaseTypeDescription)
Values
	(8, 'Virtual Monthly');

Insert Into LeaseType
	(LeaseTypeNumber, LeaseTypeDescription)
Values
	(4, 'One Year');

Insert Into LeaseType
	(LeaseTypeNumber, LeaseTypeDescription)
Values
	(2, 'Six Months');

Insert Into LeaseType
	(LeaseTypeNumber, LeaseTypeDescription)
Values
	(3, 'Weekly');

Insert Into LeaseType
	(LeaseTypeNumber, LeaseTypeDescription)
Values
	(6, 'Part-Time');


-- Insert Into Lease

Insert Into Lease
	(LeaseNumber, StartDate, EndDate, TotalLeaseCost, TotalLeasePrice, OfficeNumber, DeskHolderID, LeaseTypeNumber)  
Values
	(241, To_Timestamp('18-Jun-2025', 'DD-Mon-YYYY'), To_Timestamp('23-Apr-2027', 'DD-Mon-YYYY'), 0.00, 0.00, 179, 'GRE001', 4); 

Insert Into Lease
	(LeaseNumber, StartDate, EndDate, TotalLeaseCost, TotalLeasePrice, OfficeNumber, DeskHolderID, LeaseTypeNumber)  
Values
	(214, To_Timestamp('23-Dec-2023', 'DD-Mon-YYYY'), Null, 687.59, 1718.98, 148, 'LON001', 6); 

Insert Into Lease
	(LeaseNumber, StartDate, EndDate, TotalLeaseCost, TotalLeasePrice, OfficeNumber, DeskHolderID, LeaseTypeNumber)  
Values
	(188, To_Timestamp('08-Oct-2023', 'DD-Mon-YYYY'), Null, 134.40, 336.00, 128, 'EIL001', 6); 

Insert Into Lease
	(LeaseNumber, StartDate, EndDate, TotalLeaseCost, TotalLeasePrice, OfficeNumber, DeskHolderID, LeaseTypeNumber)  
Values
	(185, To_Timestamp('28-Apr-2026', 'DD-Mon-YYYY'), Null, 108.00, 270.00, 174, 'HAC001', 3); 

Insert Into Lease
	(LeaseNumber, StartDate, EndDate, TotalLeaseCost, TotalLeasePrice, OfficeNumber, DeskHolderID, LeaseTypeNumber)  
Values
	(172, To_Timestamp('08-Feb-2024', 'DD-Mon-YYYY'), Null, 132.00, 330.00, 228, 'LOB001', 1); 

Insert Into Lease
	(LeaseNumber, StartDate, EndDate, TotalLeaseCost, TotalLeasePrice, OfficeNumber, DeskHolderID, LeaseTypeNumber)  
Values
	(127, To_Timestamp('25-Feb-2025', 'DD-Mon-YYYY'), Null, 125.08, 312.71, 248, 'COR001', 4); 

Insert Into Lease
	(LeaseNumber, StartDate, EndDate, TotalLeaseCost, TotalLeasePrice, OfficeNumber, DeskHolderID, LeaseTypeNumber)  
Values
	(175, To_Timestamp('28-Apr-2025', 'DD-Mon-YYYY'), Null, 8.40, 21.00, 248, 'DON001', 3); 

Insert Into Lease
	(LeaseNumber, StartDate, EndDate, TotalLeaseCost, TotalLeasePrice, OfficeNumber, DeskHolderID, LeaseTypeNumber)  
Values
	(203, To_Timestamp('10-Mar-2026', 'DD-Mon-YYYY'), Null, 0.00, 0.00, 156, 'FER001', 3); 

Insert Into Lease
	(LeaseNumber, StartDate, EndDate, TotalLeaseCost, TotalLeasePrice, OfficeNumber, DeskHolderID, LeaseTypeNumber)  
Values
	(159, To_Timestamp('18-Feb-2025', 'DD-Mon-YYYY'), Null, 36.00, 90.00, 156, 'KNO001', 3); 

Insert Into Lease
	(LeaseNumber, StartDate, EndDate, TotalLeaseCost, TotalLeasePrice, OfficeNumber, DeskHolderID, LeaseTypeNumber)  
Values
	(103, To_Timestamp('18-Apr-2025', 'DD-Mon-YYYY'), Null, 0.00, 0.00, 228, 'LOB001', 3); 

Insert Into Lease
	(LeaseNumber, StartDate, EndDate, TotalLeaseCost, TotalLeasePrice, OfficeNumber, DeskHolderID, LeaseTypeNumber)  
Values
	(113, To_Timestamp('31-Mar-2026', 'DD-Mon-YYYY'), To_Timestamp('23-Dec-2027', 'DD-Mon-YYYY'), 21.60, 54.00, 245, 'LON001', 5); 

Insert Into Lease
	(LeaseNumber, StartDate, EndDate, TotalLeaseCost, TotalLeasePrice, OfficeNumber, DeskHolderID, LeaseTypeNumber)  
Values
	(107, To_Timestamp('20-Jun-2026', 'DD-Mon-YYYY'), Null, 0.00, 0.00, 207, 'VIT001', 5); 

Insert Into Lease
	(LeaseNumber, StartDate, EndDate, TotalLeaseCost, TotalLeasePrice, OfficeNumber, DeskHolderID, LeaseTypeNumber)  
Values
	(236, To_Timestamp('08-Jan-2027', 'DD-Mon-YYYY'), Null, 365.98, 914.96, 129, 'BRO001', 2); 

Insert Into Lease
	(LeaseNumber, StartDate, EndDate, TotalLeaseCost, TotalLeasePrice, OfficeNumber, DeskHolderID, LeaseTypeNumber)  
Values
	(114, To_Timestamp('30-Apr-2025', 'DD-Mon-YYYY'), To_Timestamp('25-Aug-2029', 'DD-Mon-YYYY'), 11.40, 28.50, 223, 'JOB001', 4); 

Insert Into Lease
	(LeaseNumber, StartDate, EndDate, TotalLeaseCost, TotalLeasePrice, OfficeNumber, DeskHolderID, LeaseTypeNumber)  
Values
	(131, To_Timestamp('18-Apr-2025', 'DD-Mon-YYYY'), Null, 0.00, 0.00, 129, 'SYN001', 2); 

Insert Into Lease
	(LeaseNumber, StartDate, EndDate, TotalLeaseCost, TotalLeasePrice, OfficeNumber, DeskHolderID, LeaseTypeNumber)  
Values
	(247, To_Timestamp('07-Jul-2026', 'DD-Mon-YYYY'), Null, 0.00, 0.00, 233, 'DEA001', 3); 

Insert Into Lease
	(LeaseNumber, StartDate, EndDate, TotalLeaseCost, TotalLeasePrice, OfficeNumber, DeskHolderID, LeaseTypeNumber)  
Values
	(153, To_Timestamp('28-Apr-2024', 'DD-Mon-YYYY'), To_Timestamp('02-Oct-2027', 'DD-Mon-YYYY'), 200.00, 500.00, 172, 'UND001', 2); 

Insert Into Lease
	(LeaseNumber, StartDate, EndDate, TotalLeaseCost, TotalLeasePrice, OfficeNumber, DeskHolderID, LeaseTypeNumber)  
Values
	(88, To_Timestamp('01-Oct-2026', 'DD-Mon-YYYY'), Null, 28.80, 72.00, 196, 'CAT001', 2); 

Insert Into Lease
	(LeaseNumber, StartDate, EndDate, TotalLeaseCost, TotalLeasePrice, OfficeNumber, DeskHolderID, LeaseTypeNumber)  
Values
	(156, To_Timestamp('18-Aug-2025', 'DD-Mon-YYYY'), Null, 800.00, 2000.00, 245, 'VIT001', 1); 

Insert Into Lease
	(LeaseNumber, StartDate, EndDate, TotalLeaseCost, TotalLeasePrice, OfficeNumber, DeskHolderID, LeaseTypeNumber)  
Values
	(221, To_Timestamp('16-May-2024', 'DD-Mon-YYYY'), To_Timestamp('01-Feb-2027', 'DD-Mon-YYYY'), 1397.90, 3494.75, 223, 'COL001', 4); 

Insert Into Lease
	(LeaseNumber, StartDate, EndDate, TotalLeaseCost, TotalLeasePrice, OfficeNumber, DeskHolderID, LeaseTypeNumber)  
Values
	(85, To_Timestamp('03-Sep-2025', 'DD-Mon-YYYY'), Null, 626.10, 1565.25, 204, 'PAT001', 5); 

Insert Into Lease
	(LeaseNumber, StartDate, EndDate, TotalLeaseCost, TotalLeasePrice, OfficeNumber, DeskHolderID, LeaseTypeNumber)  
Values
	(204, To_Timestamp('28-Apr-2026', 'DD-Mon-YYYY'), To_Timestamp('12-Apr-2028', 'DD-Mon-YYYY'), 24.00, 60.00, 145, 'ING001', 6); 

Insert Into Lease
	(LeaseNumber, StartDate, EndDate, TotalLeaseCost, TotalLeasePrice, OfficeNumber, DeskHolderID, LeaseTypeNumber)  
Values
	(198, To_Timestamp('27-Aug-2026', 'DD-Mon-YYYY'), Null, 60.00, 150.00, 128, 'WIL001', 6); 

Insert Into Lease
	(LeaseNumber, StartDate, EndDate, TotalLeaseCost, TotalLeasePrice, OfficeNumber, DeskHolderID, LeaseTypeNumber)  
Values
	(211, To_Timestamp('03-Apr-2024', 'DD-Mon-YYYY'), Null, 43.80, 109.49, 128, 'HAT001', 4); 

Insert Into Lease
	(LeaseNumber, StartDate, EndDate, TotalLeaseCost, TotalLeasePrice, OfficeNumber, DeskHolderID, LeaseTypeNumber)  
Values
	(168, To_Timestamp('14-Oct-2025', 'DD-Mon-YYYY'), Null, 997.19, 2492.98, 196, 'BUR001', 2); 


-- Insert Into OfficeAddOn

Insert Into OfficeAddOn
	(AddOnNumber, AddOnDescription, CurrentCost, CurrentPrice, Discount)
Values
	(1, 'Office Rent', 0.00, 0.00, 0.00);

Insert Into OfficeAddOn
	(AddOnNumber, AddOnDescription, CurrentCost, CurrentPrice, Discount)
Values
	(7, 'Postage', 1.00, 3.00, 5.00);

Insert Into OfficeAddOn
	(AddOnNumber, AddOnDescription, CurrentCost, CurrentPrice, Discount)
Values
	(10, 'Power Strip Surge Protector (6 outlet)', 29.99, 49.99, Null);

Insert Into OfficeAddOn
	(AddOnNumber, AddOnDescription, CurrentCost, CurrentPrice, Discount)
Values
	(14, 'Video Conferencing Equipment Access (1 hour)', 250.00, 500.00, Null);

Insert Into OfficeAddOn
	(AddOnNumber, AddOnDescription, CurrentCost, CurrentPrice, Discount)
Values
	(5, 'Photocopy (black and white)', 0.50, 1.50, Null);

Insert Into OfficeAddOn
	(AddOnNumber, AddOnDescription, CurrentCost, CurrentPrice, Discount)
Values
	(9, 'Commission of Oaths (per document)', 15.00, 45.00, Null);

Insert Into OfficeAddOn
	(AddOnNumber, AddOnDescription, CurrentCost, CurrentPrice, Discount)
Values
	(8, 'Boardroom Rental (30 minutes)', 25.00, 75.00, 10.00);

Insert Into OfficeAddOn
	(AddOnNumber, AddOnDescription, CurrentCost, CurrentPrice, Discount)
Values
	(12, 'Laptop Docking Station (USBC)', 69.99, 94.99, Null);

Insert Into OfficeAddOn
	(AddOnNumber, AddOnDescription, CurrentCost, CurrentPrice, Discount)
Values
	(2, 'Damage Deposit', 0.00, 1500.00, Null);

Insert Into OfficeAddOn
	(AddOnNumber, AddOnDescription, CurrentCost, CurrentPrice, Discount)
Values
	(3, 'Access Card Deposit', 25.00, 50.00, Null);

Insert Into OfficeAddOn
	(AddOnNumber, AddOnDescription, CurrentCost, CurrentPrice, Discount)
Values
	(4, 'Internet (per month)', 19.99, 59.99, Null);

Insert Into OfficeAddOn
	(AddOnNumber, AddOnDescription, CurrentCost, CurrentPrice, Discount)
Values
	(11, 'Desk Lamp (LED)', 59.99, 69.99, Null);

Insert Into OfficeAddOn
	(AddOnNumber, AddOnDescription, CurrentCost, CurrentPrice, Discount)
Values
	(6, 'Photocopy (colour)', 0.75, 2.25, Null);

Insert Into OfficeAddOn
	(AddOnNumber, AddOnDescription, CurrentCost, CurrentPrice, Discount)
Values
	(13, 'Keyboard and Mouse (wireless)', 39.99, 59.99, Null);

-- Insert Into Invoice

Insert Into Invoice
	(InvoiceNumber, InvoiceDate, PaidYN, InvoiceGST, InvoiceTotal, LeaseNumber) 
Values
	(140, To_Timestamp('02-Jul-2024 10:17:33', 'DD-Mon-YYYY HH24:MI:SS'), 'N', 92.50, 1850.00, 221); 

Insert Into Invoice
	(InvoiceNumber, InvoiceDate, PaidYN, InvoiceGST, InvoiceTotal, LeaseNumber) 
Values
	(240, To_Timestamp('29-Nov-2025 13:42:53', 'DD-Mon-YYYY HH24:MI:SS'), 'N', 8.40, 167.98, 168); 

Insert Into Invoice
	(InvoiceNumber, InvoiceDate, PaidYN, InvoiceGST, InvoiceTotal, LeaseNumber) 
Values
	(310, To_Timestamp('01-Nov-2026 18:46:36', 'DD-Mon-YYYY HH24:MI:SS'), 'Y', 3.60, 72.00, 88); 

Insert Into Invoice
	(InvoiceNumber, InvoiceDate, PaidYN, InvoiceGST, InvoiceTotal, LeaseNumber) 
Values
	(130, To_Timestamp('02-Jun-2024 11:35:33', 'DD-Mon-YYYY HH24:MI:SS'), 'Y', 10.00, 200.00, 153); 

Insert Into Invoice
	(InvoiceNumber, InvoiceDate, PaidYN, InvoiceGST, InvoiceTotal, LeaseNumber) 
Values
	(325, To_Timestamp('01-Nov-2026 17:34:51', 'DD-Mon-YYYY HH24:MI:SS'), 'N', 14.25, 284.96, 236); 

Insert Into Invoice
	(InvoiceNumber, InvoiceDate, PaidYN, InvoiceGST, InvoiceTotal, LeaseNumber) 
Values
	(220, To_Timestamp('01-Oct-2025 16:18:30', 'DD-Mon-YYYY HH24:MI:SS'), 'Y', 95.00, 1900.00, 156); 

Insert Into Invoice
	(InvoiceNumber, InvoiceDate, PaidYN, InvoiceGST, InvoiceTotal, LeaseNumber) 
Values
	(250, To_Timestamp('29-Nov-2025 10:11:07', 'DD-Mon-YYYY HH24:MI:SS'), 'N', 75.00, 1500.00, 168); 

Insert Into Invoice
	(InvoiceNumber, InvoiceDate, PaidYN, InvoiceGST, InvoiceTotal, LeaseNumber) 
Values
	(255, To_Timestamp('01-May-2026 17:40:46', 'DD-Mon-YYYY HH24:MI:SS'), 'Y', 2.70, 54.00, 113); 

Insert Into Invoice
	(InvoiceNumber, InvoiceDate, PaidYN, InvoiceGST, InvoiceTotal, LeaseNumber) 
Values
	(215, To_Timestamp('01-Jun-2025 16:16:47', 'DD-Mon-YYYY HH24:MI:SS'), 'N', 1.43, 28.50, 114); 

Insert Into Invoice
	(InvoiceNumber, InvoiceDate, PaidYN, InvoiceGST, InvoiceTotal, LeaseNumber) 
Values
	(150, To_Timestamp('02-Jul-2024 15:30:40', 'DD-Mon-YYYY HH24:MI:SS'), 'N', 77.74, 1554.75, 221); 

Insert Into Invoice
	(InvoiceNumber, InvoiceDate, PaidYN, InvoiceGST, InvoiceTotal, LeaseNumber) 
Values
	(320, To_Timestamp('01-Nov-2026 08:23:32', 'DD-Mon-YYYY HH24:MI:SS'), 'Y', 31.50, 630.00, 236); 

Insert Into Invoice
	(InvoiceNumber, InvoiceDate, PaidYN, InvoiceGST, InvoiceTotal, LeaseNumber) 
Values
	(110, To_Timestamp('02-Jun-2024 11:39:46', 'DD-Mon-YYYY HH24:MI:SS'), 'N', 5.47, 109.49, 211); 

Insert Into Invoice
	(InvoiceNumber, InvoiceDate, PaidYN, InvoiceGST, InvoiceTotal, LeaseNumber) 
Values
	(85, To_Timestamp('30-Nov-2023 11:49:23', 'DD-Mon-YYYY HH24:MI:SS'), 'N', 1.35, 27.00, 188); 

Insert Into Invoice
	(InvoiceNumber, InvoiceDate, PaidYN, InvoiceGST, InvoiceTotal, LeaseNumber) 
Values
	(100, To_Timestamp('01-Apr-2024 15:46:20', 'DD-Mon-YYYY HH24:MI:SS'), 'N', 16.50, 330.00, 172); 

Insert Into Invoice
	(InvoiceNumber, InvoiceDate, PaidYN, InvoiceGST, InvoiceTotal, LeaseNumber) 
Values
	(230, To_Timestamp('01-Nov-2025 09:47:49', 'DD-Mon-YYYY HH24:MI:SS'), 'Y', 78.26, 1565.25, 85); 

Insert Into Invoice
	(InvoiceNumber, InvoiceDate, PaidYN, InvoiceGST, InvoiceTotal, LeaseNumber) 
Values
	(225, To_Timestamp('01-Oct-2025 08:15:32', 'DD-Mon-YYYY HH24:MI:SS'), 'N', 5.00, 100.00, 156); 

Insert Into Invoice
	(InvoiceNumber, InvoiceDate, PaidYN, InvoiceGST, InvoiceTotal, LeaseNumber) 
Values
	(175, To_Timestamp('31-Mar-2025 18:03:21', 'DD-Mon-YYYY HH24:MI:SS'), 'N', 0.83, 16.50, 127); 

Insert Into Invoice
	(InvoiceNumber, InvoiceDate, PaidYN, InvoiceGST, InvoiceTotal, LeaseNumber) 
Values
	(265, To_Timestamp('01-Jun-2026 16:51:04', 'DD-Mon-YYYY HH24:MI:SS'), 'N', 13.50, 270.00, 185); 

Insert Into Invoice
	(InvoiceNumber, InvoiceDate, PaidYN, InvoiceGST, InvoiceTotal, LeaseNumber) 
Values
	(170, To_Timestamp('31-Mar-2025 13:07:31', 'DD-Mon-YYYY HH24:MI:SS'), 'Y', 2.81, 56.25, 127); 

Insert Into Invoice
	(InvoiceNumber, InvoiceDate, PaidYN, InvoiceGST, InvoiceTotal, LeaseNumber) 
Values
	(235, To_Timestamp('29-Nov-2025 17:55:13', 'DD-Mon-YYYY HH24:MI:SS'), 'N', 41.25, 825.00, 168); 

Insert Into Invoice
	(InvoiceNumber, InvoiceDate, PaidYN, InvoiceGST, InvoiceTotal, LeaseNumber) 
Values
	(280, To_Timestamp('01-Jun-2026 10:22:48', 'DD-Mon-YYYY HH24:MI:SS'), 'Y', 0.68, 13.50, 204); 

Insert Into Invoice
	(InvoiceNumber, InvoiceDate, PaidYN, InvoiceGST, InvoiceTotal, LeaseNumber) 
Values
	(200, To_Timestamp('01-Jun-2025 16:50:36', 'DD-Mon-YYYY HH24:MI:SS'), 'N', 1.05, 21.00, 175); 

Insert Into Invoice
	(InvoiceNumber, InvoiceDate, PaidYN, InvoiceGST, InvoiceTotal, LeaseNumber) 
Values
	(295, To_Timestamp('01-Oct-2026 11:15:42', 'DD-Mon-YYYY HH24:MI:SS'), 'N', 5.00, 100.00, 198); 

Insert Into Invoice
	(InvoiceNumber, InvoiceDate, PaidYN, InvoiceGST, InvoiceTotal, LeaseNumber) 
Values
	(180, To_Timestamp('31-Mar-2025 13:21:17', 'DD-Mon-YYYY HH24:MI:SS'), 'Y', 12.00, 239.96, 127); 

Insert Into Invoice
	(InvoiceNumber, InvoiceDate, PaidYN, InvoiceGST, InvoiceTotal, LeaseNumber) 
Values
	(160, To_Timestamp('31-Mar-2025 14:24:07', 'DD-Mon-YYYY HH24:MI:SS'), 'N', 4.50, 90.00, 159); 

Insert Into Invoice
	(InvoiceNumber, InvoiceDate, PaidYN, InvoiceGST, InvoiceTotal, LeaseNumber) 
Values
	(95, To_Timestamp('30-Jan-2024 13:38:33', 'DD-Mon-YYYY HH24:MI:SS'), 'Y', 10.50, 209.98, 214); 

Insert Into Invoice
	(InvoiceNumber, InvoiceDate, PaidYN, InvoiceGST, InvoiceTotal, LeaseNumber) 
Values
	(145, To_Timestamp('02-Jul-2024 13:59:11', 'DD-Mon-YYYY HH24:MI:SS'), 'N', 4.50, 90.00, 221); 

Insert Into Invoice
	(InvoiceNumber, InvoiceDate, PaidYN, InvoiceGST, InvoiceTotal, LeaseNumber) 
Values
	(300, To_Timestamp('01-Oct-2026 15:03:58', 'DD-Mon-YYYY HH24:MI:SS'), 'Y', 2.50, 50.00, 198); 

Insert Into Invoice
	(InvoiceNumber, InvoiceDate, PaidYN, InvoiceGST, InvoiceTotal, LeaseNumber) 
Values
	(120, To_Timestamp('02-Jun-2024 13:40:04', 'DD-Mon-YYYY HH24:MI:SS'), 'N', 15.00, 300.00, 153); 

Insert Into Invoice
	(InvoiceNumber, InvoiceDate, PaidYN, InvoiceGST, InvoiceTotal, LeaseNumber) 
Values
	(90, To_Timestamp('30-Jan-2024 14:51:27', 'DD-Mon-YYYY HH24:MI:SS'), 'N', 75.45, 1509.00, 214); 

Insert Into Invoice
	(InvoiceNumber, InvoiceDate, PaidYN, InvoiceGST, InvoiceTotal, LeaseNumber) 
Values
	(270, To_Timestamp('01-Jun-2026 09:56:56', 'DD-Mon-YYYY HH24:MI:SS'), 'N', 2.33, 46.50, 204); 

Insert Into Invoice
	(InvoiceNumber, InvoiceDate, PaidYN, InvoiceGST, InvoiceTotal, LeaseNumber) 
Values
	(80, To_Timestamp('30-Nov-2023 12:07:57', 'DD-Mon-YYYY HH24:MI:SS'), 'N', 15.45, 309.00, 188); 

-- Insert Into InvoiceItem

Insert Into InvoiceItem
	(InvoiceNumber, AddOnNumber, QuantitySold, InvoiceAddOnCost, InvoiceAddOnPrice) 
Values
	(215, 5, 19, 0.50, 1.50); 

Insert Into InvoiceItem
	(InvoiceNumber, AddOnNumber, QuantitySold, InvoiceAddOnCost, InvoiceAddOnPrice) 
Values
	(90, 5, 6, 0.50, 1.50); 

Insert Into InvoiceItem
	(InvoiceNumber, AddOnNumber, QuantitySold, InvoiceAddOnCost, InvoiceAddOnPrice) 
Values
	(90, 2, 1, 0.00, 1500.00); 

Insert Into InvoiceItem
	(InvoiceNumber, AddOnNumber, QuantitySold, InvoiceAddOnCost, InvoiceAddOnPrice) 
Values
	(230, 2, 1, 0.00, 1500.00); 

Insert Into InvoiceItem
	(InvoiceNumber, AddOnNumber, QuantitySold, InvoiceAddOnCost, InvoiceAddOnPrice) 
Values
	(325, 4, 4, 19.99, 59.99); 

Insert Into InvoiceItem
	(InvoiceNumber, AddOnNumber, QuantitySold, InvoiceAddOnCost, InvoiceAddOnPrice) 
Values
	(265, 8, 3, 25.00, 75.00); 

Insert Into InvoiceItem
	(InvoiceNumber, AddOnNumber, QuantitySold, InvoiceAddOnCost, InvoiceAddOnPrice) 
Values
	(270, 6, 8, 0.75, 2.25); 

Insert Into InvoiceItem
	(InvoiceNumber, AddOnNumber, QuantitySold, InvoiceAddOnCost, InvoiceAddOnPrice) 
Values
	(320, 9, 4, 15.00, 45.00); 

Insert Into InvoiceItem
	(InvoiceNumber, AddOnNumber, QuantitySold, InvoiceAddOnCost, InvoiceAddOnPrice) 
Values
	(95, 9, 2, 15.00, 45.00); 

Insert Into InvoiceItem
	(InvoiceNumber, AddOnNumber, QuantitySold, InvoiceAddOnCost, InvoiceAddOnPrice) 
Values
	(140, 1, 1, 700.00, 1750.00); 

Insert Into InvoiceItem
	(InvoiceNumber, AddOnNumber, QuantitySold, InvoiceAddOnCost, InvoiceAddOnPrice) 
Values
	(145, 9, 2, 15.00, 45.00); 

Insert Into InvoiceItem
	(InvoiceNumber, AddOnNumber, QuantitySold, InvoiceAddOnCost, InvoiceAddOnPrice) 
Values
	(310, 7, 24, 1.00, 3.00); 

Insert Into InvoiceItem
	(InvoiceNumber, AddOnNumber, QuantitySold, InvoiceAddOnCost, InvoiceAddOnPrice) 
Values
	(130, 3, 4, 25.00, 50.00); 

Insert Into InvoiceItem
	(InvoiceNumber, AddOnNumber, QuantitySold, InvoiceAddOnCost, InvoiceAddOnPrice) 
Values
	(240, 4, 2, 19.99, 59.99); 

Insert Into InvoiceItem
	(InvoiceNumber, AddOnNumber, QuantitySold, InvoiceAddOnCost, InvoiceAddOnPrice) 
Values
	(170, 6, 25, 0.75, 2.25); 

Insert Into InvoiceItem
	(InvoiceNumber, AddOnNumber, QuantitySold, InvoiceAddOnCost, InvoiceAddOnPrice) 
Values
	(100, 3, 3, 25.00, 50.00); 

Insert Into InvoiceItem
	(InvoiceNumber, AddOnNumber, QuantitySold, InvoiceAddOnCost, InvoiceAddOnPrice) 
Values
	(85, 7, 4, 1.00, 3.00); 

Insert Into InvoiceItem
	(InvoiceNumber, AddOnNumber, QuantitySold, InvoiceAddOnCost, InvoiceAddOnPrice) 
Values
	(270, 5, 19, 0.50, 1.50); 

Insert Into InvoiceItem
	(InvoiceNumber, AddOnNumber, QuantitySold, InvoiceAddOnCost, InvoiceAddOnPrice) 
Values
	(200, 7, 7, 1.00, 3.00); 

Insert Into InvoiceItem
	(InvoiceNumber, AddOnNumber, QuantitySold, InvoiceAddOnCost, InvoiceAddOnPrice) 
Values
	(80, 7, 8, 1.00, 3.00); 

Insert Into InvoiceItem
	(InvoiceNumber, AddOnNumber, QuantitySold, InvoiceAddOnCost, InvoiceAddOnPrice) 
Values
	(320, 8, 4, 25.00, 75.00); 

Insert Into InvoiceItem
	(InvoiceNumber, AddOnNumber, QuantitySold, InvoiceAddOnCost, InvoiceAddOnPrice) 
Values
	(300, 3, 1, 25.00, 50.00); 

Insert Into InvoiceItem
	(InvoiceNumber, AddOnNumber, QuantitySold, InvoiceAddOnCost, InvoiceAddOnPrice) 
Values
	(150, 2, 1, 0.00, 1500.00); 

Insert Into InvoiceItem
	(InvoiceNumber, AddOnNumber, QuantitySold, InvoiceAddOnCost, InvoiceAddOnPrice) 
Values
	(225, 3, 2, 25.00, 50.00); 

Insert Into InvoiceItem
	(InvoiceNumber, AddOnNumber, QuantitySold, InvoiceAddOnCost, InvoiceAddOnPrice) 
Values
	(235, 8, 1, 25.00, 75.00); 

Insert Into InvoiceItem
	(InvoiceNumber, AddOnNumber, QuantitySold, InvoiceAddOnCost, InvoiceAddOnPrice) 
Values
	(110, 6, 22, 0.75, 2.25); 

Insert Into InvoiceItem
	(InvoiceNumber, AddOnNumber, QuantitySold, InvoiceAddOnCost, InvoiceAddOnPrice) 
Values
	(110, 4, 1, 19.99, 59.99); 

Insert Into InvoiceItem
	(InvoiceNumber, AddOnNumber, QuantitySold, InvoiceAddOnCost, InvoiceAddOnPrice) 
Values
	(80, 9, 3, 15.00, 45.00); 

Insert Into InvoiceItem
	(InvoiceNumber, AddOnNumber, QuantitySold, InvoiceAddOnCost, InvoiceAddOnPrice) 
Values
	(220, 1, 1, 760.00, 1900.00); 

Insert Into InvoiceItem
	(InvoiceNumber, AddOnNumber, QuantitySold, InvoiceAddOnCost, InvoiceAddOnPrice) 
Values
	(175, 5, 11, 0.50, 1.50); 

Insert Into InvoiceItem
	(InvoiceNumber, AddOnNumber, QuantitySold, InvoiceAddOnCost, InvoiceAddOnPrice) 
Values
	(120, 8, 4, 25.00, 75.00); 

Insert Into InvoiceItem
	(InvoiceNumber, AddOnNumber, QuantitySold, InvoiceAddOnCost, InvoiceAddOnPrice) 
Values
	(100, 9, 4, 15.00, 45.00); 

Insert Into InvoiceItem
	(InvoiceNumber, AddOnNumber, QuantitySold, InvoiceAddOnCost, InvoiceAddOnPrice) 
Values
	(240, 7, 16, 1.00, 3.00); 

Insert Into InvoiceItem
	(InvoiceNumber, AddOnNumber, QuantitySold, InvoiceAddOnCost, InvoiceAddOnPrice) 
Values
	(280, 5, 9, 0.50, 1.50); 

Insert Into InvoiceItem
	(InvoiceNumber, AddOnNumber, QuantitySold, InvoiceAddOnCost, InvoiceAddOnPrice) 
Values
	(85, 5, 10, 0.50, 1.50); 

Insert Into InvoiceItem
	(InvoiceNumber, AddOnNumber, QuantitySold, InvoiceAddOnCost, InvoiceAddOnPrice) 
Values
	(160, 9, 2, 15.00, 45.00); 

Insert Into InvoiceItem
	(InvoiceNumber, AddOnNumber, QuantitySold, InvoiceAddOnCost, InvoiceAddOnPrice) 
Values
	(140, 3, 2, 25.00, 50.00); 

Insert Into InvoiceItem
	(InvoiceNumber, AddOnNumber, QuantitySold, InvoiceAddOnCost, InvoiceAddOnPrice) 
Values
	(95, 4, 2, 19.99, 59.99); 

Insert Into InvoiceItem
	(InvoiceNumber, AddOnNumber, QuantitySold, InvoiceAddOnCost, InvoiceAddOnPrice) 
Values
	(150, 5, 23, 0.50, 1.50); 

Insert Into InvoiceItem
	(InvoiceNumber, AddOnNumber, QuantitySold, InvoiceAddOnCost, InvoiceAddOnPrice) 
Values
	(180, 4, 4, 19.99, 59.99); 

Insert Into InvoiceItem
	(InvoiceNumber, AddOnNumber, QuantitySold, InvoiceAddOnCost, InvoiceAddOnPrice) 
Values
	(80, 8, 2, 25.00, 75.00); 

Insert Into InvoiceItem
	(InvoiceNumber, AddOnNumber, QuantitySold, InvoiceAddOnCost, InvoiceAddOnPrice) 
Values
	(235, 1, 1, 300.00, 750.00); 

Insert Into InvoiceItem
	(InvoiceNumber, AddOnNumber, QuantitySold, InvoiceAddOnCost, InvoiceAddOnPrice) 
Values
	(295, 3, 2, 25.00, 50.00); 

Insert Into InvoiceItem
	(InvoiceNumber, AddOnNumber, QuantitySold, InvoiceAddOnCost, InvoiceAddOnPrice) 
Values
	(250, 2, 1, 0.00, 1500.00); 

Insert Into InvoiceItem
	(InvoiceNumber, AddOnNumber, QuantitySold, InvoiceAddOnCost, InvoiceAddOnPrice) 
Values
	(265, 9, 1, 15.00, 45.00); 

Insert Into InvoiceItem
	(InvoiceNumber, AddOnNumber, QuantitySold, InvoiceAddOnCost, InvoiceAddOnPrice) 
Values
	(255, 6, 24, 0.75, 2.25); 

Insert Into InvoiceItem
	(InvoiceNumber, AddOnNumber, QuantitySold, InvoiceAddOnCost, InvoiceAddOnPrice) 
Values
	(325, 7, 15, 1.00, 3.00); 

Insert Into InvoiceItem
	(InvoiceNumber, AddOnNumber, QuantitySold, InvoiceAddOnCost, InvoiceAddOnPrice) 
Values
	(150, 6, 9, 0.75, 2.25); 

Insert Into InvoiceItem
	(InvoiceNumber, AddOnNumber, QuantitySold, InvoiceAddOnCost, InvoiceAddOnPrice) 
Values
	(230, 6, 29, 0.75, 2.25); 

Insert Into InvoiceItem
	(InvoiceNumber, AddOnNumber, QuantitySold, InvoiceAddOnCost, InvoiceAddOnPrice) 
Values
	(320, 3, 3, 25.00, 50.00); 
