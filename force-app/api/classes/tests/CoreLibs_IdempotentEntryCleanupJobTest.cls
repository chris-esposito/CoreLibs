@IsTest
private inherited sharing class CoreLibs_IdempotentEntryCleanupJobTest {
  @IsTest
  private static void execute_requestsExists_deleteOldRequests() {
    CoreLibs_IdempotentEntry__c toKeep = new CoreLibs_IdempotentEntry__c(
      HttpMethod__c = 'POST',
      Url__c = 'test',
      IdempotencyKey__c = 'abc123',
      ResponseStatusCode__c = '200'
    );
    CoreLibs_IdempotentEntry__c toDelete = new CoreLibs_IdempotentEntry__c(
      HttpMethod__c = 'POST',
      Url__c = 'test',
      IdempotencyKey__c = '456xyz',
      ResponseStatusCode__c = '200'
    );
    insert new List<CoreLibs_IdempotentEntry__c>{ toKeep, toDelete };
    Test.setCreatedDate(toDelete.Id, Datetime.now().addDays(-10));
    System.Test.startTest();
    Database.executeBatch(new CoreLibs_IdempotentEntryCleanupJob());
    System.Test.stopTest();
    List<CoreLibs_IdempotentEntry__c> remainingEntries = [SELECT Id FROM CoreLibs_IdempotentEntry__c];
    Assert.areEqual(1, remainingEntries.size(), 'Should delete 1 record');
    Assert.areEqual(toKeep.Id, remainingEntries[0].Id, 'Should keep the correct record');
  }
}
