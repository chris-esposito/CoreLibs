/**
 * @description Rule for using queries to trigger alerts
 * @author Tom Wilkins
 * @group Logging
 */
public inherited sharing class CoreLibs_QueryRuleProcessor extends CoreLibs_MonitoringRuleProcessor {
  @TestVisible
  private static final String RULE_TITLE = 'Monitoring Rule Triggered: {0}';
  @TestVisible
  private static final String RULE_MESSAGE = 'View Alert: {0}';
  /**
   * @description Executes the query and will fire a pager duty email if the query count
   * threshold is exceeded
   */
  public override void execute() {
    String query = ' SELECT count() FROM ' + this.rule.QuerySObjectType__c + ' WHERE ' + this.rule.QueryFilter__c;
    if (this.rule.SinceLastRun__c) {
      query += ' AND CreatedDate >= :lastRun';
    }
    Integer count = Database.countQuery(query);
    if (count >= (Integer) this.rule.RecordCountThreshold__c) {
      CoreLibs_MonitoringAlert__c alert = new CoreLibs_MonitoringAlert__c(
        Status__c = 'Triggered',
        MonitoringRule__c = this.rule.Id,
        AlertQuery__c = query.replace('count()', 'Id')
      );
      CoreLibs_Services.dml.insertRecord(alert);
      String alertUrl = Url.getOrgDomainUrl().toExternalForm() + '/' + alert.Id;
      switch on (rule.AlertType__c) {
        when 'Email' {
          CoreLibs_Email.devTeam.sendEmail(
            String.format(RULE_TITLE, new List<String>{ this.rule.Name }),
            String.format(RULE_MESSAGE, new List<String>{ alertUrl })
          );
        }
      }
    }
  }
}
