public class MyCustomController {
    private Movie__c movie;

    public PageReference save() {
        try{
            update movie;
        } catch(DmlException ex){
            ApexPages.addMessages(ex);
        }
        return null;
    }

    public String getName() {
        return 'MyController';
    }

    public Movie__c getMovie() {
        if(this.movie == null){
            this.movie = [SELECT Id,Genre__c, Name FROM Movie__c WHERE Id = :ApexPages.currentPage().getParameters().get('id')];
        }
        
        return this.movie;
    }
}