@IsTest
private inherited sharing class CoreLibs_EnvironmentTest {
  @IsTest
  private static void getInstance_initAndReturnInstance() {
    System.Test.startTest();
    CoreLibs_Environment result = CoreLibs_Environment.getInstance();
    System.Test.stopTest();
    Assert.isNotNull(result, 'Should get a non-null Environment instance back');
  }

  @IsTest
  private static void sleep_halfSecond_confirmDelay() {
    CoreLibs_Environment env = new CoreLibs_Environment();
    Long beforeDelay = Datetime.now().getTime();
    System.Test.startTest();
    env.sleep(500);
    System.Test.stopTest();
    Long afterDelay = Datetime.now().getTime();
    Assert.isTrue(afterDelay >= beforeDelay + 500, 'Should delay for a half second');
  }

  @IsTest
  private static void enqueue_validStateForQueueable_jobQueued() {
    CoreLibs_Environment env = new CoreLibs_Environment();
    System.Test.startTest();
    env.enqueue(new CoreLibs_TestQueueable());
    System.Test.stopTest();
    Assert.areEqual(1, [SELECT Id FROM AsyncApexJob].size(), 'Should enqueue job');
  }

  @IsTest
  private static void enqueueFromFuture_jobQueued() {
    System.Test.startTest();
    CoreLibs_Environment.enqueueFromFuture(JSON.serialize(new CoreLibs_TestQueueable()), 'CoreLibs_TestQueueable');
    System.Test.stopTest();
    Assert.areEqual(1, [SELECT Id FROM AsyncApexJob].size(), 'Should enqueue job');
  }
}
