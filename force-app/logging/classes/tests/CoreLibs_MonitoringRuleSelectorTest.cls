@IsTest
private inherited sharing class CoreLibs_MonitoringRuleSelectorTest {
  @IsTest
  private static void getSObjectType_SalesforceMonitoringRule() {
    CoreLibs_MonitoringRuleSelector selector = new CoreLibs_MonitoringRuleSelector();
    System.Test.startTest();
    Schema.SObjectType result = selector.getSObjectType();
    System.Test.stopTest();
    Assert.areEqual(CoreLibs_MonitoringRule__c.getSObjectType(), result, 'Should return CoreLibs_MonitoringRule__c');
  }

  @IsTest
  private static void getActiveRules_1Active1Inactive_return1() {
    List<CoreLibs_MonitoringRule__c> rules = new List<CoreLibs_MonitoringRule__c>{
      new CoreLibs_MonitoringRule__c(IsActive__c = true),
      new CoreLibs_MonitoringRule__c(IsActive__c = false)
    };
    insert rules;
    CoreLibs_MonitoringRuleSelector selector = new CoreLibs_MonitoringRuleSelector();
    System.Test.startTest();
    List<CoreLibs_MonitoringRule__c> result = selector.getActiveRules();
    System.Test.stopTest();
    Assert.areEqual(1, result.size(), 'Should return the 1 active record');
  }
}
