@IsTest
private inherited sharing class CoreLibs_TeamViewerControllerTest {
  @IsTest
  private static void getTeamViewerColumns_noMocksDefaultAtm_retunResults() {
    System.Test.startTest();
    List<CoreLibs_TeamViewerController.GetTeamViewerColumn> results = CoreLibs_TeamViewerController.getTeamViewerColumns(
      'AccountTeamMember',
      'CoreLibs_AccountTeamViewerDefaultFields'
    );
    System.Test.stopTest();
    Assert.isTrue(results.size() > 0, 'Should return some elements for columns');
  }
  @IsTest
  private static void getTeamMembers_mockedDependencies_returnResults() {
    Id mockUserId = new CoreLibs_SObjectMocker(User.getSObjectType()).generateMockId();
    CoreLibs_ClassMocker mocker = new CoreLibs_ClassMocker()
      .whenInvoking('getTeamMembers')
      .fromClass(CoreLibs_TeamMemberService.class)
      .thenReturn(new List<AccountTeamMember>{ new AccountTeamMember(UserId = mockUserId) })
      .whenInvoking('getSObjectType')
      .fromClass(CoreLibs_SObjectInspector.class)
      .thenReturn(AccountTeamMember.getSObjectType());
    CoreLibs_ClassMocker factoryMocker = new CoreLibs_ClassMocker()
      .whenInvoking('create')
      .thenExecute(new CoreLibs_FactoryMethodMock(mocker));
    CoreLibs_Services.teamMembers = (CoreLibs_TeamMemberService) mocker.generateStub(CoreLibs_TeamMemberService.class);
    CoreLibs_Factories.sObjectInspector = (CoreLibs_SObjectInspectorFactory) mocker.generateStub(
      CoreLibs_SObjectInspectorFactory.class
    );
    Id atmId = new CoreLibs_SObjectMocker(Account.getSObjectType()).generateMockId();
    System.Test.startTest();
    CoreLibs_TeamViewerController.GetTeamMemberResult results = CoreLibs_TeamViewerController.getTeamMembers(
      atmId,
      'AccountTeamMember',
      'Test'
    );
    System.Test.stopTest();
    Assert.areEqual(atmId, results.recordId, 'Should set the record id on results');
    Assert.areEqual('AccountTeamMember', results.sObjType, 'Should set the sobject type on the results');
    Assert.areEqual(1, results.records.size(), 'Should return the 1 mocked result');
    Assert.areEqual(
      mockUserId,
      ((AccountTeamMember) results.records[0]).UserId,
      'Should return the correct mocked record'
    );
  }
}
