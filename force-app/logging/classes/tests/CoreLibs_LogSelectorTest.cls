@IsTest
private inherited sharing class CoreLibs_LogSelectorTest {
  @IsTest
  private static void getSObjectType_returnLog() {
    CoreLibs_LogSelector selector = new CoreLibs_LogSelector();
    System.Test.startTest();
    Schema.SObjectType result = selector.getSObjectType();
    System.Test.stopTest();
    Assert.areEqual(CoreLibs_Log__c.getSObjectType(), result, 'Should return the CoreLibs_Log__c sobject type');
  }
}
