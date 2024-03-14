/**
 * @description Logging interface for creating Salesforce logs
 * @author Tom Wilkins
 * @group Logging
 */
public inherited sharing class CoreLibs_Logger {
  @TestVisible
  private static final String ERROR_KEY = 'error';
  @TestVisible
  private static final String ERROR_MESSAGE_KEY = 'message';
  @TestVisible
  private static final String ERROR_STACKTRACE_KEY = 'stackTrace';
  @TestVisible
  private static final String ERROR_ADDITIONAL_DETAILS_KEY = 'additionalDetails';
  @TestVisible
  private static final String TYPE_ERROR = 'ERROR';
  @TestVisible
  private static final String TYPE_WARN = 'WARN';
  @TestVisible
  private static final String TYPE_INFO = 'INFO';

  /**
   * @description Creates an info log
   * @param label The label of the log
   * @param details The details to log
   */
  public void info(String label, Object details) {
    EventBus.publish(this.buildLog(label, TYPE_INFO, details));
  }

  /**
   * @description Creates a warn log
   * @param label The label of the log
   * @param details The details to log
   */
  public void warn(String label, Object details) {
    EventBus.publish(this.buildLog(label, TYPE_WARN, details));
  }

  /**
   * @description Creates an error log
   * @param label The label of the log
   * @param details The details to log
   */
  public void error(String label, Object details) {
    EventBus.publish(this.buildLog(label, TYPE_ERROR, details));
  }

  /**
   * @description Creates an error log
   * @param label The label of the log
   * @param e The exception to log details around
   */
  public void error(String label, Exception e) {
    Map<String, Object> details = new Map<String, Object>{
      ERROR_KEY => new Map<String, Object>{
        ERROR_MESSAGE_KEY => e.getMessage(),
        ERROR_STACKTRACE_KEY => e.getStackTraceString()
      }
    };
    EventBus.publish(this.buildLog(label, TYPE_ERROR, details));
  }

  /**
   * @description Creates an error log
   * @param label The label of the log
   * @param e The exception to log details around
   * @param additionalDetails Additional details to log with the exception
   */
  public void error(String label, Exception e, Object additionalDetails) {
    Map<String, Object> details = new Map<String, Object>{
      ERROR_KEY => new Map<String, Object>{
        ERROR_MESSAGE_KEY => e.getMessage(),
        ERROR_STACKTRACE_KEY => e.getStackTraceString()
      },
      ERROR_ADDITIONAL_DETAILS_KEY => additionalDetails
    };
    EventBus.publish(this.buildLog(label, TYPE_ERROR, details));
  }

  /**
   * @description Sets how long to retain logs for when a cleanup job is scheduled
   * @param numOfdays The number of days to retain a log for
   */
  public void setLogRetention(Integer numOfdays) {
    CoreLibs_LogCleanupSettings__c settings = CoreLibs_LogCleanupSettings__c.getOrgDefaults();
    settings.RetainLogsFor__c = numOfdays;
    upsert settings;
  }

  /**
   * @description Schedules a job to run daily at the time provided
   * Note this will run in the timezone of the person who schedules the job
   * @param scheduledTime Time to run job daily
   */
  public void scheduleDailyCleanup(Integer scheduledTime) {
    CoreLibs_LogCleanupSettings__c settings = CoreLibs_LogCleanupSettings__c.getOrgDefaults();
    settings.ScheduledTime__c = scheduledTime;
    upsert settings;
    CoreLibs_LogCleanupJob.schedule(scheduledTime);
  }

  @TestVisible
  private CoreLibs_LogEvent__e buildLog(String label, String type, Object details) {
    CoreLibs_LoggerContext ctx = CoreLibs_LoggerContext.getInstance();
    return new CoreLibs_LogEvent__e(
      Label__c = label,
      Type__c = type,
      Details__c = JSON.serialize(details),
      RunningUser__c = ctx.getRunningUserId(),
      SessionId__c = ctx.getRunningUserSessionId(),
      TransactionId__c = ctx.getTransactionId(),
      TransactionType__c = ctx.getTransactionType(),
      LogCreationTimestamp__c = Datetime.now()
    );
  }
}
