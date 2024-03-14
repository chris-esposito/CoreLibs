@IsTest
private inherited sharing class CoreLibs_TeamMemberServiceTest {
  @TestSetup
  private static void makeData() {
    Account act = (Account) new CoreLibs_SObjectMocker(Account.getSObjectType()).generateRecord();
    // stopgap until smart data factory is fixed
    act.OwnerId = UserInfo.getUserId();
    insert act;
    AccountTeamMember atm = (AccountTeamMember) new CoreLibs_SObjectMocker(AccountTeamMember.getSObjectType())
      .generateRecord(
        new Map<Schema.SObjectField, Object>{
          AccountTeamMember.AccountId => act.Id,
          AccountTeamMember.UserId => UserInfo.getUserId()
        }
      );
    insert atm;
  }
  @IsTest
  private static void getTeamMembers_accountTeamMember_returnMembers() {
    Account act = [SELECT Id FROM Account];
    CoreLibs_TeamMemberService service = new CoreLibs_TeamMemberService();
    System.Test.startTest();
    List<AccountTeamMember> results = (List<AccountTeamMember>) service.getTeamMembers(
      act.Id,
      AccountTeamMember.getSObjectType(),
      'CoreLibs_AccountTeamViewerDefaultFields'
    );
    System.Test.stopTest();
    Assert.areEqual(1, results.size(), 'Should return the one account team member');
  }
}
