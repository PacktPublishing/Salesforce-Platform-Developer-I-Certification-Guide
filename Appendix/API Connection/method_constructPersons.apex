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