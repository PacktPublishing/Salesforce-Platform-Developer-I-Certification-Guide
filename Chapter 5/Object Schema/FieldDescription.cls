Map<String, Schema.SObjectType> mapObjects = Schema.getGlobalDescribe();
Map<String, Schema.SObjectField> accountFields = mapObjects.get('account').getDescribe().fields.getMap();
Schema.DescribeFieldResult yourField = accountFields.get('Name').getDescribe();
System.debug(yourField);

