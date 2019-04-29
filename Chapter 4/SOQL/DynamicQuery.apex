String sAccountName = 'Burlington%';
String sQuery = 'SELECT Id, Name FROM Account WHERE Name Like \'' + sAccountName + '\'';
List<Account> lstAccounts = (List<Account>) Database.query(sQuery); // we cast the result of the query (a list with SObjects) to a list with accounts