@IsTest
private inherited sharing class CoreLibs_ApexApiControllerTest {
  @IsTest
  private static void getUIMessageFromErrorCode_emptyInput_returnEmptyString() {
    System.Test.startTest();
    String result = CoreLibs_ApexApiController.getUIMessageFromErrorCode('');
    System.Test.stopTest();
    Assert.areEqual('', result, 'Should return an empty string for empty error code');
  }

  @IsTest
  private static void getUIMessageFromErrorCode_nullnput_returnEmptyString() {
    System.Test.startTest();
    String result = CoreLibs_ApexApiController.getUIMessageFromErrorCode(null);
    System.Test.stopTest();
    Assert.areEqual('', result, 'Should return an empty string for null error code');
  }

  @IsTest
  private static void getUIMessageFromErrorCode_validnput_returnEmptyUIMessageString() {
    System.Test.startTest();
    String result = CoreLibs_ApexApiController.getUIMessageFromErrorCode('Test');
    System.Test.stopTest();
    Assert.areEqual('', result, 'Should return a empty message with a valid input');
  }
}
