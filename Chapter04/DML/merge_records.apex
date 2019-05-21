// Let's insert some records to merge
List<Account> lstAccounts = new List<Account>{
 new Account(Name = 'Acme'),
 new Account(Name = 'Acme Inc.'),
 new Account(Name = 'Acme NV') 
};

// we need to insert 2 object types, linked to each other. If the second operation fails, I don't need the accounts.
Savepoint currentStatus = Database.setSavepoint();
try{
 // insert the accounts to be sure you have these accounts in your database
 insert lstAccounts;

 // define now 2 variables for the master account and the duplicate account
 Account aMaster = lstAccounts[0];
 List<Account> lstDuplicateAccounts = new List<Account>{lstAccounts[1],lstAccounts[2]};
 
 // insert now a contact on each of the accounts. We do this in the same try catch module
 List<Contact> lstContacts = new List<Contact>{
  new Contact(LastName = 'Acme', FirstName = 'Contact', AccountId = aMaster.Id),
  new Contact(LastName = 'Acme Inc.', FirstName = 'Contact', AccountId = lstAccounts[1].Id),
  new Contact(LastName = 'Acme NV', FirstName = 'Contact', AccountId = lstAccounts[2].Id)
 };
 
 insert lstContacts;
 System.debug('Accounts and contacts inserted');
 
 // the merge operation
 merge aMaster lstDuplicateAccounts;
 System.debug('Accounts merged');

} catch (DMLException ex){
 Database.rollback(currentStatus);
 System.debug(ex.getMessage());
}