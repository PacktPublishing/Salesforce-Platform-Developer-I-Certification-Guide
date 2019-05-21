public class Comedy extends Movie{

    public Comedy(){
        super(‘Comedy’);
    }

    public override void insertMovie(){
        Movie__c newComedy = new Movie__c(Name = 'Comedy', Genre__c = 'Comedy');
        try {
            insert newComedy;
        } catch (DMLException ex){
            System.debug(ex.getMessage());
        }
    }

    public List<Movie__c> getComedyMovies(){
        return this.selectMovies();
    }
}
