public class ActionMovie extends Movie{

    public ActionMovie(){
        super(‘Action’);
    }

    public override void insertMovie(){
        Movie__c newActionMovie = new Movie__c(Name = 'Action Movie', Genre__c = 'Action');
        try {
            insert newActionMovie;
        } catch (DMLException ex){
            System.debug(ex.getMessage());
        }
    }

    public List<Movie__c> getActionMovies(){
        return this.selectMovies();
    }
}

