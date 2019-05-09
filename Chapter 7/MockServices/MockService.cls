@isTest
global class MockService implements WebServiceMock {
	global void doInvoke(Object stub, Object request, Map<String, Object> response, String endpoint, String soapAction, String requestName, String responseNS, String responseName, String responseType) {
		docSample.EchoStringResponse_element respElement = new docSample.EchoStringResponse_element();
		respElement.EchoStringResult = 'Mock response';
		response.put('response_x', respElement); 
	}
}



Test.setMock(WebServiceMock.class, new MockService());