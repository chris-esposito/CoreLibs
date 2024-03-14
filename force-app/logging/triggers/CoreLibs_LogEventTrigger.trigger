/**
 * @description Simple trigger for processing log events
 * @author Tom Wilkins
 * @group Logging
 */
trigger CoreLibs_LogEventTrigger on Corelibs_LogEvent__e(after insert) {
  // can convert to automation framework later if needed
  // this use case is super simple for now though
  List<CoreLibs_Log__c> logs = new List<CoreLibs_Log__c>();
  for (CoreLibs_LogEvent__e evt : Trigger.new) {
    logs.add(
      new CoreLibs_Log__c(
        Label__c = evt.Label__c,
        Type__c = evt.Type__c,
        Details__c = evt.Details__c,
        RunningUser__c = evt.RunningUser__c,
        SessionId__c = evt.SessionId__c,
        TransactionId__c = evt.TransactionId__c,
        TransactionType__c = evt.TransactionType__c,
        LogCreationTimestamp__c = evt.LogCreationTimestamp__c
      )
    );
  }
  insert logs;
}
