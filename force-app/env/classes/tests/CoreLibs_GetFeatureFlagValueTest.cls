@IsTest
private inherited sharing class CoreLibs_GetFeatureFlagValueTest {
  @IsTest
  private static void execute_mockedServices_returnResponseWithTrue() {
    CoreLibs_ClassMocker mocker = new CoreLibs_ClassMocker().whenInvoking('isFeatureOn').thenReturn(true);
    CoreLibs_Environment.instance = (CoreLibs_Environment) mocker.generateStub(CoreLibs_Environment.class);
    CoreLibs_GetFeatureFlagValue.Request req = new CoreLibs_GetFeatureFlagValue.Request();
    req.featureName = 'Test';
    System.Test.startTest();
    List<CoreLibs_GetFeatureFlagValue.Response> result = CoreLibs_GetFeatureFlagValue.execute(
      new List<CoreLibs_GetFeatureFlagValue.Request>{ req }
    );
    System.Test.stopTest();
    Assert.areEqual(1, result.size(), 'Should return 1 response for 1 request');
    Assert.areEqual(true, result[0].value, 'Should return true');
    Assert.areEqual('Test', result[0].featureName, 'Should return the feature name');
  }

  @IsTest
  private static void execute_mockedServices_throwError() {
    CoreLibs_ClassMocker mocker = new CoreLibs_ClassMocker()
      .whenInvoking('isFeatureOn')
      .thenThrow(new DmlException('DUMMY EXCEPTION'));
    CoreLibs_Environment.instance = (CoreLibs_Environment) mocker.generateStub(CoreLibs_Environment.class);
    CoreLibs_GetFeatureFlagValue.Request req = new CoreLibs_GetFeatureFlagValue.Request();
    req.featureName = 'Test';
    String errMsg;
    System.Test.startTest();
    try {
      List<CoreLibs_GetFeatureFlagValue.Response> result = CoreLibs_GetFeatureFlagValue.execute(
        new List<CoreLibs_GetFeatureFlagValue.Request>{ req }
      );
    } catch (Exception e) {
      errMsg = e.getMessage();
    }
    System.Test.stopTest();
    Assert.isTrue(String.isNotBlank(errMsg), 'Should capture an error');
    Assert.areEqual(1, [SELECT Id FROM CoreLibs_Log__c].size(), 'Should generate a log');
  }
}
