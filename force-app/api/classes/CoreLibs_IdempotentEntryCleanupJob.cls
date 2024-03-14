/**
 * @description Job for cleaning up API Requests after they have lived beyond some configurable TTL
 * @author Tom Wilkins
 * @group Api
 */
public without sharing class CoreLibs_IdempotentEntryCleanupJob implements Database.Batchable<sObject> {
  @TestVisible
  private Integer ttlInDays;

  public CoreLibs_IdempotentEntryCleanupJob() {
    CoreLibs_EnvVariables__c env = CoreLibs_EnvVariables__c.getOrgDefaults();
    if (env.CoreLibs_IdempotentEntryTTL__c == null) {
      this.ttlInDays = 7;
    } else {
      this.ttlInDays = Integer.valueOf(env.CoreLibs_IdempotentEntryTTL__c);
    }
  }

  public Database.Querylocator start(Database.BatchableContext BC) {
    Datetime dt = Datetime.now().addDays(-(this.ttlInDays));
    return Database.getQueryLocator('SELECT Id FROM CoreLibs_IdempotentEntry__c WHERE CreatedDate <= :dt');
  }

  public void execute(Database.BatchableContext info, List<SObject> scope) {
    CoreLibs_DataSettings.getInstance().disableFLS();
    CoreLibs_Services.dml.deleteRecords(scope);
  }

  public void finish(Database.BatchableContext BC) {
  }
}
