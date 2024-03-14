@IsTest
private inherited sharing class CoreLibs_StandardRetryTest {
  @IsTest
  private static void shouldRetry_isLessThan_returnTrue() {
    CoreLibs_StandardRetry retry = new CoreLibs_StandardRetry(2, 2);
    System.Test.startTest();
    Boolean result = retry.shouldRetry(1);
    System.Test.stopTest();
    Assert.isTrue(result, 'Should return true for should retry when less than');
  }

  @IsTest
  private static void shouldRetry_equalTo_returnTrue() {
    CoreLibs_StandardRetry retry = new CoreLibs_StandardRetry(2, 2);
    System.Test.startTest();
    Boolean result = retry.shouldRetry(2);
    System.Test.stopTest();
    Assert.isTrue(result, 'Should return true for should retry when equal');
  }

  @IsTest
  private static void shouldRetry_isGreatherThan_returnFalse() {
    CoreLibs_StandardRetry retry = new CoreLibs_StandardRetry(2, 2);
    System.Test.startTest();
    Boolean result = retry.shouldRetry(3);
    System.Test.stopTest();
    Assert.isFalse(result, 'Should return false for should retry when greater than');
  }

  @IsTest
  private static void getDelay_returnValue() {
    CoreLibs_StandardRetry retry = new CoreLibs_StandardRetry(2, 2);
    System.Test.startTest();
    Integer result = retry.getDelay(1);
    System.Test.stopTest();
    Assert.areEqual(2, result, 'Should return the injected delay');
  }
}
