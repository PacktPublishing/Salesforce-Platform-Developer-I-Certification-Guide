
// Select the cast records with the Id
List<Cast__c> lstCasts = new List<Cast__c>([SELECT Id FROM Cast__c]);
For (Cast__c theCast : lstCasts){
	theCast.Rating__c = '3'; // while this is a picklist field, we need to provide a String to this field
}

List<Database.SaveResult> lstSavedCasts = Database.update(lstCasts, false);
For (Database.SaveResult savedCast : lstSavedCasts){
	If (! savedCast.isSuccess()){
		System.debug(savedCast.getErrors()[0].getMessage());
	} else {
		System.debug('Record is successfully updated');
	}
}
