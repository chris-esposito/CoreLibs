@IsTest
private inherited sharing class CoreLibs_IdempotentEntrySelectorTest {
  @IsTest
  private static void getSObjectType_IdempotentEntry() {
    CoreLibs_IdempotentEntrySelector reqSelector = new CoreLibs_IdempotentEntrySelector();
    System.Test.startTest();
    Schema.SObjectType result = reqSelector.getSObjectType();
    System.Test.stopTest();
    Assert.areEqual(
      CoreLibs_IdempotentEntry__c.getSObjectType(),
      result,
      'Should return the CoreLibs_IdempotentEntry__c sobject type'
    );
  }

  @IsTest
  private static void getByIdempotencyKey_multipleEntries_returnOne() {
    CoreLibs_IdempotentEntry__c req1 = new CoreLibs_IdempotentEntry__c(
      HttpMethod__c = 'POST',
      Url__c = 'test',
      IdempotencyKey__c = 'abc123',
      ResponseStatusCode__c = '200'
    );
    CoreLibs_IdempotentEntry__c req2 = new CoreLibs_IdempotentEntry__c(
      HttpMethod__c = 'POST',
      Url__c = 'test',
      IdempotencyKey__c = '456xyz',
      ResponseStatusCode__c = '200'
    );
    insert new List<CoreLibs_IdempotentEntry__c>{ req1, req2 };
    CoreLibs_IdempotentEntrySelector reqSelector = new CoreLibs_IdempotentEntrySelector();
    System.Test.startTest();
    List<CoreLibs_IdempotentEntry__c> results = reqSelector.getByIdempotencyKey(new Set<String>{ 'abc123' });
    System.Test.stopTest();
    Assert.areEqual(1, results.size(), 'Should return one entry record');
    Assert.areEqual(req1.Id, results[0].Id, 'Should return the correct entry record');
  }
}
