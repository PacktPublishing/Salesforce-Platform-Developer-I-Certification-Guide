public with sharing class YourCallout_Logic implements Queueable, Database.AllowsCallouts{

	public List<Account> listAccounts {get; private set;}

	public Account_TriggerHelper(List<Account> lstAccounts){
		this.listAccounts = lstAccounts;
	}

	public void execute(QueueableContext qc){
		// implement your (callout) logic to execute here

	}
}

