// Define a counter to compile the external id
Integer iCounter = 1;

// Select the person records
List<Person__c> lstPersons = new List<Person__c>([SELECT ID FROM Person__c]);
// loop through the person records and update the External ID with the string value of the counter
For (Person__c thePerson : lstPersons){
 thePerson.External_Id__c = String.valueOf(iCounter);
 // add the counter with 1 (to give the next record a new External Id)
 iCounter++;
}

Try {
 Update lstPersons;
} catch (DMLException ex){
 // all records should pass. If an error, adapt the data in the corresponding failed records
 System.debug(ex.getMessage());
}