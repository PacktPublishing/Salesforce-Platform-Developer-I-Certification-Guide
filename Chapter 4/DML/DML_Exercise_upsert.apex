// Define a counter to compile the external id
Integer iCounter = 1;

// Select the person records and add the data to a list of the object Person__c. Name the variable of your list 'lstPersons'. Add your code below this line


// loop through the person records and update the External ID with the string value of the counter
For (Person__c thePerson : lstPersons){
  // assign the string of the counter to the property External_Id__c of the object person.Add your code below this line
  
  // increment the counter with 1 (to give the next record a new External Id). Add your code below this line
  
}

Try {
  // update the list of persons with the short notation of the DML Statements.Add your code below this line
  
} catch (DMLException ex){
  // all records should pass. If an error, adapt the data in the corresponding failed records
  // if not, write here a debug statement with the error message. Add your code below this line
  
}


// prepare the records to upsert via the short notation
Person__c actor1 = new Person__c(Name = 'Morgan Freeman', Birthdate__c = Date.newInstance(1936,6,1), External_Id__c = '8');
// prepare all other records you need for this exercise. Add your code below this line. Yes you need to write them out (see table above for the values)


// Add the actors to a list to upsert into the database. Add your code below this line


 
try {
  // upsert the list with persons. Use the external reference to find out if the record already exist or not. Add your code below this line
  
  // add a debug statement to check if all actors are upserted. Add your code below this line
  
} catch (DMLException ex){
  // Something can go wrong ! Write a debug statement with the error message. Add your code below this line
  
}


// Prepare the records
// Create your records from the table. Add your code below the first actor
Person__c actor1 = new Person__c(Name = 'Kaley Cuoco', Birthdate__c = Date.newInstance(1985,11,30), External_Id__c = '117');

// put the actors in a list. Add your code below this line


// Get the field to compare the person records
Schema.SObjectField fieldToCompare = Person__c.fields.External_Id__c;

// execute the DML statement. The referer if an actor already exists is the field External_Id__c. The DML result for an upsert call is a Database.UpsertResult object. Name the variable of your results 'lstUpsertedPersons. Add your code below this line


// loop through the results and check if the records is upserted
For (Database.UpsertResult savedPerson : lstUpsertedPersons){
  // Check if the savedPerson is upserted or not. Create 2 debug statements (success and failed). If failed, add the error message into th debug logs.Add your code below this line.

}