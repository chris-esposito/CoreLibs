/**
 * @description Wrapper for executing queueables in scheduled jobs
 * @author Tom Wilkins
 * @group Async
 */
public with sharing class CoreLibs_SchedulableQueueable implements Schedulable {
  @TestVisible
  private Queueable toExceute;

  /**
   * @description Constructor
   * @param toExecute Queueable to execute
   */
  public CoreLibs_SchedulableQueueable(Queueable toExecute) {
    this.toExceute = toExecute;
  }

  /**
   * @see Schedulable
   */
  public void execute(SchedulableContext ctx) {
    System.enqueueJob(this.toExceute);
  }
}
