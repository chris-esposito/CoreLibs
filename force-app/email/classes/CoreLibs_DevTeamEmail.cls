/**
 * @description Service class for managing emails to the dev team
 * @author Tom Wilkins
 * @group Email
 */
public inherited sharing class CoreLibs_DevTeamEmail {
  /**
   * @description Sends an email to the dev team with the provided subject/body
   * Requires that the Dev Team Email environment variable be set
   * @param subject Email subject
   * @param body Email body
   */
  public void sendEmail(String subject, String body) {
    // TODO update to using env var apex when implemented
    CoreLibs_EnvVariables__c env = CoreLibs_EnvVariables__c.getOrgDefaults();
    if (String.isBlank(env.CoreLibs_DevTeamEmail__c)) {
      return;
    }
    String teamEmail = env.CoreLibs_DevTeamEmail__c;
    Messaging.SingleEmailMessage email = new Messaging.SingleEmailMessage();
    email.setSubject(subject);
    email.setPlainTextBody(body);
    email.setToAddresses(new List<String>{ teamEmail });
    if (!System.Test.isRunningTest()) {
      Messaging.sendEmail(new List<Messaging.SingleEmailMessage>{ email });
    }
  }
}
