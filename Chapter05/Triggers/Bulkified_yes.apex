Map<Id, Account> mapAccounts = (Map<Id, Account>) Trigger.newMap;
List<Contact> lstContacts = [SELECT Firstname, LastName FROM Contact WHERE AccountId IN : mapAccounts.keySet();
