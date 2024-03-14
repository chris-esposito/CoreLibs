/**
 * @description Wrapper queable which allows an async action to execute and retry under injected error
 * circumstances
 * @author Tom Wilkins
 * @group Async
 */
public inherited sharing class CoreLibs_AsyncActionWithRetry implements Queueable, Database.AllowsCallouts {
  @TestVisible
  private static final String RETRY_LOG_MESSAGE = 'Attempt {0} of 5 Failed: {1}';
  @TestVisible
  private CoreLibs_IAsyncAction toExecute;
  @TestVisible
  private CoreLibs_IAsyncRetryStrategy retryStrategy;
  @TestVisible
  private String logLabel;
  @TestVisible
  private Integer retry = 0;
  @TestVisible
  Boolean shouldExecuteAction;

  /**
   * @description Cosntructor - specifiy exception types that an async action should retry on
   * @param toExecute The async action to execute
   * @param retryStrategy Retry strategy
   */
  public CoreLibs_AsyncActionWithRetry(CoreLibs_IAsyncAction toExecute, CoreLibs_IAsyncRetryStrategy retryStrategy) {
    this.toExecute = toExecute;
    this.retryStrategy = retryStrategy;
    this.logLabel = 'CoreLibs_AsyncActionWithRetry:' + new CoreLibs_ObjectInspector(toExecute).getClassName();
    this.shouldExecuteAction = true;
  }

  /**
   * @description Either executes the action, or executes the delay. Both events may result in a requeue.
   * @see [Queuable](https://developer.salesforce.com/docs/atlas.en-us.apexcode.meta/apexcode/apex_queueing_jobs.htm)
   */
  public void execute(QueueableContext context) {
    if (this.shouldExecuteAction) {
      try {
        this.toExecute.execute();
      } catch (Exception e) {
        if (this.retryStrategy.shouldRetry(++this.retry)) {
          CoreLibs_Services.logger.warn(
            this.logLabel,
            String.format(RETRY_LOG_MESSAGE, new List<String>{ String.valueOf(this.retry), e.getMessage() })
          );
          this.shouldExecuteAction = false;
          CoreLibs_Environment.getInstance().enqueue(this);
        } else {
          CoreLibs_Services.logger.error(this.logLabel, e);
          this.toExecute.handleError(e);
        }
      }
    } else {
      CoreLibs_Environment.getInstance().sleep(this.retryStrategy.getDelay(this.retry) * 1000);
      this.shouldExecuteAction = true;
      CoreLibs_Environment.getInstance().enqueue(this);
    }
  }
}
