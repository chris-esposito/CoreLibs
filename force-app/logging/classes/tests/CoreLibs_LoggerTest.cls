@IsTest
private inherited sharing class CoreLibs_LoggerTest {
  @IsTest
  private static void info_simpleInput_createLogRecord() {
    CoreLibs_Logger logger = new CoreLibs_Logger();
    System.Test.startTest();
    logger.info('TEST LOG INFO', 'Hello World');
    System.Test.stopTest();
    CoreLibs_Log__c log = [SELECT Label__c, Type__c, Details__c FROM CoreLibs_Log__c];
    Assert.areEqual('TEST LOG INFO', log.Label__c, 'Should set label');
    Assert.areEqual('INFO', log.Type__c, 'Should set type');
    Assert.areEqual('"Hello World"', log.Details__c, 'Should set details');
  }

  @IsTest
  private static void warn_simpleInput_createLogRecord() {
    CoreLibs_Logger logger = new CoreLibs_Logger();
    System.Test.startTest();
    logger.warn('TEST LOG INFO', 'Hello World');
    System.Test.stopTest();
    CoreLibs_Log__c log = [SELECT Label__c, Type__c, Details__c FROM CoreLibs_Log__c];
    Assert.areEqual('TEST LOG INFO', log.Label__c, 'Should set label');
    Assert.areEqual('WARN', log.Type__c, 'Should set type');
    Assert.areEqual('"Hello World"', log.Details__c, 'Should set details');
  }

  @IsTest
  private static void error_simpleInput_createLogRecord() {
    CoreLibs_Logger logger = new CoreLibs_Logger();
    System.Test.startTest();
    logger.error('TEST LOG INFO', 'Hello World');
    System.Test.stopTest();
    CoreLibs_Log__c log = [SELECT Label__c, Type__c, Details__c FROM CoreLibs_Log__c];
    Assert.areEqual('TEST LOG INFO', log.Label__c, 'Should set label');
    Assert.areEqual('ERROR', log.Type__c, 'Should set type');
    Assert.areEqual('"Hello World"', log.Details__c, 'Should set details');
  }

  @IsTest
  private static void error_exceptionNoAdditionalDetails_createLogRecord() {
    CoreLibs_Logger logger = new CoreLibs_Logger();
    System.Test.startTest();
    logger.error('TEST LOG INFO', new DmlException('DUMMY EXCEPTION'));
    System.Test.stopTest();
    CoreLibs_Log__c log = [SELECT Label__c, Type__c, Details__c FROM CoreLibs_Log__c];
    Assert.areEqual('TEST LOG INFO', log.Label__c, 'Should set label');
    Assert.areEqual('ERROR', log.Type__c, 'Should set type');
    Assert.isTrue(log.Details__c.contains('"error"'), 'Should set error in details');
    Assert.isFalse(log.Details__c.contains('"additionalDetails"'), 'Should not set additionalDetails in details');
  }

  @IsTest
  private static void error_exceptionWithAdditionalDetails_createLogRecord() {
    CoreLibs_Logger logger = new CoreLibs_Logger();
    System.Test.startTest();
    logger.error('TEST LOG INFO', new DmlException('DUMMY EXCEPTION'), 'Hello World');
    System.Test.stopTest();
    CoreLibs_Log__c log = [SELECT Label__c, Type__c, Details__c FROM CoreLibs_Log__c];
    Assert.areEqual('TEST LOG INFO', log.Label__c, 'Should set label');
    Assert.areEqual('ERROR', log.Type__c, 'Should set type');
    Assert.isTrue(log.Details__c.contains('"error"'), 'Should set error in details');
    Assert.isTrue(log.Details__c.contains('"additionalDetails"'), 'Should set additionalDetails in details');
  }
}
