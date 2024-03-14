@IsTest
private inherited sharing class CoreLibs_UuidTest {
  @IsTest
  private static void getValue_newUuid_returnValue() {
    System.Test.startTest();
    CoreLibs_Uuid uuid = new CoreLibs_Uuid();
    String value = uuid.getValue();
    System.Test.stopTest();
    Assert.isTrue(String.isNotBlank(value), 'Should return a value');
  }
}
