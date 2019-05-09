try {
	update lstAccounts;
} catch (Exception ex){
	//throw new MyCustomException('ERRCODE', 'this is an error message');
	//throw new MyCustomException('this is a custom error');
	System.debug(ex.getMessage());
}
