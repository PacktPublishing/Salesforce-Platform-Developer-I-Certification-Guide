// Select the cast records with the Id
List<Cast__c> lstCasts = new List<Cast__c>([SELECT Id FROM Cast__c]);
For (Cast__c theCast : lstCasts){
 theCast.Rating__c = '3'; // while this is a picklist field, we need to provide a String to this field even though it looks like a number
}

// We use the short version of the DML statement here
try {
 Update lstCasts;
} catch (DMLException ex) {
 System.debug(ex.getMessage());
}