Account newAccount = new Account();
try {
  insert newAccount;
} catch (DMLException ex){
  system.debug(ex.getMessage());
}