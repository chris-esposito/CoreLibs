/**
 * @description Base class for monitoring rule processesors. Note that when creating new
 * processor types, there may be additional configuration in the ClassName__c field on
 * the CoreLibs_MonitoringRule__c object
 * @author Tom Wilkins
 * @group Logging
 */
public inherited sharing abstract class CoreLibs_MonitoringRuleProcessor {
  @TestVisible
  protected CoreLibs_MonitoringRule__c rule;
  @TestVisible
  protected Datetime lastRun;

  /**
   * @description Monitor logic method
   */
  public abstract void execute();

  /**
   * @description Rule setter
   * @param rule Rule to set
   * @return Reference to the invoking object
   */
  public CoreLibs_MonitoringRuleProcessor setRule(CoreLibs_MonitoringRule__c rule) {
    this.rule = rule;
    return this;
  }

  /**
   * @description Sets the last time the job was run
   * @param lastRun Last time job was run
   * @return Reference to the invoking object
   */
  public CoreLibs_MonitoringRuleProcessor setLastRun(Datetime lastRun) {
    this.lastRun = lastRun;
    return this;
  }
}
