Date dueDate = Date.today().addYears(-1); // today minus 1 year
List<Account> lstAccounts = new List<Account>([SELECT Id FROM Account WHERE LastModifiedDate < :dueDate]);

// we perform only the operation if there are records in the list
if (lstAccounts.size() > 0){
   // the short notation of the DML statement
   try {
     delete lstAccounts;
     System.debug(String.valueOf(lstAccounts.size()) +  'accounts deleted');
   } catch (DMLException ex){
     System.debug(ex.getMessage());
   }
}