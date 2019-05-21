Map<String, Schema.SObjectType> mapObjects = Schema.getGlobalDescribe();
DescribeSObjectResult accountDescription = mapObjects.get('account').getDescribe();
System.debug(accountDescription);
