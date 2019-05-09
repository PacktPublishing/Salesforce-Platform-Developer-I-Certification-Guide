For (Account tAccount : (List<Account>) Trigger.new){
	// loop through the accounts in the list from the trigger
	List<Contact> lstContact = [SELECT Lastname, FirstName FROM Contact WHERE AccountId = :tAccount.Id];
}
