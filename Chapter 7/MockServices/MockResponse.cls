global class MockResponse implements HttpCalloutMock {
    global HTTPResponse respond(HTTPRequest req) {
    // Create a fake response (HttpResponse class) with response values and return this response
    }
}

Test.setMock(HttpCalloutMock.class, new MockResponse());