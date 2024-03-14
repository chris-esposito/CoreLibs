@IsTest
private inherited sharing class CoreLibs_LightningLoggerTest {
  @IsTest
  private static void info_simpleInput_createLogRecord() {
    System.Test.startTest();
    CoreLibs_LightningLogger.info('TEST LOG INFO', new Map<String, Object>{ 'message' => 'Hello World' });
    System.Test.stopTest();
    CoreLibs_Log__c log = [SELECT Label__c, Type__c, Details__c FROM CoreLibs_Log__c];
    Assert.areEqual('TEST LOG INFO', log.Label__c, 'Should set label');
    Assert.areEqual('INFO', log.Type__c, 'Should set type');
    Assert.isTrue(log.Details__c.contains('"Hello World"'), 'Should set details');
  }

  @IsTest
  private static void warn_simpleInput_createLogRecord() {
    System.Test.startTest();
    CoreLibs_LightningLogger.warn('TEST LOG WARN', new Map<String, Object>{ 'message' => 'Hello World' });
    System.Test.stopTest();
    CoreLibs_Log__c log = [SELECT Label__c, Type__c, Details__c FROM CoreLibs_Log__c];
    Assert.areEqual('TEST LOG WARN', log.Label__c, 'Should set label');
    Assert.areEqual('WARN', log.Type__c, 'Should set type');
    Assert.isTrue(log.Details__c.contains('"Hello World"'), 'Should set details');
  }

  @IsTest
  private static void error_simpleInput_createLogRecord() {
    System.Test.startTest();
    CoreLibs_LightningLogger.error('TEST LOG ERROR', new Map<String, Object>{ 'message' => 'Hello World' });
    System.Test.stopTest();
    CoreLibs_Log__c log = [SELECT Label__c, Type__c, Details__c FROM CoreLibs_Log__c];
    Assert.areEqual('TEST LOG ERROR', log.Label__c, 'Should set label');
    Assert.areEqual('ERROR', log.Type__c, 'Should set type');
    Assert.isTrue(log.Details__c.contains('"Hello World"'), 'Should set details');
  }
}
