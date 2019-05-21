String sString = 'This is a \'Single Quote\' test';
String sEscapedString = String.escapeSingleQuotes(sString);
System.debug(sString); // this returns the string "This is a 'Single Quote' test"
System.debug(sEscapedString); // this returns the string "This is a \'Single Quote\' test"
