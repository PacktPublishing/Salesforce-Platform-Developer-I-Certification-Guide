Date dueDate = Date.today().addYears(-1); // today minus 1 year
List<Account> lstAccounts = new List<Account>([SELECT Id FROM Account WHERE LastModifiedDate < :dueDate]);

// we perform only the operation if there are records in the list
if (lstAccounts.size() > 0){
   List<Database.DeleteResult> deletedAccounts = Database.delete(lstAccounts, false);
   for (Database.DeleteResult removedAccount : deletedAccounts){
     if (removedAccount.isSuccess()){
       System.debug('Account Deleted');
     } else {
       System.debug(removedAccount.getErrors()[0].getMessage());
     }
   }
}