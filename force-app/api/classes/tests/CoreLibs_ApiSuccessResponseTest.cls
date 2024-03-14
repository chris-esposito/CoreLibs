@IsTest
private inherited sharing class CoreLibs_ApiSuccessResponseTest {
  @IsTest
  private static void toResponse_201_returnRequest() {
    RestContext.response = new RestResponse();
    CoreLibs_ApiSuccessResponse apiResponse = new CoreLibs_ApiSuccessResponse(
      CoreLibs_HttpStatusCode.SUCCESS.CREATED,
      new Map<String, String>{ 'Test' => 'Value' }
    );
    System.Test.startTest();
    RestResponse result = apiResponse.toResponse();
    System.Test.stopTest();
    Assert.areEqual(201, result.statusCode, 'Should set status to 201');
    Assert.areEqual('{"Test":"Value"}', result.responseBody.toString(), 'Should set the body');
  }

  @IsTest
  private static void toResponse_nullBody_returnRequest() {
    RestContext.response = new RestResponse();
    CoreLibs_ApiSuccessResponse apiResponse = new CoreLibs_ApiSuccessResponse(
      CoreLibs_HttpStatusCode.SUCCESS.NO_CONTENT
    );
    System.Test.startTest();
    RestResponse result = apiResponse.toResponse();
    System.Test.stopTest();
    Assert.areEqual(204, result.statusCode, 'Should set status to 204');
    Assert.areEqual('{}', result.responseBody.toString(), 'Should set the body to empty');
  }
}
