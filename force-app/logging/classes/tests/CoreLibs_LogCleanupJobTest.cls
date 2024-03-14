@IsTest
private inherited sharing class CoreLibs_LogCleanupJobTest {
  @IsTest
  private static void e2e_1ToRetain_deleteAllButOne() {
    CoreLibs_Log__c toKeep = new CoreLibs_Log__c(LogCreationTimestamp__c = Datetime.now());
    CoreLibs_log__c toDelete = new CoreLibs_Log__c(LogCreationTimestamp__c = Datetime.now().addDays(-7));
    insert new List<CoreLibs_Log__c>{ toKeep, toDelete };
    CoreLibs_LogCleanupSettings__c settings = CoreLibs_LogCleanupSettings__c.getOrgDefaults();
    settings.RetainLogsFor__c = 3;
    upsert settings;
    CoreLibs_LogCleanupJob job = new CoreLibs_LogCleanupJob();
    System.Test.startTest();
    Database.executeBatch(job);
    System.Test.stopTest();
    CoreLibs_Log__c remaining = [SELECT Id FROM CoreLibs_Log__c];
    Assert.areEqual(toKeep.Id, remaining.Id, 'Should keep the correct log');
  }
}
