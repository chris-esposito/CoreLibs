@IsTest
private inherited sharing class CoreLibs_ErrorServiceTest {
  @IsTest
  private static void buildUIException_notErrorProvider_emptyErrorCode() {
    DmlException e = new DmlException('DUMMY');
    CoreLibs_ErrorService errorService = new CoreLibs_ErrorService();
    System.Test.startTest();
    AuraHandledException ex = errorService.buildUIException(e);
    System.Test.stopTest();
    Assert.isTrue(ex.getMessage().contains('"errorCode":""'), 'Should capture an empty error code');
  }

  @IsTest
  private static void buildUIException_isErrorProvider_errorCodeABC123() {
    CoreLibs_CalloutException e = new CoreLibs_CalloutException('DUMMY').setErrorCode('ABC-123');
    CoreLibs_ErrorService errorService = new CoreLibs_ErrorService();
    System.Test.startTest();
    AuraHandledException ex = errorService.buildUIException(e);
    System.Test.stopTest();
    Assert.isTrue(ex.getMessage().contains('"errorCode":"ABC-123"'), 'Should capture the error');
  }

  @IsTest
  private static void getUIErrorFromCode_errorCodeExists_returnErrorCode() {
    CoreLibs_ClassMocker selectorMocker = new CoreLibs_ClassMocker()
      .whenInvoking('setFields')
      .thenReturnInvokingObject(CoreLibs_ErrorCodeToUIMappingSelector.class)
      .whenInvoking('getByErrorCodes')
      .thenReturn(
        new List<CoreLibs_ErrorCodeToUIMessageMapping__mdt>{
          new CoreLibs_ErrorCodeToUIMessageMapping__mdt(UIMessage__c = 'Test Message')
        }
      );
    CoreLibs_ClassMocker factoryMocker = new CoreLibs_ClassMocker()
      .whenInvoking('create')
      .thenExecute(new CoreLibs_FactoryMethodMock(selectorMocker));
    CoreLibs_Factories.selector = (CoreLibs_SelectorFactory) factoryMocker.generateStub(CoreLibs_SelectorFactory.class);
    CoreLibs_ErrorService errorService = new CoreLibs_ErrorService();
    System.Test.startTest();
    String result = errorService.getUIErrorFromCode('Test');
    System.Test.stopTest();
    Assert.areEqual('Test Message', result, 'Should return ui message');
  }

  @IsTest
  private static void getUIErrorFromCode_errorCodeDoesNotExists_returnEmptyString() {
    CoreLibs_ClassMocker selectorMocker = new CoreLibs_ClassMocker()
      .whenInvoking('setFields')
      .thenReturnInvokingObject(CoreLibs_ErrorCodeToUIMappingSelector.class)
      .whenInvoking('getByErrorCodes')
      .thenReturn(new List<CoreLibs_ErrorCodeToUIMessageMapping__mdt>());
    CoreLibs_ClassMocker factoryMocker = new CoreLibs_ClassMocker()
      .whenInvoking('create')
      .thenExecute(new CoreLibs_FactoryMethodMock(selectorMocker));
    CoreLibs_Factories.selector = (CoreLibs_SelectorFactory) factoryMocker.generateStub(CoreLibs_SelectorFactory.class);
    CoreLibs_ErrorService errorService = new CoreLibs_ErrorService();
    System.Test.startTest();
    String result = errorService.getUIErrorFromCode('Test');
    System.Test.stopTest();
    Assert.areEqual('', result, 'Should return no ui message');
  }
}
