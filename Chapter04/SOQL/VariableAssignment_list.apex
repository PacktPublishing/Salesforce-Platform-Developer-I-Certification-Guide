List<Account> lstAccounts = [SELECT Id FROM Account WHERE Name = 'I think this account does not exists'];
System.debug(lstAccounts);
System.debug(lstAccounts.size());