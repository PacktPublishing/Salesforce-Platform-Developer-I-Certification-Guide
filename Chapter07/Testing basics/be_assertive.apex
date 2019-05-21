Contact c = new Contact(LastName = null);
try {
     insert c;
     System.assert(false);
} catch (Exception ex){
     System.assert(ex.getMessage.containsIgnoreCase('Missing field');
}