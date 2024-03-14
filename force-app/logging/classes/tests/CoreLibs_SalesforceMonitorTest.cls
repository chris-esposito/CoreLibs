@IsTest
private inherited sharing class CoreLibs_SalesforceMonitorTest {
  @IsTest
  private static void execute_noRules_doNothing() {
    CoreLibs_SalesforceMonitor monitor = new CoreLibs_SalesforceMonitor();
    monitor.rules = new List<CoreLibs_MonitoringRule__c>();
    System.Test.startTest();
    monitor.execute(null);
    System.Test.stopTest();
    Assert.areEqual(0, monitor.index, 'Should not execute');
  }

  // TODO REINTRODUCE ONCE MOCKING LIBRARY IS FINISHED
  @IsTest
  private static void execute_1Rule_noChain() {
    /*Salesforce_Monitoring_Rule__c mockedRule = new Salesforce_Monitoring_Rule__c(Custom_Class__c = 'MockRuleProcessor');
    Formula.recalculateFormulas(new List<Salesforce_Monitoring_Rule__c>{ mockedRule });
    ClassMocker inspectorMock = new ClassMocker()
      .whenInvoking('getAllFields')
      .thenReturn(new List<Schema.SObjectField>{ Salesforce_Monitoring_Rule__c.Id });
    ClassMocker mocker = new ClassMocker()
      .whenInvoking('createSObjectInspector')
      .fromClass(MetadataInspectorFactory.class)
      .thenReturn((SObjectInspector) System.Test.createStub(SObjectInspector.class, inspectorMock))
      .whenInvoking('setFields')
      .fromClass(SalesforceMonitoringRuleSelector.class)
      .thenReturnInvokingObject(SalesforceMonitoringRuleSelector.class)
      .whenInvoking('getActiveRules')
      .fromClass(SalesforceMonitoringRuleSelector.class)
      .thenReturn(new List<Salesforce_Monitoring_Rule__c>{ mockedRule })
      .whenInvoking('setFields')
      .fromClass(AsyncApexJobSelector.class)
      .thenReturnInvokingObject(AsyncApexJobSelector.class)
      .whenInvoking('getLastCompletedJob')
      .fromClass(AsyncApexJobSelector.class)
      .thenReturn(null);
    ClassMocker factoryMocker = new ClassMocker()
      .whenInvoking('create')
      .thenExecute(new SelectorFactoryMethodMock(mocker));
    CoreLibs_SalesforceMonitor monitor = new CoreLibs_SalesforceMonitor();
    monitor.inspectorFactory = (MetadataInspectorFactory) System.Test.createStub(
      MetadataInspectorFactory.class,
      mocker
    );
    monitor.dataFactory = (SelectorFactory) System.Test.createStub(SelectorFactory.class, factoryMocker);
    System.Test.startTest();
    monitor.execute(null);
    System.Test.stopTest();
    Assert.areEqual(1, monitor.index, 'Should execute 1 job');*/
  }

  @IsTest
  private static void execute_2Rules_chain() {
    /*Salesforce_Monitoring_Rule__c mockedRule1 = new Salesforce_Monitoring_Rule__c(
      Custom_Class__c = 'MockRuleProcessor'
    );
    Salesforce_Monitoring_Rule__c mockedRule2 = new Salesforce_Monitoring_Rule__c(
      Custom_Class__c = 'MockRuleProcessor'
    );
    Formula.recalculateFormulas(new List<Salesforce_Monitoring_Rule__c>{ mockedRule1, mockedRule2 });
    ClassMocker inspectorMock = new ClassMocker()
      .whenInvoking('getAllFields')
      .thenReturn(new List<Schema.SObjectField>{ Salesforce_Monitoring_Rule__c.Id });
    ClassMocker mocker = new ClassMocker()
      .whenInvoking('createSObjectInspector')
      .fromClass(MetadataInspectorFactory.class)
      .thenReturn((SObjectInspector) System.Test.createStub(SObjectInspector.class, inspectorMock))
      .whenInvoking('setFields')
      .fromClass(SalesforceMonitoringRuleSelector.class)
      .thenReturnInvokingObject(SalesforceMonitoringRuleSelector.class)
      .whenInvoking('getActiveRules')
      .fromClass(SalesforceMonitoringRuleSelector.class)
      .thenReturn(new List<Salesforce_Monitoring_Rule__c>{ mockedRule1, mockedRule2 });
    ClassMocker factoryMocker = new ClassMocker()
      .whenInvoking('create')
      .thenExecute(new SelectorFactoryMethodMock(mocker));
    CoreLibs_SalesforceMonitor monitor = new CoreLibs_SalesforceMonitor();
    monitor.inspectorFactory = (MetadataInspectorFactory) System.Test.createStub(
      MetadataInspectorFactory.class,
      mocker
    );
    monitor.dataFactory = (SelectorFactory) System.Test.createStub(SelectorFactory.class, factoryMocker);
    System.Test.startTest();
    monitor.execute(null);
    System.Test.stopTest();
    Assert.areEqual(1, [SELECT Id FROM AsyncApexJob].size(), 'Should queue up 1 job');*/
  }
}
