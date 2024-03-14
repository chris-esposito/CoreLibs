@IsTest
private inherited sharing class CoreLibs_AccountTeamMemberSelectorTest {
  @IsTest
  private static void getSObjectType_returnAccountTeamMember() {
    CoreLibs_AccountTeamMemberSelector selector = new CoreLibs_AccountTeamMemberSelector();
    System.Test.startTest();
    Schema.SObjectType result = selector.getSObjectType();
    System.Test.stopTest();
    Assert.areEqual(AccountTeamMember.getSObjectType(), result, 'Should return AccountTeamMember');
  }
}
