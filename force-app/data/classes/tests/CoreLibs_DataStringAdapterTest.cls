@IsTest
private inherited sharing class CoreLibs_DataStringAdapterTest {
  @IsTest
  private static void fromAccessType_creatable_returnInsertString() {
    CoreLibs_DataStringAdapter stringAdapter = new CoreLibs_DataStringAdapter();
    System.Test.startTest();
    String result = stringAdapter.fromAccessType(System.AccessType.CREATABLE);
    System.Test.stopTest();
    Assert.areEqual(CoreLibs_DataStringAdapter.INSERT_STRING, result, 'Should return the insert string');
  }

  @IsTest
  private static void fromAccessType_readable_returnReadString() {
    CoreLibs_DataStringAdapter stringAdapter = new CoreLibs_DataStringAdapter();
    System.Test.startTest();
    String result = stringAdapter.fromAccessType(System.AccessType.READABLE);
    System.Test.stopTest();
    Assert.areEqual(CoreLibs_DataStringAdapter.READ_STRING, result, 'Should return the read string');
  }

  @IsTest
  private static void fromAccessType_updatable_returnUpdateString() {
    CoreLibs_DataStringAdapter stringAdapter = new CoreLibs_DataStringAdapter();
    System.Test.startTest();
    String result = stringAdapter.fromAccessType(System.AccessType.UPDATABLE);
    System.Test.stopTest();
    Assert.areEqual(CoreLibs_DataStringAdapter.UPDATE_STRING, result, 'Should return the update string');
  }

  @IsTest
  private static void fromAccessType_upsertable_returnUpsertString() {
    CoreLibs_DataStringAdapter stringAdapter = new CoreLibs_DataStringAdapter();
    System.Test.startTest();
    String result = stringAdapter.fromAccessType(System.AccessType.UPSERTABLE);
    System.Test.stopTest();
    Assert.areEqual(CoreLibs_DataStringAdapter.UPSERT_STRING, result, 'Should return the upsert string');
  }

  @IsTest
  private static void fromAccessType_null_returnEmptyString() {
    CoreLibs_DataStringAdapter stringAdapter = new CoreLibs_DataStringAdapter();
    System.Test.startTest();
    String result = stringAdapter.fromAccessType(null);
    System.Test.stopTest();
    Assert.areEqual('', result, 'Should return an empty string');
  }

  @IsTest
  private static void fromDatabaseOperation_insert_returnInsertString() {
    CoreLibs_DataStringAdapter stringAdapter = new CoreLibs_DataStringAdapter();
    System.Test.startTest();
    String result = stringAdapter.fromDatabaseOperation(CoreLibs_DatabaseOperation.DML_INSERT);
    System.Test.stopTest();
    Assert.areEqual(CoreLibs_DataStringAdapter.INSERT_STRING, result, 'Should return the insert string');
  }

  @IsTest
  private static void fromDatabaseOperation_update_returnUpdateString() {
    CoreLibs_DataStringAdapter stringAdapter = new CoreLibs_DataStringAdapter();
    System.Test.startTest();
    String result = stringAdapter.fromDatabaseOperation(CoreLibs_DatabaseOperation.DML_UPDATE);
    System.Test.stopTest();
    Assert.areEqual(CoreLibs_DataStringAdapter.UPDATE_STRING, result, 'Should return the update string');
  }

  @IsTest
  private static void fromDatabaseOperation_upsert_returnUpsertString() {
    CoreLibs_DataStringAdapter stringAdapter = new CoreLibs_DataStringAdapter();
    System.Test.startTest();
    String result = stringAdapter.fromDatabaseOperation(CoreLibs_DatabaseOperation.DML_UPSERT);
    System.Test.stopTest();
    Assert.areEqual(CoreLibs_DataStringAdapter.UPSERT_STRING, result, 'Should return the upsert string');
  }

  @IsTest
  private static void fromDatabaseOperation_delete_returnDeleteString() {
    CoreLibs_DataStringAdapter stringAdapter = new CoreLibs_DataStringAdapter();
    System.Test.startTest();
    String result = stringAdapter.fromDatabaseOperation(CoreLibs_DatabaseOperation.DML_DELETE);
    System.Test.stopTest();
    Assert.areEqual(CoreLibs_DataStringAdapter.DELETE_STRING, result, 'Should return the delete string');
  }

  @IsTest
  private static void fromDatabaseOperation_undelete_returnUndeleteString() {
    CoreLibs_DataStringAdapter stringAdapter = new CoreLibs_DataStringAdapter();
    System.Test.startTest();
    String result = stringAdapter.fromDatabaseOperation(CoreLibs_DatabaseOperation.DML_UNDELETE);
    System.Test.stopTest();
    Assert.areEqual(CoreLibs_DataStringAdapter.UNDELETE_STRING, result, 'Should return the undelete string');
  }

  @IsTest
  private static void fromDatabaseOperation_null_returnEmptyString() {
    CoreLibs_DataStringAdapter stringAdapter = new CoreLibs_DataStringAdapter();
    System.Test.startTest();
    String result = stringAdapter.fromDatabaseOperation(null);
    System.Test.stopTest();
    Assert.areEqual('', result, 'Should return an empty string');
  }
}
