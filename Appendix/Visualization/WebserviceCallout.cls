public with sharing class WebserviceCallout {

    private final static String authToken = '<YOUR_API_KEY_HERE>';
    private final static String sEndpoint = 'callout:The_Movie_DB';
    private final static Integer iTimeout = 20000;
    private final static Integer NUMBER_OF_RESULTS = 5;

    public static List<MovieResponse> searchMovies(String sParameter){
        List<MovieResponse> lstMovies = new List<MovieResponse>();
        try {
            String sMoviesFromCallout = searchCallout(sParameter, 'movie');
            lstMovies = constructMovies(sMoviesFromCallout);
        } catch (Exception ex){
            System.debug(ex.getMessage());
        }

        return lstMovies;
    }

    public static Map<Integer, String> mapGenres {
        get {
            Map<Integer, String> mapWithGenres = new Map<Integer, String>();
            try {
                String theResponse = calloutGenres();
                JSONParser theParser = JSON.createParser(theResponse);
                while (theParser.nextToken() != null){
                    if (theParser.getCurrentToken() == JSONToken.FIELD_NAME && theParser.getText() == 'genres'){
                        theParser.nextToken();
                        while (theParser.nextToken() != JSONToken.END_ARRAY) {
                            MovieGenre mg = (MovieGenre) theParser.readValueAs(MovieGenre.class);
                            mapWithGenres.put(mg.id, mg.name);
                        }
                    }
                }
            } catch (Exception ex){
                System.debug(ex.getMessage());
            }

            return mapWithGenres;
        }
    }

    public static List<Person> searchActors(String sParameter){
        List<Person> lstPersons = new List<Person>();
        try {
            String sMoviesFromCallout = searchCallout(sParameter, 'person');
            lstPersons = constructPersons(sMoviesFromCallout);
        } catch (Exception ex){
            System.debug(ex.getMessage());
        }

        return lstPersons;
    }

    public static String calloutGenres(){
        String theEndpoint = sEndpoint + '/genre/movie/list?api_key='+authToken;
        HttpRequest theRequest = new HttpRequest();
        theRequest.setMethod('GET');
        theRequest.setEndpoint(theEndpoint);
        theRequest.setTimeout(iTimeout);

        // perform the callout
        Http oHttp = new Http();
        HttpResponse theResponse = new HttpResponse();

        theResponse = oHttp.send(theRequest);
        System.debug(JSON.serializePretty(theResponse.getBody()));
        return theResponse.getBody();
    }

    public static String searchCallout(String sParameter, String sResource){
        String theEndpoint = sEndpoint + '/search/' + sResource + '?api_key=' + authToken + '&page=1';

        HttpRequest theRequest = new HttpRequest();
        theRequest.setMethod('GET');
        theRequest.setEndpoint(theEndpoint + '&query=' + EncodingUtil.urlEncode(sParameter, 'UTF-8'));
        theRequest.setTimeout(iTimeout);

        // perform the callout
        Http oHttp = new Http();
        HttpResponse theResponse = new HttpResponse();

        theResponse = oHttp.send(theRequest);
        System.debug(JSON.serializePretty(theResponse.getBody()));
        return theResponse.getBody();
    }

    private static List<MovieResponse> constructMovies(String sResponse){
        List<MovieResponse> lstMovies = new List<MovieResponse>();
        if (sResponse != null){
            JSONParser theParser = JSON.createParser(sResponse);
            while (theParser.nextToken() != null){
                if (theParser.getCurrentToken() == JSONToken.FIELD_NAME && theParser.getText() == 'results'){
                    System.debug(theParser.getCurrentToken());
                    theParser.nextToken();
                    while (theParser.nextToken() != JSONToken.END_ARRAY) {
                        if (lstMovies.size() < NUMBER_OF_RESULTS){
                            MovieResponse theResponse = (MovieResponse) theParser.readValueAs(MovieResponse.class);
                            List<String> lstGenres = new List<String>();
                            if (theResponse.genre_ids != null && theResponse.genre_ids.size() > 0){
                                for (Integer i : theResponse.genre_ids){
                                    lstGenres.add(mapGenres.get(i));
                                }
                            }
                            theResponse.genres = lstGenres;
                            lstMovies.add(theResponse);
                        } else {
                            break;
                        }
                    }
                }
            }
        }

        System.debug(lstMovies.size());
        return lstMovies;
    }

    private static List<Person> constructPersons(String sResponse){
        List<Person> lstPersons = new List<Person>();
        if (sResponse != null){
            JSONParser theParser = JSON.createParser(sResponse);
            while (theParser.nextToken() != null){
                if (theParser.getCurrentToken() == JSONToken.FIELD_NAME && theParser.getText() == 'results'){
                    theParser.nextToken();
                    theParser.nextToken();
                    lstPersons.add((Person) theParser.readValueAs(Person.class));
                }
            }
        }

        return lstPersons;
    }




    public class MovieResponse {
        @AuraEnabled
        public Integer vote_count {get; set;}
        @AuraEnabled
        public Integer id {get; set;}
        @AuraEnabled
        public Boolean video {get; set;}
        @AuraEnabled
        public Decimal vote_average {get; set;}
        @AuraEnabled
        public String title {get; set;}
        @AuraEnabled
        public Decimal popularity {get; set;}
        // to get the picture of the movie: https://image.tmdb.org/t/p/original + the string retrieved from the poster_path
        @AuraEnabled
        public String poster_path {get; set;}
        @AuraEnabled
        public String original_language {get; set;}
        @AuraEnabled
        public String original_title {get; set;}
        @AuraEnabled
        public List<Integer> genre_ids {get; set;}
        @AuraEnabled
        public List<String> genres {get; set;}
        @AuraEnabled
        public String backdrop_path {get; set;}
        @AuraEnabled
        public Boolean adult {get; set;}
        @AuraEnabled
        public String overview {get; set;}
        @AuraEnabled
        public String release_date {get; set;}
        @AuraEnabled
        public Boolean bIsSelected {get; set;}


        public MovieResponse(){
            this.bIsSelected = false;
        }
    }

    public class Person {
        public Decimal popularity {get; set;}
        public Integer id {get; set;}
        public String profile_path {get; set;}
        public String name {get; set;}
        public List<MovieResponse> known_for {get; set;}
    }

    public class MovieGenre {
        public Integer id {get; set;}
        public String name {get;set;}
    }
}
