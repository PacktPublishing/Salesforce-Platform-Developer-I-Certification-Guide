public with sharing class MyCustomException extends Exception {
    
    public MyCustomException(String sErrorCode, String sErrorMessage){
        String theErrorMessage = sErrorCode + ': ' + sErrorMessage;
        this.setMessage(theErrorMessage);
    }
}
