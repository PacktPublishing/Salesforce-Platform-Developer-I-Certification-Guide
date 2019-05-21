String sParameter = ApexPages.currentPage().getParameters().get('YourTextfieldParam');
String sQuery = 'SELECT Id, Name FROM Account WHERE Name like \'' + sParameter + '\'';
Account a = (Account) Database.query(sQuery);

SELECT Id, Name FROM Account WHERE Name LIKE 'Myname'

SELECT Id, Name FROM Account WHERE Name LIKE '% %'