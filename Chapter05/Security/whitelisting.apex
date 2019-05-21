String sInput = Apexpages.currentPage().getParameters().get('textInput');
if (sInput.containsIgnoreCase(' AND ') || (sInput.containsIgnoreCase(' OR '))){
	// return an error
} else {
	// execute query
}
