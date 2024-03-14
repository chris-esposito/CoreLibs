@IsTest
private inherited sharing class CoreLibs_ApiEndpointResolverTest {
  @IsTest
  private static void setRequest_paramsParsed_reqAndParamsSet() {
    RestRequest req = new RestRequest();
    req.requestURI = 'some/1234/test/6567/thing/8888';
    CoreLibs_ApiEndpointResolver resolver = new MockEndpointResolver();
    System.Test.startTest();
    resolver.setRequest(req);
    System.Test.stopTest();
    Assert.areEqual(1, resolver.urlParams.size(), 'Should only parse for declared params');
    Assert.areEqual('6567', resolver.urlParams.get('test'), 'Should capture the values');
    Assert.isNotNull(resolver.req, 'Should set the request');
  }

  @IsTest
  private static void doGet_baseMethod_throwException() {
    CoreLibs_ApiEndpointResolver resolver = new MockEndpointResolver();
    String errMsg;
    System.Test.startTest();
    try {
      resolver.doGet();
    } catch (CoreLibs_ApiExceptions.MethodNotAllowedException e) {
      errMsg = e.getMessage();
    }
    System.Test.stopTest();
    Assert.areEqual(
      CoreLibs_ApiEndpointResolver.METHOD_NOT_SUPPORTED,
      errMsg,
      'Should throw a method not allowed exception'
    );
  }

  @IsTest
  private static void doPost_baseMethod_throwException() {
    CoreLibs_ApiEndpointResolver resolver = new MockEndpointResolver();
    String errMsg;
    System.Test.startTest();
    try {
      resolver.doPost();
    } catch (CoreLibs_ApiExceptions.MethodNotAllowedException e) {
      errMsg = e.getMessage();
    }
    System.Test.stopTest();
    Assert.areEqual(
      CoreLibs_ApiEndpointResolver.METHOD_NOT_SUPPORTED,
      errMsg,
      'Should throw a method not allowed exception'
    );
  }

  @IsTest
  private static void doPut_baseMethod_throwException() {
    CoreLibs_ApiEndpointResolver resolver = new MockEndpointResolver();
    String errMsg;
    System.Test.startTest();
    try {
      resolver.doPut();
    } catch (CoreLibs_ApiExceptions.MethodNotAllowedException e) {
      errMsg = e.getMessage();
    }
    System.Test.stopTest();
    Assert.areEqual(
      CoreLibs_ApiEndpointResolver.METHOD_NOT_SUPPORTED,
      errMsg,
      'Should throw a method not allowed exception'
    );
  }

  @IsTest
  private static void doPatch_baseMethod_throwException() {
    CoreLibs_ApiEndpointResolver resolver = new MockEndpointResolver();
    String errMsg;
    System.Test.startTest();
    try {
      resolver.doPatch();
    } catch (CoreLibs_ApiExceptions.MethodNotAllowedException e) {
      errMsg = e.getMessage();
    }
    System.Test.stopTest();
    Assert.areEqual(
      CoreLibs_ApiEndpointResolver.METHOD_NOT_SUPPORTED,
      errMsg,
      'Should throw a method not allowed exception'
    );
  }

  @IsTest
  private static void doDelete_baseMethod_throwException() {
    CoreLibs_ApiEndpointResolver resolver = new MockEndpointResolver();
    String errMsg;
    System.Test.startTest();
    try {
      resolver.doDelete();
    } catch (CoreLibs_ApiExceptions.MethodNotAllowedException e) {
      errMsg = e.getMessage();
    }
    System.Test.stopTest();
    Assert.areEqual(
      CoreLibs_ApiEndpointResolver.METHOD_NOT_SUPPORTED,
      errMsg,
      'Should throw a method not allowed exception'
    );
  }

  private class MockEndpointResolver extends CoreLibs_ApiEndpointResolver {
    protected override Set<String> getUrlParams() {
      return new Set<String>{ 'test' };
    }
  }
}
