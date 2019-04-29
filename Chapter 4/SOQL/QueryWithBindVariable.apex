String sAccountName = 'Burlington%';
List<Account> lstAccounts = [SELECT Id, Name FROM Account WHERE Name LIKE :sAccountName];