try {
	insert lstAccounts;
} catch (Exception ex){
	System.debug(ex.getCause());
	System.debug(ex.getMessage());
	System.debug(ex.getLineNumber());
	System.debug(ex.getStackTraceString());
	System.debug(ex.getTypeName());
}
