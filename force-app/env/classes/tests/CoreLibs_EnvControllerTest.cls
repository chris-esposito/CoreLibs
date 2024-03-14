@IsTest
private inherited sharing class CoreLibs_EnvControllerTest {
  @IsTest
  private static void isFeatureOn_mockedServices_returnTrue() {
    CoreLibs_ClassMocker mocker = new CoreLibs_ClassMocker().whenInvoking('isFeatureOn').thenReturn(true);
    CoreLibs_Environment.instance = (CoreLibs_Environment) mocker.generateStub(CoreLibs_Environment.class);
    System.Test.startTest();
    Boolean result = CoreLibs_EnvController.isFeatureOn('Test');
    System.Test.stopTest();
    Assert.areEqual(true, result, 'Should return value returned by service (true)');
  }

  @IsTest
  private static void isFeatureOn_mockedServices_throwError() {
    CoreLibs_ClassMocker mocker = new CoreLibs_ClassMocker()
      .whenInvoking('isFeatureOn')
      .thenThrow(new DmlException('DUMMY EXCEPTION'));
    CoreLibs_Environment.instance = (CoreLibs_Environment) mocker.generateStub(CoreLibs_Environment.class);
    String errMsg;
    System.Test.startTest();
    try {
      Boolean result = CoreLibs_EnvController.isFeatureOn('Test');
    } catch (Exception e) {
      errMsg = e.getMessage();
    }
    System.Test.stopTest();
    Assert.isTrue(String.isNotBlank(errMsg), 'Should capture an error');
    Assert.areEqual(1, [SELECT Id FROM CoreLibs_Log__c].size(), 'Should generate a log');
  }

  @IsTest
  private static void isFeatureOff_mockedServices_returnFalse() {
    CoreLibs_ClassMocker mocker = new CoreLibs_ClassMocker().whenInvoking('isFeatureOff').thenReturn(false);
    CoreLibs_Environment.instance = (CoreLibs_Environment) mocker.generateStub(CoreLibs_Environment.class);
    System.Test.startTest();
    Boolean result = CoreLibs_EnvController.isFeatureOff('Test');
    System.Test.stopTest();
    Assert.areEqual(false, result, 'Should return value returned by service (false)');
  }

  @IsTest
  private static void isFeatureOff_mockedServices_throwError() {
    CoreLibs_ClassMocker mocker = new CoreLibs_ClassMocker()
      .whenInvoking('isFeatureOff')
      .thenThrow(new DmlException('DUMMY EXCEPTION'));
    CoreLibs_Environment.instance = (CoreLibs_Environment) mocker.generateStub(CoreLibs_Environment.class);
    String errMsg;
    System.Test.startTest();
    try {
      Boolean result = CoreLibs_EnvController.isFeatureOff('Test');
    } catch (Exception e) {
      errMsg = e.getMessage();
    }
    System.Test.stopTest();
    Assert.isTrue(String.isNotBlank(errMsg), 'Should capture an error');
    Assert.areEqual(1, [SELECT Id FROM CoreLibs_Log__c].size(), 'Should generate a log');
  }
}
