public virtual class MovieVirtual {
	
	private String movieType = '';

	public MovieVirtual(String sMovieType){
		this.movieType = sMovieType;
	}

	protected List<Movie__c> selectMovies(){
		List<Movie__c> lstMovies = [SELECT Id, Name, (SELECT Id, Person__r.Name FROM Cast__r) FROM Movie__c WHERE Genre__c = :this.movieType];
		return lstMovies;
	}

	public virtual void insertMovie(){
		// We implement a basic logic in the virtual method. If you don't override this method in the child class, you can call this method from the child class and executes this logic
		System.debug('insertMovie from MovieVirtual');
	}

	public virtual void updateMovie(){
		System.debug('updateMovie from MovieVirtual');
	}
}
