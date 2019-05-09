Map<String, Schema.SObjectType> gd = Schema.getGlobalDescribe();
Schema.DescribeSObjectResult theObject = gd.get('Account').getDescribe();

String sobjStruct = JSON.serialize(theObject);
DescribeSobjectResultJSON sobjProps = (DescribeSobjectResultJSON) JSON.deserialize(sobjStruct, DescribeSobjectResultJSON.class);
System.debug(sobjProps);

// Wrapper with the JSON result
public class DescribeSobjectResultJSON {
	public String name {get;set;}
	public Boolean triggerable {get;set;}
}


