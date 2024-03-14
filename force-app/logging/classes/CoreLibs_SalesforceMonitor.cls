/**
 * @description Runs the Salesforce monitor job which will process monitoring rules sequentially
 * @author Tom Wilkins
 * @group Logging
 */
public without sharing class CoreLibs_SalesforceMonitor implements Queueable {
  @TestVisible
  private static final String JOB_CLASS_NAME = 'SalesforceMonitor';

  @TestVisible
  private List<CoreLibs_MonitoringRule__c> rules {
    get {
      if (this.rules == null) {
        CoreLibs_SObjectInspector ruleInspector = CoreLibs_Factories.sObjectInspector.create(
          CoreLibs_MonitoringRule__c.getSObjectType()
        );
        CoreLibs_MonitoringRuleSelector ruleSelector = (CoreLibs_MonitoringRuleSelector) CoreLibs_Factories.selector.create(
            CoreLibs_MonitoringRuleSelector.class
          )
          .setFields(ruleInspector.getAllFields());
        this.rules = ruleSelector.getActiveRules();
      }
      return this.rules;
    }
    set;
  }

  @TestVisible
  private Integer index {
    get {
      if (this.index == null) {
        this.index = 0;
      }
      return this.index;
    }
    set;
  }

  @TestVisible
  private Datetime lastRun {
    get {
      if (this.lastRun == null) {
        CoreLibs_AsyncApexJobSelector jobSelector = (CoreLibs_AsyncApexJobSelector) CoreLibs_Factories.selector.create(
            CoreLibs_AsyncApexJobSelector.class
          )
          .setFields(new List<Schema.SObjectField>{ AsyncApexJob.CompletedDate })
          .setLimit(1);
        AsyncApexJob lastJob = jobSelector.getLastCompletedJob(JOB_CLASS_NAME);
        Datetime lastRun;
        if (lastJob == null) {
          // if no last run, just default 1 hour ago
          this.lastRun = Datetime.now().addHours(-1);
        } else {
          this.lastRun = lastJob.CompletedDate;
        }
      }
      return this.lastRun;
    }
    set;
  }

  /**
   * @description Queueable execute method -- processes the rules and chains if necessary
   */
  public void execute(QueueableContext ctx) {
    CoreLibs_DataSettings.getInstance().disableFLS();
    if (this.rules.isEmpty()) {
      return;
    }
    CoreLibs_MonitoringRule__c rule = this.rules[this.index];
    CoreLibs_MonitoringRuleProcessor ruleProcessor = (CoreLibs_MonitoringRuleProcessor) Type.forName(rule.ClassName__c)
      ?.newInstance();
    ruleProcessor?.setRule(rule)?.setLastRun(this.lastRun)?.execute();
    if (++this.index < this.rules.size()) {
      System.enqueueJob(this);
    }
  }
}
