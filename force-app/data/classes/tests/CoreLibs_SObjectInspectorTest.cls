@IsTest
private inherited sharing class CoreLibs_SObjectInspectorTest {
  @IsTest
  private static void constructor_recordId_setSObjectType() {
    System.Test.startTest();
    CoreLibs_SObjectInspector inspector = new CoreLibs_SObjectInspector(
      new CoreLibs_SObjectMocker(Account.getSObjectType()).generateMockId()
    );
    System.Test.stopTest();
    Assert.areEqual(Account.getSObjectType(), inspector.sObjType, 'Should set the account type from the id');
  }

  @IsTest
  private static void getAllFields_account_returnAllFields() {
    CoreLibs_SObjectInspector inspector = new CoreLibs_SObjectInspector(Account.getSObjectType());
    System.Test.startTest();
    List<Schema.SObjectField> results = inspector.getAllFields();
    System.Test.stopTest();
    Assert.isTrue(results.size() > 0, 'Should return fields for Account');
  }

  @IsTest
  private static void getField_industryOnAccount_returnField() {
    CoreLibs_SObjectInspector inspector = new CoreLibs_SObjectInspector(Account.getSObjectType());
    System.Test.startTest();
    Schema.SObjectField result = inspector.getField('Industry');
    System.Test.stopTest();
    Assert.areEqual('Industry', result.getDescribe().getName(), 'Should return the correct field');
  }

  @IsTest
  private static void getPicklistValues_industryOnAccountString_returnValues() {
    CoreLibs_SObjectInspector inspector = new CoreLibs_SObjectInspector(Account.getSObjectType());
    System.Test.startTest();
    List<Schema.PicklistEntry> results = inspector.getPicklistValues('Industry');
    System.Test.stopTest();
    Assert.isTrue(results.size() > 0, 'Should return some picklist values for industry');
  }

  @IsTest
  private static void getPicklistValues_industryOnAccountField_returnValues() {
    CoreLibs_SObjectInspector inspector = new CoreLibs_SObjectInspector(Account.getSObjectType());
    System.Test.startTest();
    List<Schema.PicklistEntry> results = inspector.getPicklistValues(Account.Industry);
    System.Test.stopTest();
    Assert.isTrue(results.size() > 0, 'Should return some picklist values for industry');
  }

  @IsTest
  private static void getRecordTypeDeveloperName_mockedRecordTypeId_returnMaster() {
    CoreLibs_SObjectMocker mocker = new CoreLibs_SObjectMocker(RecordType.getSObjectType());
    CoreLibs_SObjectInspector inspector = new CoreLibs_SObjectInspector(Account.getSObjectType());
    System.Test.startTest();
    String result = inspector.getRecordTypeDeveloperName(mocker.generateMockId());
    System.Test.stopTest();
    Assert.areEqual('Master', result, 'Should return the master record type');
  }

  @IsTest
  private static void getRecordTypeId_noRecordTypeEnabled_returnMasterId() {
    CoreLibs_SObjectMocker mocker = new CoreLibs_SObjectMocker(RecordType.getSObjectType());
    CoreLibs_SObjectInspector inspector = new CoreLibs_SObjectInspector(Account.getSObjectType());
    System.Test.startTest();
    String result = inspector.getRecordTypeId('Master');
    System.Test.stopTest();
    Assert.areEqual(mocker.generateMockId(), result, 'Should return the master record type');
  }

  @IsTest
  private static void canDelete_currentUser_returnSomething() {
    // would need a specific permset to test this
    // so just make sure it return something
    CoreLibs_SObjectInspector inspector = new CoreLibs_SObjectInspector(Account.getSObjectType());
    System.Test.startTest();
    Boolean result = inspector.canDelete();
    System.Test.stopTest();
    Assert.isNotNull(result, 'Should return a non null value');
  }

  @IsTest
  private static void getFieldSet_noFieldSet_returnNull() {
    CoreLibs_SObjectInspector inspector = new CoreLibs_SObjectInspector(Account.getSObjectType());
    System.Test.startTest();
    Schema.FieldSet result = inspector.getFieldSet('Does_Not_Exist');
    System.Test.stopTest();
    Assert.isNull(result, 'Should return null since field set does not exist');
  }

  @IsTest
  private static void getPrefix_account_return001() {
    CoreLibs_SObjectInspector inspector = new CoreLibs_SObjectInspector(Account.getSObjectType());
    System.Test.startTest();
    String result = inspector.getPrefix();
    System.Test.stopTest();
    Assert.areEqual('001', result, 'Should return account prefix');
  }

  @IsTest
  private static void getSObjectType_account_returnType() {
    CoreLibs_SObjectInspector inspector = new CoreLibs_SObjectInspector(Account.getSObjectType());
    System.Test.startTest();
    Schema.SObjectType result = inspector.getSObjectType();
    System.Test.stopTest();
    Assert.areEqual(Account.getSObjectType(), result, 'Should return the account sobject type');
  }
}
