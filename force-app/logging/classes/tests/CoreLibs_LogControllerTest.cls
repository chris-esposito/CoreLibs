@IsTest
private inherited sharing class CoreLibs_LogControllerTest {
  @IsTest
  private static void getLogDetails_mockedSelector_returnDetails() {
    mockSelectors();
    CoreLibs_SObjectMocker logMocker = new CoreLibs_SObjectMocker(CoreLibs_Log__c.getSObjectType());
    System.Test.startTest();
    String result = CoreLibs_LogController.getLogDetails(logMocker.generateMockId());
    System.Test.stopTest();
    Assert.areEqual('test', result, 'Should return log details');
  }

  @IsTest
  private static void getLogs_allInputs_inputsProcessedCorrectly() {
    CoreLibs_ClassMocker mocker = mockSelectors();
    CoreLibs_LogController.GetLogsInput input = new CoreLibs_LogController.GetLogsInput();
    input.transactionId = '123';
    input.runningUserId = UserInfo.getUserId();
    input.runningUserSessionId = 'cake';
    input.type = 'INFO';
    input.startTime = '2020-01-01T00:00:000z';
    input.endTime = '2020-01-01T00:00:000z';
    System.Test.startTest();
    List<CoreLibs_Log__c> results = CoreLibs_LogController.getLogs(input);
    System.Test.stopTest();
    List<String> args = new List<String>{
      'TransactionId__c = \'123\'',
      'RunningUser__c = \'' +
      UserInfo.getUserId() +
      '\'',
      'SessionId__c = \'cake\'',
      'LogCreationTimestamp__c >= 2020-01-01T00:00:000z',
      'LogCreationTimestamp__c <= 2020-01-01T00:00:000z',
      'Type__c = \'INFO\''
    };
    mocker.expectMethod('getByFilters').withArgs(new List<Object>{ args }).toHaveBeenCalled(1);
  }

  @IsTest
  private static void getLogCleanupSettings_mockedJob_returnSettings() {
    mockSelectors();
    System.Test.startTest();
    CoreLibs_LogController.GetLogCleanupSettingsOutput results = CoreLibs_LogController.getLogCleanupSettings();
    System.Test.stopTest();
    Assert.areEqual('Completed', results.lastRunStatus, 'Should appropriately set the status from the job');
  }

  // cant mock logger services because it accepts an exception as an arg
  // and Apex is a trash language

  @IsTest
  private static void saveRetainLogsForSetting_mockedService_confirmServiceCalled() {
    System.Test.startTest();
    CoreLibs_LogController.saveRetainLogsForSetting(7);
    System.Test.stopTest();
    CoreLibs_LogCleanupSettings__c settings = CoreLibs_LogCleanupSettings__c.getOrgDefaults();
    Assert.areEqual(7, settings.RetainLogsFor__c, 'Should set log retention');
  }

  @IsTest
  private static void scheduleLogCleanupJob_mockedService_confirmServiceCalled() {
    System.Test.startTest();
    CoreLibs_LogController.scheduleLogCleanupJob(7);
    System.Test.stopTest();
    CoreLibs_LogCleanupSettings__c settings = CoreLibs_LogCleanupSettings__c.getOrgDefaults();
    Assert.areEqual(7, settings.ScheduledTime__c, 'Should set scheduled time');
  }

  private static CoreLibs_ClassMocker mockSelectors() {
    CoreLibs_ClassMocker selectorMocker = new CoreLibs_ClassMocker()
      .whenInvoking('setFields')
      .fromClass(CoreLibs_LogSelector.class)
      .thenReturnInvokingObject(CoreLibs_LogSelector.class)
      .whenInvoking('setFields')
      .fromClass(CoreLibs_AsyncApexJobSelector.class)
      .thenReturnInvokingObject(CoreLibs_AsyncApexJobSelector.class)
      .whenInvoking('setOrderBy')
      .thenReturnInvokingObject(CoreLibs_LogSelector.class)
      .whenInvoking('setLimit')
      .thenReturnInvokingObject(CoreLibs_LogSelector.class)
      .whenInvoking('getById')
      .thenReturn(new List<SObject>{ new CoreLibs_Log__c(Details__c = 'test') })
      .whenInvoking('getByFilters')
      .thenReturn(new List<SObject>{ new CoreLibs_Log__c() })
      .whenInvoking('getLastCompletedJob')
      .thenReturn((AsyncApexJob) JSON.deserialize('{"Status":"Completed"}', AsyncApexJob.class));
    CoreLibs_ClassMocker factoryMocker = new CoreLibs_ClassMocker()
      .whenInvoking('create')
      .thenExecute(new CoreLibs_FactoryMethodMock(selectorMocker));
    CoreLibs_Factories.selector = (CoreLibs_SelectorFactory) factoryMocker.generateStub(CoreLibs_SelectorFactory.class);
    return selectorMocker;
  }
}
