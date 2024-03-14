/**
 * @description Data access layer ofr Salesforce monitoring rules
 * @author Tom Wilkins
 * @group Logging
 */
public inherited sharing class CoreLibs_MonitoringRuleSelector extends CoreLibs_BaseSelector {
  public override Schema.SObjectType getSObjectType() {
    return CoreLibs_MonitoringRule__c.getSObjectType();
  }

  /**
   * @description Queries all active monitoring rules
   * @return List of active rules
   */
  public List<CoreLibs_MonitoringRule__c> getActiveRules() {
    return (List<CoreLibs_MonitoringRule__c>) Database.query(this.buildQueryString('IsActive__c = true'));
  }
}
