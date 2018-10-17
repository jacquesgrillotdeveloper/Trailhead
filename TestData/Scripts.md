# Account Query 
SELECT Id, Name, Type, BillingStreet, BillingCity, BillingState, BillingPostalCode, BillingCountry, ShippingStreet, ShippingCity, ShippingState, ShippingPostalCode, ShippingCountry, Phone, Fax, AccountNumber, Website, Sic, Industry, AnnualRevenue, NumberOfEmployees, Ownership, TickerSymbol, Description FROM Account

# Contact Query
SELECT Id, AccountId, LastName, FirstName, Salutation, MailingStreet, MailingCity, MailingState, MailingPostalCode, MailingCountry, Phone, Fax, MobilePhone, AssistantPhone, Email, Title, Department, AssistantName, LeadSource, Birthdate FROM Contact

# Account Contact Export
sfdx force:data:tree:export -u MyTP -q "SELECT Id, Name, Type, BillingStreet, BillingCity, BillingState, BillingPostalCode, BillingCountry, ShippingStreet, ShippingCity, ShippingState, ShippingPostalCode, ShippingCountry, Phone, Fax, AccountNumber, Website, Sic, Industry, AnnualRevenue, NumberOfEmployees, Ownership, TickerSymbol, Description, (SELECT Id, AccountId, LastName, FirstName, Salutation, MailingStreet, MailingCity, MailingState, MailingPostalCode, MailingCountry, Phone, Fax, MobilePhone, AssistantPhone, Email, Title, Department, AssistantName, LeadSource, Birthdate FROM Contacts) FROM Account" --outputdir TestData --plan