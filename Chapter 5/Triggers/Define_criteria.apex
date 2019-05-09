Map<Id, Account> mapOldAccounts = (Map<Id, Account>) Trigger.oldMap;
For (Account tAccount : (List<Account>) Trigger.new) {
	// loop through the accounts in the list from the trigger
	Account oldVersion = mapOldAccounts.get(tAccount.Id);
	If (oldVersion.Name != tAccount.Name){
		// execute the logic only if the name is changed
	}
}
