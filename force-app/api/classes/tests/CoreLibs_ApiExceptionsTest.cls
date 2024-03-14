@IsTest
private inherited sharing class CoreLibs_ApiExceptionsTest {
  @IsTest
  private static void getStatus_badRequestException_returnCorrectStatus() {
    CoreLibs_ApiExceptions.ApiException ex = new CoreLibs_ApiExceptions.BadRequestException();
    System.Test.startTest();
    CoreLibs_HttpStatusCode.ERROR result = ex.getStatus();
    System.Test.stopTest();
    Assert.areEqual(CoreLibs_HttpStatusCode.ERROR.BAD_REQUEST, result, 'Should return the bad request status');
  }

  @IsTest
  private static void getStatus_unauthorizedException_returnCorrectStatus() {
    CoreLibs_ApiExceptions.ApiException ex = new CoreLibs_ApiExceptions.UnauthorizedException();
    System.Test.startTest();
    CoreLibs_HttpStatusCode.ERROR result = ex.getStatus();
    System.Test.stopTest();
    Assert.areEqual(CoreLibs_HttpStatusCode.ERROR.UNAUTHORIZED, result, 'Should return the unauthorized status');
  }

  @IsTest
  private static void getStatus_forbiddenException_returnCorrectStatus() {
    CoreLibs_ApiExceptions.ApiException ex = new CoreLibs_ApiExceptions.ForbiddenException();
    System.Test.startTest();
    CoreLibs_HttpStatusCode.ERROR result = ex.getStatus();
    System.Test.stopTest();
    Assert.areEqual(CoreLibs_HttpStatusCode.ERROR.FORBIDDEN, result, 'Should return the forbidden status');
  }

  @IsTest
  private static void getStatus_notFoundException_returnCorrectStatus() {
    CoreLibs_ApiExceptions.ApiException ex = new CoreLibs_ApiExceptions.NotFoundException();
    System.Test.startTest();
    CoreLibs_HttpStatusCode.ERROR result = ex.getStatus();
    System.Test.stopTest();
    Assert.areEqual(CoreLibs_HttpStatusCode.ERROR.NOT_FOUND, result, 'Should return the not found status');
  }

  @IsTest
  private static void getStatus_methodNotAllowedException_returnCorrectStatus() {
    CoreLibs_ApiExceptions.ApiException ex = new CoreLibs_ApiExceptions.MethodNotAllowedException();
    System.Test.startTest();
    CoreLibs_HttpStatusCode.ERROR result = ex.getStatus();
    System.Test.stopTest();
    Assert.areEqual(
      CoreLibs_HttpStatusCode.ERROR.METHOD_NOT_ALLOWED,
      result,
      'Should return the method not allowed status'
    );
  }

  @IsTest
  private static void getStatus_notAcceptableException_returnCorrectStatus() {
    CoreLibs_ApiExceptions.ApiException ex = new CoreLibs_ApiExceptions.NotAcceptableException();
    System.Test.startTest();
    CoreLibs_HttpStatusCode.ERROR result = ex.getStatus();
    System.Test.stopTest();
    Assert.areEqual(CoreLibs_HttpStatusCode.ERROR.NOT_ACCEPTABLE, result, 'Should return the not acceptable status');
  }

  @IsTest
  private static void getStatus_internalServerErrorException_returnCorrectStatus() {
    CoreLibs_ApiExceptions.ApiException ex = new CoreLibs_ApiExceptions.InternalServerErrorException();
    System.Test.startTest();
    CoreLibs_HttpStatusCode.ERROR result = ex.getStatus();
    System.Test.stopTest();
    Assert.areEqual(
      CoreLibs_HttpStatusCode.ERROR.INTERNAL_SERVER_ERROR,
      result,
      'Should return the internal server error status'
    );
  }

  @IsTest
  private static void getStatus_notImplementedException_returnCorrectStatus() {
    CoreLibs_ApiExceptions.ApiException ex = new CoreLibs_ApiExceptions.NotImplementedException();
    System.Test.startTest();
    CoreLibs_HttpStatusCode.ERROR result = ex.getStatus();
    System.Test.stopTest();
    Assert.areEqual(CoreLibs_HttpStatusCode.ERROR.NOT_IMPLEMENTED, result, 'Should return the not implemented status');
  }

  @IsTest
  private static void getStatus_badGatewayException_returnCorrectStatus() {
    CoreLibs_ApiExceptions.ApiException ex = new CoreLibs_ApiExceptions.BadGatewayException();
    System.Test.startTest();
    CoreLibs_HttpStatusCode.ERROR result = ex.getStatus();
    System.Test.stopTest();
    Assert.areEqual(CoreLibs_HttpStatusCode.ERROR.BAD_GATEWAY, result, 'Should return the bad gateway status');
  }

  @IsTest
  private static void getStatus_serviceUnavailableException_returnCorrectStatus() {
    CoreLibs_ApiExceptions.ApiException ex = new CoreLibs_ApiExceptions.ServiceUnavailableException();
    System.Test.startTest();
    CoreLibs_HttpStatusCode.ERROR result = ex.getStatus();
    System.Test.stopTest();
    Assert.areEqual(
      CoreLibs_HttpStatusCode.ERROR.SERVICE_UNAVAILABLE,
      result,
      'Should return the service unavailable status'
    );
  }

  @IsTest
  private static void getStatus_gatewayTimeoutException_returnCorrectStatus() {
    CoreLibs_ApiExceptions.ApiException ex = new CoreLibs_ApiExceptions.GatewayTimeoutException();
    System.Test.startTest();
    CoreLibs_HttpStatusCode.ERROR result = ex.getStatus();
    System.Test.stopTest();
    Assert.areEqual(CoreLibs_HttpStatusCode.ERROR.GATEWAY_TIMEOUT, result, 'Should return the gateway timeout status');
  }
}
