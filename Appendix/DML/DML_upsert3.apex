// Prepare the records
Person__c actor1 = new Person__c(Name = 'Kaley Cuoco', Birthdate__c = Date.newInstance(1985,11,30), External_Id__c = '117');
Person__c actor2 = new Person__c(Name = 'Jim Parsons', Birthdate__c = Date.newInstance(1973,3,24), External_Id__c = '118');
Person__c actor3 = new Person__c(Name = 'Melissa Rauch', Birthdate__c = Date.newInstance(1980,6,23), External_Id__c = '119');
Person__c actor4 = new Person__c(Name = 'Aarti Mann', Birthdate__c = Date.newInstance(1978,3,3), External_Id__c = '120');

List<Person__c> lstPersons = new List<Person__c>{actor1,actor2,actor3,actor4};

// Get the field to compare the person records
Schema.SObjectField fieldToCompare = Person__c.fields.External_Id__c;

// execute the DML statement
List<Database.UpsertResult> lstUpsertedPersons = Database.upsert(lstPersons, fieldToCompare, false);

// loop through the results and check if the records is upserted
For (Database.UpsertResult savedPerson : lstUpsertedPersons){
 If (savedPerson.isSuccess()){
 System.debug('Person upserted');
 } else {
 System.debug('Record not upserted: ' + savedPerson.getErrors()[0].getMessage());
 }
}