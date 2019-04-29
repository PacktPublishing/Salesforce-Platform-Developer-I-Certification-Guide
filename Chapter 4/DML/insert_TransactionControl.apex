// we set the current status of the database with the setSavepoint statement
System.Savepoint currentDatabase = Database.setSavepoint();

// prepare the account to insert
Account a = new Account(Name = 'TestAccount');

try {
  // we insert the account
  insert a; 

  // prepare the list with contacts
Contact c1 = new Contact(LastName = 'test Contact 1', AccountId = a.Id);
Contact c2 = new Contact(LastName = 'test Contact 2', AccountId = a.Id);
Contact c3 = new Contact(LastName = 'test Contact 3', AccountId = a.Id);
Contact c4 = new Contact(AccountId = a.Id);
List<Contact> lstContacts = new List<Contact>{c1,c2,c3,c4};

insert lstContacts;
System.debug('Records successfully inserted');
} catch (DMLException ex){
  // if the insert of 1 of the records fails, we go to the initial state of the database, our savepoint
  Database.rollback(currentDatabase);
  System.debug('Records not inserted: ' + ex.getMessage());
}