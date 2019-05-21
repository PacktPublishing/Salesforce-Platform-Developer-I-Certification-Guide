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


// prepare the records
Person__c actor1 = new Person__c(Name = 'Morgan Freeman', Birthdate__c = Date.newInstance(1936,6,1), External_Id__c = '8');
Person__c actor2 = new Person__c(Name = 'James Caan', Birthdate__c = Date.newInstance(1940,3,26), External_Id__c = '3');
Person__c actor3 = new Person__c(Name = 'Shannen Doherty', Birthdate__c = Date.newInstance(1971,4,12), External_Id__c = '25');
Person__c actor4 = new Person__c(Name = 'Jennie Garth', Birthdate__c = Date.newInstance(1972,4,3),External_Id__c = '26');
Person__c actor5 = new Person__c(Name = 'Jason Priestly', Birthdate__c = Date.newInstance(1969,8,28), External_Id__c = '27');
Person__c actor6 = new Person__c(Name = 'Luke Perry', Birthdate__c = Date.newInstance(1966,10,11), External_Id__c = '28');

List<Person__c> lstPersons = new List<Person__c>{actor1,actor2,actor3,actor4,actor5,actor6};

// upsert the list with persons. Use the external reference to find out if the record already exist or not
try {
	upsert lstPersons External_Id__c;
	System.debug('all actors uploaded');
} catch (DMLException ex){
	System.debug(ex.getMessage());
}


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

