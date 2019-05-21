// Prepare the records to insert into the database
Account newAccount1 = new Account();
Account newAccount2 = new Account(Name = 'My new Account');
List<Account> lstAccounts = new List<Account>{newAccount1,newAccount2};

// execute the DML statement
List<Database.SaveResult> insertedAccounts = Database.insert(lstAccounts, false);

// loop through the results and check if the records are inserted
For (Database.SaveResult savedAccount : insertedAccounts){
  If (!savedAccount.isSuccess()){
    // the record is not inserted, we display the error message in the debug log
    System.debug(savedAccount.getErrors()[0].getMessage());
  } else {
    // the record is inserted. We can grab the Id from the inserted record
    System.debug('Account Successfully inserted. Id: ' + savedAccount.getId());
  }
}