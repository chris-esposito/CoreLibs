@IsTest
private inherited sharing class CoreLibs_QueryRuleProcessorTest {
  @TestSetup
  private static void makeData() {
    Account acct1 = new Account(Name = 'Test');
    Account acct2 = new Account(Name = 'Other');
    insert new List<Account>{ acct1, acct2 };
  }
  @IsTest
  private static void execute_ruleNotTriggered_noAlert() {
    CoreLibs_QueryRuleProcessor processor = new CoreLibs_QueryRuleProcessor();
    processor.lastRun = Datetime.now().addHours(-1);
    processor.rule = new CoreLibs_MonitoringRule__c(
      QuerySObjectType__c = 'Account',
      QueryFilter__c = 'Name = \'Not Found\'',
      RecordCountThreshold__c = 1
    );
    System.Test.startTest();
    processor.execute();
    System.Test.stopTest();
    Assert.areEqual(0, [SELECT Id FROM CoreLibs_MonitoringAlert__c].size(), 'Should not create an alert');
  }

  @IsTest
  private static void execute_ruleTriggered_alertCreated() {
    CoreLibs_QueryRuleProcessor processor = new CoreLibs_QueryRuleProcessor();
    processor.lastRun = Datetime.now().addHours(-1);
    processor.rule = new CoreLibs_MonitoringRule__c(
      QuerySObjectType__c = 'Account',
      QueryFilter__c = 'Name = \'Test\'',
      RecordCountThreshold__c = 1
    );
    System.Test.startTest();
    processor.execute();
    System.Test.stopTest();
    Assert.areEqual(1, [SELECT Id FROM CoreLibs_MonitoringAlert__c].size(), 'Should create an alert');
  }
}
