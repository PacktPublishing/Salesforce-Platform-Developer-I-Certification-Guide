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