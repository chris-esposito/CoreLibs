@IsTest
private inherited sharing class CoreLibs_ApiErrorResponseTest {
  @IsTest
  private static void toResponse_fromException_returnRequest() {
    RestContext.response = new RestResponse();
    CoreLibs_ApiErrorResponse apiResponse = new CoreLibs_ApiErrorResponse(
      new CoreLibs_ApiExceptions.NotFoundException('Test')
    );
    System.Test.startTest();
    RestResponse result = apiResponse.toResponse();
    System.Test.stopTest();
    Assert.areEqual(404, result.statusCode, 'Should set status to 404');
    Assert.areEqual('Test', result.responseBody.toString(), 'Should set the body');
  }
}
