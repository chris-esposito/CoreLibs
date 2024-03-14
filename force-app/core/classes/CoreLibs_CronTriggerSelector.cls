/**
 * @description Data access for the CronTrigger object
 * @author Tom Wilkins
 * @group Core
 */
public inherited sharing class CoreLibs_CronTriggerSelector extends CoreLibs_BaseSelector {
  public override Schema.SObjectType getSObjectType() {
    return CronTrigger.getSObjectType();
  }

  /**
   * @description Returns cron trigger by job name
   * @param jobNames Names of jobs to query
   * @return List of cron jobs
   */
  public List<CronTrigger> getByJobName(Set<String> jobNames) {
    return (List<CronTrigger>) Database.query(this.buildQueryString('CronJobDetail.Name IN :jobNames'));
  }
}
