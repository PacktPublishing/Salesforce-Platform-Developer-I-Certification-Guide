@IsTest
private static void selectIncorrectMovie(){
 
 // start up your test scenario
 Test.startTest();
 MovieExtension ext = new MovieExtension(null);
 Test.stopTest();
 
 // verify if the Id of the movie is the same movieId in your controller
 System.assertEquals(null, ext.movieId);
}