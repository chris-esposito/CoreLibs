/**
 * @description Lightning controller for various log UI functionality
 * @author Tom Wilkins
 * @group Logging
 */
public with sharing class CoreLibs_LogController {
  /**
   * @description Gets the log details for the provided log record Id
   * @recordId Salesforce CoreLibs_Log__c record Id
   * @return Log Details as a JSON string
   */
  @AuraEnabled(cacheable=true)
  public static String getLogDetails(Id recordId) {
    try {
      List<Corelibs_Log__c> log = CoreLibs_Factories.selector.create(CoreLibs_LogSelector.class)
        .setFields(new List<Schema.SObjectField>{ Corelibs_Log__c.Details__c })
        .getById(new Set<Id>{ recordId });
      return log.isEmpty() ? null : log[0].Details__c;
    } catch (Exception e) {
      throw CoreLibs_Services.errors.buildUIException(e);
    }
  }

  /**
   * @description Returns logs based on provided filters
   * @param filters Filters to limit what logs are returned
   * @return List of logs (up to 1000, by most recent that match criteria)
   */
  @AuraEnabled
  public static List<CoreLibs_Log__c> getLogs(CoreLibs_LogController.GetLogsInput filters) {
    try {
      List<String> queryFilters = new List<String>();
      if (String.isNotBlank(filters.transactionId)) {
        queryFilters.add('TransactionId__c = \'' + String.escapeSingleQuotes(filters.transactionId) + '\'');
      }
      if (String.isNotBlank(filters.runningUserId)) {
        queryFilters.add('RunningUser__c = \'' + String.escapeSingleQuotes(filters.runningUserId) + '\'');
      }
      if (String.isNotBlank(filters.runningUserSessionId)) {
        queryFilters.add('SessionId__c = \'' + String.escapeSingleQuotes(filters.runningUserSessionId) + '\'');
      }
      if (filters.startTime != null) {
        queryFilters.add('LogCreationTimestamp__c >= ' + String.escapeSingleQuotes(filters.startTime));
      }
      if (filters.endTime != null) {
        queryFilters.add('LogCreationTimestamp__c <= ' + String.escapeSingleQuotes(filters.endTime));
      }
      if (String.isNotBlank(filters.type)) {
        queryFilters.add('Type__c = \'' + String.escapeSingleQuotes(filters.type) + '\'');
      }
      return (List<CoreLibs_Log__c>) CoreLibs_Factories.selector.create(CoreLibs_LogSelector.class)
        .setFields(
          new List<Schema.SObjectField>{
            CoreLibs_Log__c.Name,
            CoreLibs_Log__c.Type__c,
            CoreLibs_Log__c.TransactionId__c,
            CoreLibs_Log__c.TransactionType__c,
            CoreLibs_Log__c.RunningUser__c,
            CoreLibs_Log__c.RunningUserName__c,
            CoreLibs_Log__c.LogCreationTimestamp__c
          }
        )
        .setOrderBy('LogCreationTimestamp__c DESC')
        .setLimit(1000)
        .getByFilters(queryFilters);
    } catch (Exception e) {
      throw CoreLibs_Services.errors.buildUIException(e);
    }
  }

  /**
   * @description Returns the log cleanup settings
   * @return Cleanup Settings
   */
  @AuraEnabled
  public static GetLogCleanupSettingsOutput getLogCleanupSettings() {
    try {
      CoreLibs_AsyncApexJobSelector jobSelector = (CoreLibs_AsyncApexJobSelector) CoreLibs_Factories.selector.create(
          CoreLibs_AsyncApexJobSelector.class
        )
        .setFields(new List<Schema.SObjectField>{ AsyncApexJob.Status, AsyncApexJob.CompletedDate });
      AsyncApexJob lastRun = jobSelector.getLastCompletedJob('CoreLibs_LogCleanupJob');
      return new GetLogCleanupSettingsOutput(CoreLibs_LogCleanupSettings__c.getOrgDefaults(), lastRun);
    } catch (Exception e) {
      throw CoreLibs_Services.errors.buildUIException(e);
    }
  }

  /**
   * @description Sets the duration (days) to retain logs for when a cleanup job is scheduled
   * @param numOfDays The number of days to retain lgos for
   */
  @AuraEnabled
  public static void saveRetainLogsForSetting(Integer numOfDays) {
    try {
      CoreLibs_Services.logger.setLogRetention(numOfDays);
    } catch (Exception e) {
      throw CoreLibs_Services.errors.buildUIException(e);
    }
  }

  /**
   * @description Schedules a job to run daily at the time provided
   * Note this will run in the timezone of the person who schedules the job
   * @param scheduledTime Time to run job daily (0-23)
   */
  @AuraEnabled
  public static void scheduleLogCleanupJob(Integer scheduledTime) {
    try {
      CoreLibs_Services.Logger.scheduleDailyCleanup(scheduledTime);
    } catch (Exception e) {
      throw CoreLibs_Services.errors.buildUIException(e);
    }
  }

  /**
   * @description Inner class to capture method output
   */
  public inherited sharing class GetLogCleanupSettingsOutput {
    @AuraEnabled
    public Integer retainLogsFor { get; set; }
    @AuraEnabled
    public Integer scheduledTime { get; set; }
    @AuraEnabled
    public Datetime lastRun { get; set; }
    @AuraEnabled
    public String lastRunStatus { get; set; }

    public GetLogCleanupSettingsOutput(CoreLibs_LogCleanupSettings__c settings, AsyncApexJob lastRunJob) {
      this.retainLogsFor = Integer.valueOf(settings.RetainLogsFor__c);
      this.scheduledTime = Integer.valueOf(settings.ScheduledTime__c);
      this.lastRun = lastRunJob?.CompletedDate;
      this.lastRunStatus = lastRunJob?.Status;
    }
  }

  /**
   * @description Inner class to capture complex method input -- transform before
   * passing to service/domain/data classes
   */
  public inherited sharing class GetLogsInput {
    @AuraEnabled
    public String transactionId { get; set; }
    @AuraEnabled
    public String runningUserId { get; set; }
    @AuraEnabled
    public String runningUserSessionId { get; set; }
    @AuraEnabled
    public String startTime { get; set; }
    @AuraEnabled
    public String endTime { get; set; }
    @AuraEnabled
    public String type { get; set; }
  }
}
