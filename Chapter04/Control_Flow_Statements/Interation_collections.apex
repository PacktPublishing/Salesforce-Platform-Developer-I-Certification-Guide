Map<Integer, String> mapNumbers = new Map<Integer, String>{
    1 => 'One',
    2 => 'Two',
    3 => 'Three'
};

// Iteration over the indexes of the map
For (Integer iNumber : mapNumbers.keySet()){
	// the keyset()-function of a map returns a set of the keys from the map. This is always a set of objects, defined in the map. In this case 1, 2 and 3
	...
}

// iteration over the values of the map
For (String sString : mapNumbers.values()){
	// the values()-function of a map returns a set of the values from the map. This is always a set of objects, defined in the map. In this case 'One','Two' and 'Three'
	....
}
