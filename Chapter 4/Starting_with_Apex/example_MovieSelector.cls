public class MovieSelector {
	public static String sMovieTitle = '';

	public MovieSelector(String aMovieTitle){
		sMovieTitle = aMovieTitle;
	}

	public String getTheMovieTitle(){
		return sMovieTitle;
	}

	public static String getAMovieTitle(String aMovieTitle){
		sMovieTitle = aMovieTitle;
		return sMovieTitle;
	}

	public static List<Movie__c> searchMovies(String aMovieTitle){
		List<List<SObject>> lstSearchResults = new List<List<SObject>>();
		String sQuery = 'FIND \'' + String.escapeSingleQuotes(aMovieTitle) + '\' IN ALL FIELDS RETURNING Movie__c(Name)';
		lstSearchResults.addAll(Search.query(sQuery));
		if (lstSearchResults.size() > 0){
			return lstSearchResults[0];
		}

		return new List<Movie__c>();
	}
}