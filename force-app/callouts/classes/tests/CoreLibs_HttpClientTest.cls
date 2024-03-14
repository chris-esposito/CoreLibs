@IsTest
private inherited sharing class CoreLibs_HttpClientTest {
  @IsTest
  private static void send_mockedCallout_sendCalloutAndLog() {
    Test.setMock(HttpCalloutMock.class, new MockCalloutResponse());
    System.Test.startTest();
    System.HttpResponse res = new CoreLibs_HttpClient().send(new MockCallout());
    System.Test.stopTest();
    Assert.areEqual(200, res.getStatusCode(), 'Should return the correct status code');
    Assert.areEqual('{"test": "response body"}', res.getBody(), 'Should return the correct body');
    List<CoreLibs_Log__c> log = [SELECT Id FROM CoreLibs_Log__c];
    Assert.areEqual(1, log.size(), 'Should generate a log');
  }

  private class MockCallout implements CoreLibs_ICallout {
    public String getCalloutLabel() {
      return 'Mocked Callout';
    }

    public String getEndpoint() {
      return 'callout:testEndpoint';
    }

    public Map<String, String> getHeaders() {
      return new Map<String, String>{ 'test' => 'request header' };
    }

    public String getBody() {
      return '{ "test": "request body"}';
    }

    public CoreLibs_HttpMethod getMethod() {
      return CoreLibs_HttpMethod.POST;
    }
  }

  private class MockCalloutResponse implements HttpCalloutMock {
    public System.HttpResponse respond(System.HttpRequest req) {
      System.HttpResponse res = new System.HttpResponse();
      res.setStatusCode(200);
      res.setBody('{"test": "response body"}');
      res.setHeader('test', 'response header');
      return res;
    }
  }
}
