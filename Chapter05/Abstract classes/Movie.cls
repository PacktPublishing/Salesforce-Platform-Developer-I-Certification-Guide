public abstract class Movie {

	public String movieType = '';

	public Movie(String sMovieType){
		this.movieType = sMovieType;
	}

	protected Movie__c selectMovie(){
		if (this.movieType != null){
			List<Movie__c> lstMovies = [SELECT Id, Name, (SELECT Id, Person__r.Name FROM Cast__r) FROM Movie__c WHERE Genre__c = :this.movieType];
			if (lstMovies.size() == 1){
				// check if there is a record
				return lstMovies[0];
			}
		}

		return new Movie__c();
	}

	public abstract void insertMovie();

}
