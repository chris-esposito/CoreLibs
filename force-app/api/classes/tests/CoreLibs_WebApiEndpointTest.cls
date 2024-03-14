@IsTest
private inherited sharing class CoreLibs_WebApiEndpointTest {
  @IsTest
  private static void doGet_executeSuccessfully() {
    RestContext.response = new RestResponse();
    RestRequest req = new RestRequest();
    req.requestURI = '/some/random/url';
    RestContext.request = req;
    System.Test.startTest();
    CoreLibs_WebApiEndpoint.doGet();
    System.Test.stopTest();
    Assert.isTrue(true, 'Successfully execute through all layers regardless of response state');
  }
  @IsTest
  private static void doDelete_executeSuccessfully() {
    RestContext.response = new RestResponse();
    RestRequest req = new RestRequest();
    req.requestURI = '/some/random/url';
    RestContext.request = req;
    System.Test.startTest();
    CoreLibs_WebApiEndpoint.doDelete();
    System.Test.stopTest();
    Assert.isTrue(true, 'Successfully execute through all layers regardless of response state');
  }
  @IsTest
  private static void doPatch_executeSuccessfully() {
    RestContext.response = new RestResponse();
    RestRequest req = new RestRequest();
    req.requestURI = '/some/random/url';
    RestContext.request = req;
    System.Test.startTest();
    CoreLibs_WebApiEndpoint.doPatch();
    System.Test.stopTest();
    Assert.isTrue(true, 'Successfully execute through all layers regardless of response state');
  }
  @IsTest
  private static void doPut_executeSuccessfully() {
    RestContext.response = new RestResponse();
    RestRequest req = new RestRequest();
    req.requestURI = '/some/random/url';
    RestContext.request = req;
    System.Test.startTest();
    CoreLibs_WebApiEndpoint.doPut();
    System.Test.stopTest();
    Assert.isTrue(true, 'Successfully execute through all layers regardless of response state');
  }
  @IsTest
  private static void doPost_executeSuccessfully() {
    RestContext.response = new RestResponse();
    RestRequest req = new RestRequest();
    req.requestURI = '/some/random/url';
    RestContext.request = req;
    System.Test.startTest();
    CoreLibs_WebApiEndpoint.doPost();
    System.Test.stopTest();
    Assert.isTrue(true, 'Successfully execute through all layers regardless of response state');
  }
}
