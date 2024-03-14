@IsTest
private inherited sharing class CoreLibs_SObjectInspectorFactoryTest {
  @IsTest
  private static void create_withAccount_returnInspectorInstance() {
    CoreLibs_SObjectInspectorFactory factory = new CoreLibs_SObjectInspectorFactory();
    System.Test.startTest();
    CoreLibs_SObjectInspector inspector = factory.create(Account.getSObjectType());
    System.Test.stopTest();
    Assert.areEqual(
      Account.getSObjectType(),
      inspector.sObjType,
      'Should create an inspector with the Account SObject type'
    );
  }

  @IsTest
  private static void create_withAccountString_returnInspectorInstance() {
    CoreLibs_SObjectInspectorFactory factory = new CoreLibs_SObjectInspectorFactory();
    System.Test.startTest();
    CoreLibs_SObjectInspector inspector = factory.create('Account');
    System.Test.stopTest();
    Assert.areEqual(
      Account.getSObjectType(),
      inspector.sObjType,
      'Should create an inspector with the Account SObject type string'
    );
  }
}
