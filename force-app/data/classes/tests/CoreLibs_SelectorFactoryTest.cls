@IsTest
private inherited sharing class CoreLibs_SelectorFactoryTest {
  @IsTest
  private static void create_validType_returnSelector() {
    CoreLibs_SelectorFactory fact = new CoreLibs_SelectorFactory();
    System.Test.startTest();
    AccountSelectorMock selectorMock = (AccountSelectorMock) fact.create(AccountSelectorMock.class);
    System.Test.stopTest();
    System.assertEquals(
      Account.getSObjectType(),
      selectorMock.getSObjectType(),
      'Should return a valid CoreLibs_BaseSelector based on type'
    );
  }

  @IsTest
  private static void create_InvalidType_throwRuntimeError() {
    CoreLibs_SelectorFactory fact = new CoreLibs_SelectorFactory();
    String errorMessage = '';
    System.Test.startTest();
    try {
      CoreLibs_BaseSelector toFail = fact.create(CoreLibs_SelectorFactory.class);
    } catch (System.TypeException e) {
      errorMessage = e.getMessage();
    }
    System.Test.stopTest();
    System.assert(errorMessage.containsIgnoreCase('Invalid conversion'));
  }

  private inherited sharing class AccountSelectorMock extends CoreLibs_BaseSelector {
    public override Schema.SObjectType getSObjectType() {
      return Account.getSObjectType();
    }
  }
}
