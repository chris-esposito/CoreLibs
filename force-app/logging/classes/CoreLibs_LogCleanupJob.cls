/**
 * @description Cleanup jobs for logs in Salesforce
 * @author Tom Wilkins
 * @group Logging
 */
public without sharing class CoreLibs_LogCleanupJob implements Database.Batchable<SObject>, System.Schedulable {
  @TestVisible
  private static final String JOB_NAME = 'Log Cleanup Job';
  @TestVisible
  private static final String CRON = '0 0 {0} * * ? *';

  /**
   * @description Schedules the job to operate daily at the provided hour
   * @param hour The hour to execute at
   */
  public static void schedule(Integer hour) {
    cancel();
    System.schedule(
      JOB_NAME,
      String.format(CRON, new List<String>{ String.valueOf(hour) }),
      new CoreLibs_LogCleanupJob()
    );
  }

  /**
   * @description Cancels an existing log cleanup job
   */
  public static void cancel() {
    CoreLibs_CronTriggerSelector cronSelector = (CoreLibs_CronTriggerSelector) CoreLibs_Factories.selector.create(
      CoreLibs_CronTriggerSelector.class
    );
    List<CronTrigger> existingJobs = cronSelector.getByJobName(new Set<String>{ JOB_NAME });
    if (!existingJobs.isEmpty()) {
      for (CronTrigger job : existingJobs) {
        System.abortJob(job.Id);
      }
    }
  }

  public Database.QueryLocator start(Database.BatchableContext ctx) {
    CoreLibs_LogCleanupSettings__c settings = CoreLibs_LogCleanupSettings__c.getOrgDefaults();
    Datetime cutoff;
    if (settings.RetainLogsFor__c != null) {
      cutoff = Datetime.now().addDays(-((Integer) settings.RetainLogsFor__c));
    } else {
      // default to 30 days if no setting
      cutoff = Datetime.now().addDays(-30);
    }
    String query = 'SELECT Id FROM CoreLibs_Log__c WHERE LogCreationTimestamp__c <= :cutoff';
    return Database.getQueryLocator(query);
  }

  public void execute(Database.BatchableContext ctx, List<SObject> records) {
    delete records;
  }

  public void finish(Database.BatchableContext ctx) {
    return;
  }

  public void execute(System.SchedulableContext ctx) {
    Database.executeBatch(this);
  }
}
