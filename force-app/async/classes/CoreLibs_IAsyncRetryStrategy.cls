/**
 * @description Base interface for async retry strategies
 * @author Tom Wilkins
 * @group Async
 */
public interface CoreLibs_IAsyncRetryStrategy {
  /**
   * @description Returns whether or not another retry should occur
   * @param retryCount the current retry attempt
   * @return True if retry should occur, false otherwise
   */
  Boolean shouldRetry(Integer retryCount);
  /**
   * @description Returns the delay based on the current retry attempt
   * @param retryCount the current retry attempt
   * The number of seconds that the delay should be
   */
  Integer getDelay(Integer retryCount);
}
