@IsTest
private inherited sharing class CoreLibs_ExponentialBackoffRetryTest {
  @IsTest
  private static void shouldRetry_isLessThan_returnTrue() {
    CoreLibs_ExponentialBackoffRetry retry = new CoreLibs_ExponentialBackoffRetry();
    System.Test.startTest();
    Boolean result = retry.shouldRetry(1);
    System.Test.stopTest();
    Assert.isTrue(result, 'Should return true for should retry when less than');
  }

  @IsTest
  private static void shouldRetry_equalTo_returnTrue() {
    CoreLibs_ExponentialBackoffRetry retry = new CoreLibs_ExponentialBackoffRetry();
    System.Test.startTest();
    Boolean result = retry.shouldRetry(5);
    System.Test.stopTest();
    Assert.isTrue(result, 'Should return true for should retry when equal');
  }

  @IsTest
  private static void shouldRetry_isGreatherThan_returnFalse() {
    CoreLibs_ExponentialBackoffRetry retry = new CoreLibs_ExponentialBackoffRetry();
    System.Test.startTest();
    Boolean result = retry.shouldRetry(6);
    System.Test.stopTest();
    Assert.isFalse(result, 'Should return false for should retry when greater than');
  }

  @IsTest
  private static void getDelay_returnValue() {
    CoreLibs_ExponentialBackoffRetry retry = new CoreLibs_ExponentialBackoffRetry();
    System.Test.startTest();
    Integer result = retry.getDelay(2);
    System.Test.stopTest();
    Assert.areEqual(4, result, 'Should return the delay of 2^2 = 4');
  }
}
