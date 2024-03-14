@IsTest
private inherited sharing class CoreLibs_DatabaseConnectionTest {
  @IsTest
  private static void insertRecords_noOptions_recordInserted() {
    Account testObj = new Account(Name = 'Test');
    CoreLibs_DatabaseConnection conn = new CoreLibs_DatabaseConnection();
    System.Test.startTest();
    List<Database.SaveResult> results = conn.insertRecords(new List<SObject>{ testObj }, null);
    System.Test.stopTest();
    Assert.areEqual(1, results.size(), 'Should return the 1 save result');
    List<Account> resultingRecords = [SELECT Id FROM Account];
    Assert.areEqual(1, resultingRecords.size(), 'Should only create 1 record');
    Assert.areEqual(resultingRecords[0].Id, results[0].getId(), 'Id of records should match');
  }

  @IsTest
  private static void insertRecords_withOptions_recordInserted() {
    Account testObj = new Account(Name = 'Test');
    CoreLibs_DatabaseConnection conn = new CoreLibs_DatabaseConnection();
    Database.DMLOptions options = new Database.DMLOptions();
    options.OptAllOrNone = true;
    System.Test.startTest();
    List<Database.SaveResult> results = conn.insertRecords(new List<SObject>{ testObj }, options);
    System.Test.stopTest();
    Assert.areEqual(1, results.size(), 'Should return the 1 save result');
    List<Account> resultingRecords = [SELECT Id FROM Account];
    Assert.areEqual(1, resultingRecords.size(), 'Should only create 1 record');
    Assert.areEqual(resultingRecords[0].Id, results[0].getId(), 'Id of records should match');
  }

  @IsTest
  private static void updateRecords_noOptions_recordInserted() {
    Account testObj = new Account(Name = 'Test');
    insert testObj;
    testObj.Name = 'abc';
    CoreLibs_DatabaseConnection conn = new CoreLibs_DatabaseConnection();
    System.Test.startTest();
    List<Database.SaveResult> results = conn.updateRecords(new List<SObject>{ testObj }, null);
    System.Test.stopTest();
    Assert.areEqual(1, results.size(), 'Should return the 1 save result');
    List<Account> resultingRecords = [SELECT Id, Name FROM Account];
    Assert.areEqual(1, resultingRecords.size(), 'Should only create 1 record');
    Assert.areEqual(resultingRecords[0].Id, results[0].getId(), 'Id of records should match');
    Assert.areEqual('abc', resultingRecords[0].Name, 'Should update the record');
  }

  @IsTest
  private static void updateRecords_withOptions_recordInserted() {
    Account testObj = new Account(Name = 'Test');
    insert testObj;
    testObj.Name = 'abc';
    CoreLibs_DatabaseConnection conn = new CoreLibs_DatabaseConnection();
    Database.DMLOptions options = new Database.DMLOptions();
    options.OptAllOrNone = true;
    System.Test.startTest();
    List<Database.SaveResult> results = conn.updateRecords(new List<SObject>{ testObj }, options);
    System.Test.stopTest();
    Assert.areEqual(1, results.size(), 'Should return the 1 save result');
    List<Account> resultingRecords = [SELECT Id, Name FROM Account];
    Assert.areEqual(1, resultingRecords.size(), 'Should only create 1 record');
    Assert.areEqual(resultingRecords[0].Id, results[0].getId(), 'Id of records should match');
    Assert.areEqual('abc', resultingRecords[0].Name, 'Should update the record');
  }

  @IsTest
  private static void upsertRecords_recordDoesntExist_recordInserted() {
    Account testObj = new Account(Name = 'Test');
    CoreLibs_DatabaseConnection conn = new CoreLibs_DatabaseConnection();
    System.Test.startTest();
    List<Database.UpsertResult> results = conn.upsertRecords(new List<SObject>{ testObj }, true);
    System.Test.stopTest();
    Assert.areEqual(1, results.size(), 'Should return the 1 save result');
    List<Account> resultingRecords = [SELECT Id FROM Account];
    Assert.areEqual(1, resultingRecords.size(), 'Should only create 1 record');
    Assert.areEqual(resultingRecords[0].Id, results[0].getId(), 'Id of records should match');
  }

  @IsTest
  private static void upsertRecords_recordExists_recordUpdated() {
    Account testObj = new Account(Name = 'Test');
    insert testObj;
    testObj.Name = 'abc';
    CoreLibs_DatabaseConnection conn = new CoreLibs_DatabaseConnection();
    System.Test.startTest();
    List<Database.UpsertResult> results = conn.upsertRecords(new List<SObject>{ testObj }, true);
    System.Test.stopTest();
    Assert.areEqual(1, results.size(), 'Should return the 1 save result');
    List<Account> resultingRecords = [SELECT Id, Name FROM Account];
    Assert.areEqual(1, resultingRecords.size(), 'Should only create 1 record');
    Assert.areEqual(resultingRecords[0].Id, results[0].getId(), 'Id of records should match');
    Assert.areEqual('abc', resultingRecords[0].Name, 'Should update the record');
  }

  @IsTest
  private static void deleteRecords_record_recordDeleted() {
    Account testObj = new Account(Name = 'Test');
    insert testObj;
    CoreLibs_DatabaseConnection conn = new CoreLibs_DatabaseConnection();
    System.Test.startTest();
    List<Database.DeleteResult> results = conn.deleteRecords(new List<SObject>{ testObj }, true);
    System.Test.stopTest();
    Assert.areEqual(1, results.size(), 'Should return the 1 save result');
    List<Account> resultingRecords = [SELECT Id, Name FROM Account];
    Assert.areEqual(0, resultingRecords.size(), 'Should delete the record');
  }

  @IsTest
  private static void deleteRecords_id_recordDeleted() {
    Account testObj = new Account(Name = 'Test');
    insert testObj;
    CoreLibs_DatabaseConnection conn = new CoreLibs_DatabaseConnection();
    System.Test.startTest();
    List<Database.DeleteResult> results = conn.deleteRecords(new List<Id>{ testObj.Id }, true);
    System.Test.stopTest();
    Assert.areEqual(1, results.size(), 'Should return the 1 save result');
    List<Account> resultingRecords = [SELECT Id, Name FROM Account];
    Assert.areEqual(0, resultingRecords.size(), 'Should delete the record');
  }

  @IsTest
  private static void undeleteRecords_record_recordUndeleted() {
    Account testObj = new Account(Name = 'Test');
    insert testObj;
    delete testObj;
    CoreLibs_DatabaseConnection conn = new CoreLibs_DatabaseConnection();
    System.Test.startTest();
    List<Database.UndeleteResult> results = conn.undeleteRecords(new List<SObject>{ testObj }, true);
    System.Test.stopTest();
    Assert.areEqual(1, results.size(), 'Should return the 1 save result');
    List<Account> resultingRecords = [SELECT Id, Name FROM Account];
    Assert.areEqual(1, resultingRecords.size(), 'Should undelete the record');
  }

  @IsTest
  private static void undeleteRecords_id_recordUndeleted() {
    Account testObj = new Account(Name = 'Test');
    insert testObj;
    delete testObj;
    CoreLibs_DatabaseConnection conn = new CoreLibs_DatabaseConnection();
    System.Test.startTest();
    List<Database.UndeleteResult> results = conn.undeleteRecords(new List<Id>{ testObj.Id }, true);
    System.Test.stopTest();
    Assert.areEqual(1, results.size(), 'Should return the 1 save result');
    List<Account> resultingRecords = [SELECT Id, Name FROM Account];
    Assert.areEqual(1, resultingRecords.size(), 'Should undelete the record');
  }
}
