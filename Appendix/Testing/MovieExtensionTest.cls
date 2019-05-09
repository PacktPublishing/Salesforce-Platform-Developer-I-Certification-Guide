@IsTest
private with sharing class MovieExtensionTest {

 @TestSetup
 private static void createTestData(){
 Movie__c aTestMovie = new Movie__c(
 Name = 'Independence day',
 Description__c = 'Independence Day is an American science fiction action film directed and co-written by Roland Emmerich',
 Cover_Url__c = 'https://image.tmdb.org/t/p/original/bqLlWZJdhrS0knfEJRkquW7L8z2.jpg',
 Genre__c = 'Action;Adventure;Science Fiction'
 );

 insert aTestMovie;
 }
}