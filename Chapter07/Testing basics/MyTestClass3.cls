@IsTest
private with sharing class MyTestClass {

	@future
	private static void createTheUser(){
		// We select a standard profile
		Profile theProfile = [SELECT Id FROM Profile WHERE Name='Standard User'];
		UserRole theRole = [SELECT Id FROM UserRole WHERE Name='COO'];
		User testUser = new User(firstname = 'test', lastname = 'MyUser',alias = 'tuser', email = 'testuser@weare4c.com',emailencodingkey = 'UTF-8', languagelocalekey='en_US', localesidkey='en_GB', profileid = p.Id, timezonesidkey = 'Asia/Kuala_Lumpur',username = 'testuser@weare4c.com',userroleid = r.Id);
		insert(testUser);
	}

	private static void createTestAccount(){
		Account a = new Account(Name = 'Test account');
		insert a;
	}
 
	@IsTest
	private static void myTestMethod1(){
 		createTheUser();
		createTestAccount();
	}
}