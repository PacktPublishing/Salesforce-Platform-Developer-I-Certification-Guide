trigger Account_Trigger on Account (before update, before insert) {
	if (Trigger.isUpdate){
		Map<Id, Account> mapAccounts = (Map<Id, Account>) Trigger.newMap;
		
		// This is the asynchronous method from the class
		SomeClass.someFutureMethod(mapAccounts.keySet());
	}	
}
