List<Database.SaveResult> lstSavedRecords = Database.update(lstAccounts, false);
Integer iCounter = 0;

for (Database.SaveResult savedAccount : lstSavedRecords){
	if (! savedAccount.isSuccess()){
		// self made error with a custom label
		lstAccounts[iCounter].addError(Label.Please_enter_your_Error_here);

		// the exception thrown
		lstAccounts[iCounter].addError(savedAccount.getErrors()[0].getMessage());
	}

	iCounter++;
}
