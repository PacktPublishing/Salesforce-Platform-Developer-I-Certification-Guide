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