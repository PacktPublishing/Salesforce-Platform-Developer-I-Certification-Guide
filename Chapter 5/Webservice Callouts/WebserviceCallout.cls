public with sharing class WebserviceCallout {

	private final static String authToken = '<YOUR API KEY HERE>';
    	private final static String sEndpoint = 'callout:The_movie_DB';
    	private final static Integer iTimeout = 20000;


	private static String searchCallout(String sParameter, String sResource){
		String theEndpoint = sEndpoint + '/search/' + sResource + '?api_key=' + authToken;

		HttpRequest theRequest = new HttpRequest();
		theRequest.setMethod('GET');
		theRequest.setEndpoint(theEndpoint + '&query=' + EncodingUtil.urlEncode(sParameter, 'UTF-8'));
		theRequest.setTimeout(iTimeout);

		// perform the callout
		Http oHttp = new Http();
		HttpResponse theResponse = new HttpResponse();

		theResponse = oHttp.send(theRequest);
		return theResponse.getBody();
	}


	private static List<MovieResponse> constructMovies(String sResponse){
		List<MovieResponse> lstMovies = new List<MovieResponse>();
		if (sResponse != null){
			JSONParser theParser = JSON.createParser(sResponse);
			while (theParser.nextToken() != null){
				if (theParser.getCurrentToken() == JSONToken.FIELD_NAME && theParser.getText() == 'results'){
					theParser.nextToken();
					theParser.nextToken();
					lstMovies.add((MovieResponse) theParser.readValueAs(MovieResponse.class));
				}
			}
		}

		return lstMovies;
	}


}