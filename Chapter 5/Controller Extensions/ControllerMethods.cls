public with sharing class MovieExtension{
	/**
	 * When the user clicks on the button Submit Movie on the page
	 */
	public PageReference submitMovie(){
		try {
			upsert theMovie;
		} catch (DmlException ex){
			ApexPages.addMessage(new ApexPages.Message(Apexpages.Severity.FATAL, ex.getDmlMessage(0)));
		}
 
		return null;
	}
}