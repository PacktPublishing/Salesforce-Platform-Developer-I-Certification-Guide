public abstract class Movie {

	public Id movieId = null;

	public Movie(Id idMovieId){
		this.movieId = idMovieId;
	}

	public Movie__c selectMovie(){
		if (this.movieId != null){
			List<Movie__c> lstMovies = [SELECT Id, Name, (SELECT Id, Person__r.Name FROM Cast__r) FROM Movie__c WHERE Id = :this.movieId];
			if (lstMovies.size() == 1){
				// check if there is a record
				return lstMovies[0];
			}
		}

		return new Movie__c();
	}

	public abstract void insertMovie();

}
