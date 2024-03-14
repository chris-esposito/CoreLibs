/**
 * @description Expoenential backoff, capped at 5 retries due to CPU limitation concerns
 * @author Tom Wilkins
 * @group Async
 */
public inherited sharing class CoreLibs_ExponentialBackoffRetry implements CoreLibs_IAsyncRetryStrategy {
  public Boolean shouldRetry(Integer retryCount) {
    return retryCount <= 5;
  }

  public Integer getDelay(Integer retryCount) {
    return (Integer) Math.pow(2, retryCount);
  }
}
