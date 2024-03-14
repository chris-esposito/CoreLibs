@IsTest
private inherited sharing class CoreLibs_IdempotentApiResponseTest {
  @IsTest
  private static void toResponse_fromRecord_returnResponse() {
    RestContext.response = new RestResponse();
    CoreLibs_IdempotentEntry__c req = new CoreLibs_IdempotentEntry__c(
      ResponseStatusCode__c = '201',
      ResponseBody__c = '{"Test":"Value"}',
      ResponseHeaders__c = '{"Key":"Value"}'
    );
    CoreLibs_IdempotentApiResponse res = new CoreLibs_IdempotentApiResponse(req);
    System.Test.startTest();
    RestResponse result = res.toResponse();
    System.Test.stopTest();
    Assert.areEqual(201, result.statusCode, 'Should set status to 201');
    Assert.areEqual('{"Test":"Value"}', result.responseBody.toString(), 'Should set the body');
    Assert.areEqual('Value', result.headers.get('Key'), 'Should set the headers');
  }
}
