@IsTest
private inherited sharing class CoreLibs_DmlTest {
  private static final String TEST_ACCOUNT_NAME_1 = 'Test Account 1';
  private static final String TEST_ACCOUNT_NAME_2 = 'Test Account 2';
  private static final String TEST_CONTACT_FNAME_1 = 'Test 1';
  private static final String TEST_CONTACT_FNAME_2 = 'Test 2';
  private static final String TEST_CONTACT_LNAME = 'Tester';
  private static final String TEST_UPDATES_FNAME = 'Not Test';

  private static final String DUMMY_ACCOUNT_ID = new CoreLibs_SObjectMocker(Account.getSObjectType(), null)
    .generateMockId();

  @TestSetup
  static void makeData() {
    insert new List<Contact>{
      new Contact(FirstName = TEST_CONTACT_FNAME_1, LastName = TEST_CONTACT_LNAME),
      new Contact(FirstName = TEST_CONTACT_FNAME_2, LastName = TEST_CONTACT_LNAME)
    };
  }

  @IsTest
  private static void insertRecord_newAccount_recordInserted() {
    CoreLibs_Dml CoreLibs_Dml = new CoreLibs_Dml(new CoreLibs_DatabaseConnection());
    System.Test.startTest();
    Account a = new Account(Name = TEST_ACCOUNT_NAME_1);
    CoreLibs_Dml.insertRecord(a);
    System.Test.stopTest();
    List<Account> accts = [SELECT Name FROM Account];
    Assert.areEqual(1, accts.size(), 'Should only be one inserted account');
    Assert.areEqual(TEST_ACCOUNT_NAME_1, accts[0].Name, 'Should be inserted with the correct name');
  }

  @IsTest
  private static void insertRecords_newAccounts_recordsInserted() {
    CoreLibs_Dml CoreLibs_Dml = new CoreLibs_Dml(new CoreLibs_DatabaseConnection());
    System.Test.startTest();
    CoreLibs_Dml.insertRecords(
      new List<Account>{ new Account(Name = TEST_ACCOUNT_NAME_1), new Account(Name = TEST_ACCOUNT_NAME_2) }
    );
    System.Test.stopTest();
    List<Account> accts = [SELECT Name FROM Account];
    Assert.areEqual(2, accts.size(), 'Should insert both accounts');
    Assert.areEqual(TEST_ACCOUNT_NAME_1, accts[0].Name, 'Should be inserted with the correct name');
    Assert.areEqual(TEST_ACCOUNT_NAME_2, accts[1].Name, 'Should be inserted with the correct name');
  }

  @IsTest
  private static void insertRecord_newAccountWithOptions_recordInserted() {
    CoreLibs_Dml CoreLibs_Dml = new CoreLibs_Dml(new CoreLibs_DatabaseConnection());
    System.Test.startTest();
    CoreLibs_Dml.insertRecord(new Account(Name = TEST_ACCOUNT_NAME_1), new Database.DMLOptions());
    System.Test.stopTest();
    List<Account> accts = [SELECT Name FROM Account];
    Assert.areEqual(1, accts.size(), 'Should only be one inserted account');
    Assert.areEqual(TEST_ACCOUNT_NAME_1, accts[0].Name, 'Should be inserted with the correct name');
  }

  @IsTest
  private static void insertRecords_newAccountsWithOptions_recordsInserted() {
    CoreLibs_Dml CoreLibs_Dml = new CoreLibs_Dml(new CoreLibs_DatabaseConnection());
    System.Test.startTest();
    CoreLibs_Dml.insertRecords(
      new List<Account>{ new Account(Name = TEST_ACCOUNT_NAME_1), new Account(Id = DUMMY_ACCOUNT_ID) },
      new Database.DMLOptions() // defaults to all or none false
    );
    System.Test.stopTest();
    List<Account> accts = [SELECT Name FROM Account];
    Assert.areEqual(1, accts.size(), 'Should insert both accounts');
    Assert.areEqual(TEST_ACCOUNT_NAME_1, accts[0].Name, 'Should be inserted with the correct name');
  }

  @IsTest
  private static void updateRecord_existingContact_recordUpdated() {
    CoreLibs_Dml CoreLibs_Dml = new CoreLibs_Dml(new CoreLibs_DatabaseConnection());
    Contact toUpdate = [SELECT FirstName FROM Contact LIMIT 1];
    toUpdate.FirstName = TEST_UPDATES_FNAME;
    System.Test.startTest();
    CoreLibs_Dml.updateRecord(toUpdate);
    System.Test.stopTest();
    List<Contact> contacts = [
      SELECT Id
      FROM Contact
      WHERE FirstName = :TEST_UPDATES_FNAME
    ];
    Assert.areEqual(1, contacts.size(), 'Should only be one updated contact');
  }

  @IsTest
  private static void updateRecords_existingContacts_contactsUpdated() {
    CoreLibs_Dml CoreLibs_Dml = new CoreLibs_Dml(new CoreLibs_DatabaseConnection());
    List<Contact> toUpdate = [SELECT FirstName FROM Contact];
    for (Contact con : toUpdate) {
      con.FirstName = TEST_UPDATES_FNAME;
    }
    System.Test.startTest();
    CoreLibs_Dml.updateRecords(toUpdate);
    System.Test.stopTest();
    List<Contact> contacts = [
      SELECT Id
      FROM Contact
      WHERE FirstName = :TEST_UPDATES_FNAME
    ];
    Assert.areEqual(2, contacts.size(), 'Both contacts should be updated');
  }

  @IsTest
  private static void updateRecord_existingContactWithOptions_recordUpdated() {
    CoreLibs_Dml CoreLibs_Dml = new CoreLibs_Dml(new CoreLibs_DatabaseConnection());
    Contact toUpdate = [SELECT FirstName FROM Contact LIMIT 1];
    toUpdate.FirstName = TEST_UPDATES_FNAME;
    System.Test.startTest();
    CoreLibs_Dml.updateRecord(toUpdate, new Database.DMLOptions());
    System.Test.stopTest();
    List<Contact> contacts = [
      SELECT Id
      FROM Contact
      WHERE FirstName = :TEST_UPDATES_FNAME
    ];
    Assert.areEqual(1, contacts.size(), 'Should only be one updated contact');
  }

  @IsTest
  private static void updateRecords_oneExistingOneInvalidWithOptions_recordsUpdated() {
    CoreLibs_Dml CoreLibs_Dml = new CoreLibs_Dml(new CoreLibs_DatabaseConnection());
    List<Contact> toUpdate = [SELECT FirstName FROM Contact LIMIT 1];
    toUpdate.add(new Contact(FirstName = 'Does not matter'));
    for (Contact con : toUpdate) {
      con.FirstName = TEST_UPDATES_FNAME;
    }
    System.Test.startTest();
    CoreLibs_Dml.updateRecords(toUpdate, new Database.DMLOptions());
    System.Test.stopTest();
    List<Contact> contacts = [
      SELECT Id
      FROM Contact
      WHERE FirstName = :TEST_UPDATES_FNAME
    ];
    Assert.areEqual(1, contacts.size(), 'Both contacts should be updated');
  }

  @IsTest
  private static void upsertRecord_newAccount_recordInserted() {
    CoreLibs_Dml CoreLibs_Dml = new CoreLibs_Dml(new CoreLibs_DatabaseConnection());
    System.Test.startTest();
    CoreLibs_Dml.upsertRecord(new Account(Name = TEST_ACCOUNT_NAME_1));
    System.Test.stopTest();
    List<Account> accts = [SELECT Name FROM Account];
    Assert.areEqual(1, accts.size(), 'Should only be one inserted account');
    Assert.areEqual(TEST_ACCOUNT_NAME_1, accts[0].Name, 'Should be inserted with the correct name');
  }

  @IsTest
  private static void upsertRecord_existingContact_recordUpdated() {
    CoreLibs_Dml CoreLibs_Dml = new CoreLibs_Dml(new CoreLibs_DatabaseConnection());
    Contact toUpdate = [SELECT FirstName FROM Contact LIMIT 1];
    toUpdate.FirstName = TEST_UPDATES_FNAME;
    System.Test.startTest();
    CoreLibs_Dml.upsertRecord(toUpdate);
    System.Test.stopTest();
    List<Contact> contacts = [
      SELECT Id
      FROM Contact
      WHERE FirstName = :TEST_UPDATES_FNAME
    ];
    Assert.areEqual(1, contacts.size(), 'Should only be one updated contact');
  }

  @IsTest
  private static void upsertRecords_newAccountExistingContact_recordsUpserted() {
    CoreLibs_Dml CoreLibs_Dml = new CoreLibs_Dml(new CoreLibs_DatabaseConnection());
    Contact con = [SELECT FirstName FROM Contact LIMIT 1];
    con.FirstName = TEST_UPDATES_FNAME;
    System.Test.startTest();
    CoreLibs_Dml.upsertRecords(new List<SObject>{ new Account(Name = TEST_ACCOUNT_NAME_1), con });
    System.Test.stopTest();
    List<Account> accts = [SELECT Name FROM Account];
    Assert.areEqual(1, accts.size(), 'Should insert the account');
    Assert.areEqual(TEST_ACCOUNT_NAME_1, accts[0].Name, 'Should be inserted with the correct name');
    List<Contact> contacts = [
      SELECT Id
      FROM Contact
      WHERE FirstName = :TEST_UPDATES_FNAME
    ];
    Assert.areEqual(1, contacts.size(), 'Should only be one updated contact');
  }

  @IsTest
  private static void upsertRecords_newAccountsExistingContactNotAllOrNone_recordsUpserted() {
    CoreLibs_Dml CoreLibs_Dml = new CoreLibs_Dml(new CoreLibs_DatabaseConnection());
    Contact con = [SELECT FirstName FROM Contact LIMIT 1];
    con.FirstName = TEST_UPDATES_FNAME;
    System.Test.startTest();
    CoreLibs_Dml.upsertRecords(
      new List<SObject>{ new Account(Name = TEST_ACCOUNT_NAME_1), new Account(Id = DUMMY_ACCOUNT_ID), con },
      false
    );
    System.Test.stopTest();
    List<Account> accts = [SELECT Name FROM Account];
    Assert.areEqual(1, accts.size(), 'Should insert 1 account');
    Assert.areEqual(TEST_ACCOUNT_NAME_1, accts[0].Name, 'Should be inserted with the correct name');
    List<Contact> contacts = [
      SELECT Id
      FROM Contact
      WHERE FirstName = :TEST_UPDATES_FNAME
    ];
    Assert.areEqual(1, contacts.size(), 'Should only be one updated contact');
  }
  @IsTest
  private static void upsertRecords_newAccountsExistingContactAllOrNone_recordsNotUpserted() {
    CoreLibs_Dml CoreLibs_Dml = new CoreLibs_Dml(new CoreLibs_DatabaseConnection());
    Contact con = [SELECT FirstName FROM Contact LIMIT 1];
    con.FirstName = TEST_UPDATES_FNAME;
    String errMsg;
    System.Test.startTest();
    try {
      CoreLibs_Dml.upsertRecords(
        new List<SObject>{ new Account(Name = TEST_ACCOUNT_NAME_1), new Account(Id = DUMMY_ACCOUNT_ID), con },
        true
      );
    } catch (Exception e) {
      errMsg = e.getMessage();
    }
    System.Test.stopTest();
    Assert.areEqual(true, String.isNotBlank(errMsg), 'Should catch the error thrown from not being all or none');
    List<Account> accts = [SELECT Name FROM Account];
    Assert.areEqual(0, accts.size(), 'Should not insert the account');
    List<Contact> contacts = [
      SELECT Id
      FROM Contact
      WHERE FirstName = :TEST_UPDATES_FNAME
    ];
    Assert.areEqual(0, contacts.size(), 'Should not update contact');
  }
  @IsTest
  private static void deleteRecord_validRecord_recordDeleted() {
    CoreLibs_Dml CoreLibs_Dml = new CoreLibs_Dml(new CoreLibs_DatabaseConnection());
    Contact con = [SELECT Id FROM Contact LIMIT 1];
    System.Test.startTest();
    CoreLibs_Dml.deleteRecord(con);
    System.Test.stopTest();
    List<Contact> remainingContacts = [SELECT Id FROM Contact];
    Assert.areEqual(1, remainingContacts.size(), 'Should only be one contact after delete');
    System.assertNotEquals(con.Id, remainingContacts[0].Id, 'Make sure the remaining contact is not the deleted one');
  }
  @IsTest
  private static void deleteRecord_validId_recordDeleted() {
    CoreLibs_Dml CoreLibs_Dml = new CoreLibs_Dml(new CoreLibs_DatabaseConnection());
    Contact con = [SELECT Id FROM Contact LIMIT 1];
    System.Test.startTest();
    CoreLibs_Dml.deleteRecord(con.Id);
    System.Test.stopTest();
    List<Contact> remainingContacts = [SELECT Id FROM Contact];
    Assert.areEqual(1, remainingContacts.size(), 'Should only be one contact after delete');
    System.assertNotEquals(con.Id, remainingContacts[0].Id, 'Make sure the remaining contact is not the deleted one');
  }
  @IsTest
  private static void deleteRecords_validRecords_recordsDeleted() {
    CoreLibs_Dml CoreLibs_Dml = new CoreLibs_Dml(new CoreLibs_DatabaseConnection());
    List<Contact> contacts = [SELECT Id FROM Contact];
    System.Test.startTest();
    CoreLibs_Dml.deleteRecords(contacts);
    System.Test.stopTest();
    List<Contact> remainingContacts = [SELECT Id FROM Contact];
    Assert.areEqual(0, remainingContacts.size(), 'All contacts should be deleted');
  }
  @IsTest
  private static void deleteRecords_validIds_recordsDeleted() {
    CoreLibs_Dml CoreLibs_Dml = new CoreLibs_Dml(new CoreLibs_DatabaseConnection());
    List<Contact> contacts = [SELECT Id FROM Contact];
    List<Id> contactIds = new List<Id>();
    for (Contact con : contacts) {
      contactIds.add(con.Id);
    }
    System.Test.startTest();
    CoreLibs_Dml.deleteRecords(contactIds);
    System.Test.stopTest();
    List<Contact> remainingContacts = [SELECT Id FROM Contact];
    Assert.areEqual(0, remainingContacts.size(), 'All contacts should be deleted');
  }
  @IsTest
  private static void deleteRecords_mixValidInvalidRecordsNotAllOrNone_recordsDeleted() {
    CoreLibs_Dml CoreLibs_Dml = new CoreLibs_Dml(new CoreLibs_DatabaseConnection());
    List<Contact> contacts = [SELECT Id FROM Contact];
    List<SObject> records = new List<SObject>{ new Account(Id = DUMMY_ACCOUNT_ID) };
    records.addAll(contacts);
    System.Test.startTest();
    CoreLibs_Dml.deleteRecords(records, false);
    System.Test.stopTest();
    List<Contact> remainingContacts = [SELECT Id FROM Contact];
    Assert.areEqual(0, remainingContacts.size(), 'All contacts should be deleted');
  }
  @IsTest
  private static void deleteRecords_mixValidInvalidIdsNotAllOrNone_recordsDeleted() {
    CoreLibs_Dml CoreLibs_Dml = new CoreLibs_Dml(new CoreLibs_DatabaseConnection());
    List<SObject> contacts = [SELECT Id FROM Contact];
    List<Id> recordIds = new List<Id>{ DUMMY_ACCOUNT_ID };
    for (Contact con : (List<Contact>) contacts) {
      recordIds.add(con.Id);
    }
    System.Test.startTest();
    CoreLibs_Dml.deleteRecords(recordIds, false);
    System.Test.stopTest();
    List<Contact> remainingContacts = [SELECT Id FROM Contact];
    Assert.areEqual(0, remainingContacts.size(), 'All contacts should be deleted');
  }
  @IsTest
  private static void deleteRecords_mixValidInvalidRecordsAllOrNone_recordsDeleted() {
    CoreLibs_Dml CoreLibs_Dml = new CoreLibs_Dml(new CoreLibs_DatabaseConnection());
    List<Contact> contacts = [SELECT Id FROM Contact];
    List<SObject> records = new List<SObject>{ new Account(Id = DUMMY_ACCOUNT_ID) };
    records.addAll(contacts);
    String errMsg;
    System.Test.startTest();
    try {
      CoreLibs_Dml.deleteRecords(records, true);
    } catch (Exception e) {
      errMsg = e.getMessage();
    }
    System.Test.stopTest();
    Assert.areEqual(true, String.isNotBlank(errMsg), 'Error should be thrown from CoreLibs_Dml');
    List<Contact> remainingContacts = [SELECT Id FROM Contact];
    Assert.areEqual(2, remainingContacts.size(), 'All contacts should still exist');
  }
  @IsTest
  private static void deleteRecords_mixValidInvalidIdsAllOrNone_recordsNotDeleted() {
    CoreLibs_Dml CoreLibs_Dml = new CoreLibs_Dml(new CoreLibs_DatabaseConnection());
    List<Contact> contacts = [SELECT Id FROM Contact];
    List<Id> recordIds = new List<Id>{ DUMMY_ACCOUNT_ID };
    for (Contact con : (List<Contact>) contacts) {
      recordIds.add(con.Id);
    }
    String errMsg;
    System.Test.startTest();
    try {
      CoreLibs_Dml.deleteRecords(recordIds, true);
    } catch (Exception e) {
      errMsg = e.getMessage();
    }
    System.Test.stopTest();
    Assert.areEqual(true, String.isNotBlank(errMsg), 'Error should be thrown from CoreLibs_Dml');
    List<Contact> remainingContacts = [SELECT Id FROM Contact];
    Assert.areEqual(2, remainingContacts.size(), 'All contacts should still exist');
  }
  @IsTest
  private static void undeleteRecord_validId_recordUndeleted() {
    CoreLibs_Dml CoreLibs_Dml = new CoreLibs_Dml(new CoreLibs_DatabaseConnection());
    Contact con = [SELECT Id FROM Contact LIMIT 1];
    delete con;
    System.Test.startTest();
    CoreLibs_Dml.undeleteRecord(con.Id);
    System.Test.stopTest();
    List<Contact> remainingContacts = [SELECT Id FROM Contact];
    Assert.areEqual(2, remainingContacts.size(), 'all contacts should be restored');
  }
  @IsTest
  private static void deleteRecords_validIds_recordsUndeleted() {
    CoreLibs_Dml CoreLibs_Dml = new CoreLibs_Dml(new CoreLibs_DatabaseConnection());
    List<Contact> contacts = [SELECT Id FROM Contact];
    List<Id> contactIds = new List<Id>();
    for (Contact con : contacts) {
      contactIds.add(con.Id);
    }
    delete contacts;
    System.Test.startTest();
    CoreLibs_Dml.undeleteRecords(contactIds);
    System.Test.stopTest();
    List<Contact> remainingContacts = [SELECT Id FROM Contact];
    Assert.areEqual(2, remainingContacts.size(), 'All contacts should be restored');
  }
  @IsTest
  private static void undeleteRecords_mixValidInvalidIdsAllOrNone_recordsStayDeleted() {
    CoreLibs_Dml CoreLibs_Dml = new CoreLibs_Dml(new CoreLibs_DatabaseConnection());
    List<Contact> contacts = [SELECT Id FROM Contact];
    List<Id> recordIds = new List<Id>{ DUMMY_ACCOUNT_ID };
    for (Contact con : (List<Contact>) contacts) {
      recordIds.add(con.Id);
    }
    delete contacts;
    String errMsg;
    System.Test.startTest();
    try {
      CoreLibs_Dml.undeleteRecords(recordIds, true);
    } catch (Exception e) {
      errMsg = e.getMessage();
    }
    System.Test.stopTest();
    Assert.areEqual(true, String.isNotBlank(errMsg), 'Error should be thrown from CoreLibs_Dml');
    List<Contact> remainingContacts = [SELECT Id FROM Contact];
    Assert.areEqual(0, remainingContacts.size(), 'All contacts should still be deleted');
  }
}
