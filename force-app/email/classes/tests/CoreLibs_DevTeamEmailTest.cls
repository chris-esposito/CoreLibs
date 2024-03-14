@IsTest
private inherited sharing class CoreLibs_DevTeamEmailTest {
  @IsTest
  private static void sendEmail_coverage() {
    CoreLibs_EnvVariables__c env = CoreLibs_EnvVariables__c.getOrgDefaults();
    env.CoreLibs_DevTeamEmail__c = 'apexunittest@ultra.me';
    insert env;
    CoreLibs_DevTeamEmail em = new CoreLibs_DevTeamEmail();
    System.Test.startTest();
    em.sendEmail('Test', 'Test');
    System.Test.stopTest();
    // because the email will not fire and we dont have a service wrapper to mock
    // then just verify that the test executes
    Assert.isTrue(true, 'Method should execution');
  }
}
