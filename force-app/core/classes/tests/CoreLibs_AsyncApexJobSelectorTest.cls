@IsTest
private inherited sharing class CoreLibs_AsyncApexJobSelectorTest {
  @IsTest
  private static void getSObjectType_returnAsyncApexJob() {
    CoreLibs_AsyncApexJobSelector selector = new CoreLibs_AsyncApexJobSelector();
    System.Test.startTest();
    Schema.SObjectType result = selector.getSObjectType();
    System.Test.stopTest();
    Assert.areEqual(AsyncApexJob.getSObjectType(), result, 'Should return AsyncApexJob');
  }

  // because jobs can be so finnicky and we dont want to create dependencies, just go for coverage tests here
  // to make sure queries build successfully
  @IsTest
  private static void getByCronJobDetailName_dummyName_returnNothing() {
    CoreLibs_AsyncApexJobSelector selector = new CoreLibs_AsyncApexJobSelector();
    System.Test.startTest();
    List<AsyncApexJob> result = selector.getByCronJobDetailName(new Set<String>{ 'DUMMY JOB' });
    System.Test.stopTest();
    Assert.areEqual(0, result.size(), 'Should return no jobs');
  }

  @IsTest
  private static void getAllScheduledJobs_dummyName_returnNothing() {
    CoreLibs_AsyncApexJobSelector selector = new CoreLibs_AsyncApexJobSelector();
    System.Test.startTest();
    List<AsyncApexJob> result = selector.getAllScheduledJobs('DUMMY JOB');
    System.Test.stopTest();
    Assert.areEqual(0, result.size(), 'Should return no jobs');
  }

  @IsTest
  private static void getLastCompletedJob_dummyName_returnNothing() {
    CoreLibs_AsyncApexJobSelector selector = new CoreLibs_AsyncApexJobSelector();
    System.Test.startTest();
    AsyncApexJob result = selector.getLastCompletedJob('DUMMY JOB');
    System.Test.stopTest();
    Assert.areEqual(null, result, 'Should return no jobs');
  }
}
