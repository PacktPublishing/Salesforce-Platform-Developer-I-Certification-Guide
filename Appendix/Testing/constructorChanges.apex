public MovieExtension(Apexpages.StandardController stdMovie){
 if (stdMovie != null) {
 this.movieId = stdMovie.getId();
 }
}