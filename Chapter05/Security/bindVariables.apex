Set<String> setWithStrings = new Set<String>{'test','account'};
List<Account> lstAccounts = [SELECT Id, Name FROM Account WHERE Name IN :setWithStrings];


String sParameter = '%' + ApexPages.currentPage().getParameters().get('YourTextfieldParam') + '%';
List<Account> lstAccounts = [SELECT Id, Name FROM Account WHERE Name LIKE :sParameter];

