public with sharing class MovieExtension {

     private final Id movieId;
     public Movie__c theMovie {
     get{
     if (this.movieId != null){
     // select the movie and the cast from the Id.
     // We select records always with a list, even if you know it should be a record.
     // if someone removes the record while you want to select it, you will receive an exception
         try {
             Movie__c selectedMovie = [SELECT Description__c, Name,             Genre__c,Runtime__c,Release_Date__c,Cover_Url__c,Director__r.Name, (SELECT Id, Name, Person__r.Name, Rating__c FROM Cast__r) FROM Movie__c WHERE Id = :this.movieId];
             return selectedMovie;
         } catch (Exception ex){
             ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.FATAL, 'Are you sure this movie exists ?'));
         }
     }

         return new Movie__c();
         }
     }

     public MovieExtension(Apexpages.StandardController stdMovie){
         this.movieId = stdMovie.getId();
     }
}