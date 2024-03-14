@IsTest
private inherited sharing class CoreLibs_DataExceptionsTest {
  @IsTest
  private static void flsExceptionGetMessage_fromAccessType_returnViolations() {
    CoreLibs_DataExceptions.FlsException ex = new CoreLibs_DataExceptions.FlsException(
      System.AccessType.READABLE,
      new List<String>{ 'Contact ' }
    );
    System.Test.startTest();
    String result = ex.getMessage();
    System.Test.stopTest();
    Assert.isTrue(result.contains('Insufficient Read access to: Contact'), 'Should return correct violation string');
  }

  @IsTest
  private static void flsExceptionGetMessage_fromDatabaseOperation_returnViolations() {
    CoreLibs_DataExceptions.FlsException ex = new CoreLibs_DataExceptions.FlsException(
      CoreLibs_DatabaseOperation.DML_INSERT,
      new List<String>{ 'Contact ' }
    );
    System.Test.startTest();
    String result = ex.getMessage();
    System.Test.stopTest();
    Assert.isTrue(result.contains('Insufficient Insert access to: Contact'), 'Should return correct violation string');
  }
}
