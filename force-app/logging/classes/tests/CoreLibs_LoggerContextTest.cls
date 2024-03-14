@IsTest
private inherited sharing class CoreLibs_LoggerContextTest {
  @IsTest
  private static void getInstance_instanceCreated_returnSame() {
    CoreLibs_LoggerContext instance = new CoreLibs_LoggerContext();
    CoreLibs_LoggerContext.instance = instance;
    System.Test.startTest();
    CoreLibs_LoggerContext result = CoreLibs_LoggerContext.getInstance();
    System.Test.stopTest();
    Assert.areEqual(instance, result, 'Should return the same instance');
  }

  @IsTest
  private static void getInstance_noInstance_returnNew() {
    System.Test.startTest();
    CoreLibs_LoggerContext result = CoreLibs_LoggerContext.getInstance();
    System.Test.stopTest();
    Assert.isNotNull(result, 'Should return a new instance');
  }

  @IsTest
  private static void getTransactionId_returnId() {
    CoreLibs_LoggerContext instance = new CoreLibs_LoggerContext();
    System.Test.startTest();
    String result = instance.getTransactionId();
    System.Test.stopTest();
    Assert.isTrue(String.isNotBlank(result), 'Should return an id');
  }

  @IsTest
  private static void getTransactionType_returnType() {
    CoreLibs_LoggerContext instance = new CoreLibs_LoggerContext();
    System.Test.startTest();
    String result = instance.getTransactionType();
    System.Test.stopTest();
    Assert.isTrue(String.isNotBlank(result), 'Should return a type');
  }

  @IsTest
  private static void getRunningUserSessionId_returnSessionId() {
    CoreLibs_LoggerContext instance = new CoreLibs_LoggerContext();
    System.Test.startTest();
    String result = instance.getRunningUserSessionId();
    System.Test.stopTest();
    Assert.isTrue(String.isNotBlank(result), 'Should return an id');
  }

  @IsTest
  private static void getRunningUserId_returnId() {
    CoreLibs_LoggerContext instance = new CoreLibs_LoggerContext();
    System.Test.startTest();
    Id result = instance.getRunningUserId();
    System.Test.stopTest();
    Assert.isTrue(String.isNotBlank(result), 'Should return an id');
  }
}
