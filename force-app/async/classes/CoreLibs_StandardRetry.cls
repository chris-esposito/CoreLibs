/**
 * @description Standard retry mechanism for static retry intervals
 * @author Tom Wilkins
 * @group Async
 */
public inherited sharing class CoreLibs_StandardRetry implements CoreLibs_IAsyncRetryStrategy {
  @TestVisible
  private Integer numberOfRetries;
  @TestVisible
  private Integer delayInSeconds;

  /**
   * @description Constructor
   * @param numberOfRetries The number of times to attempt a retry
   * @param delayInSecond The delay (in seconds) between each retry
   */
  public CoreLibs_StandardRetry(Integer numberOfRetries, Integer delayInSeconds) {
    this.numberOfRetries = numberOfRetries;
    this.delayInSeconds = delayInSeconds;
  }

  public Boolean shouldRetry(Integer retryCount) {
    return retryCount <= this.numberOfRetries;
  }

  public Integer getDelay(Integer retryCount) {
    return this.delayInSeconds;
  }
}
