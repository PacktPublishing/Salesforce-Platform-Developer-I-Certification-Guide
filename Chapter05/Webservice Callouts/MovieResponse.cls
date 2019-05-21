
public class MovieResponse {
	public Integer vote_count {get; set;}
	public Integer id {get; set;}
	public Boolean video {get; set;}
	public Decimal vote_average {get; set;}
	public String title {get; set;}
	public Decimal popularity {get; set;}
	// to get the picture of the movie: https://image.tmdb.org/t/p/original + the string retrieved from the poster_path
	public String poster_path {get; set;}
	public String original_language {get; set;}
	public String original_title {get; set;}
	public List<Integer> genre_ids {get; set;}
	public String backdrop_path {get; set;}
	public Boolean adult {get; set;}
	public String overview {get; set;}
	public String release_date {get; set;}
}
