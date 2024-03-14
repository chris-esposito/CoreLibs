/**
 * @description Mocked db that can be used to replace the standard testing db for most applications,
 * affording further decoupling from other parts of the system
 * @author Tom Wilkins
 * @group Data
 */
@IsTest
public inherited sharing class CoreLibs_MockDatabaseConnection implements CoreLibs_IDatabaseConnection {
  public static Map<Id, SObject> state {
    get {
      if (state == null) {
        state = new Map<Id, SObject>();
      }
      return state;
    }
    set;
  }

  public static Map<Id, SObject> deletedState {
    get {
      if (deletedState == null) {
        deletedState = new Map<Id, SObject>();
      }
      return deletedState;
    }
    set;
  }

  public static Map<Schema.SObjectType, List<SObject>> recordsBySObject {
    get {
      if (recordsBySObject == null) {
        recordsBySObject = new Map<Schema.SObjectType, List<SObject>>();
      }
      return recordsBySObject;
    }
    set;
  }

  public List<Database.SaveResult> insertRecords(List<SObject> records, Database.DMLOptions options) {
    List<Map<String, Object>> results = new List<Map<String, Object>>();
    for (SObject record : records) {
      if (String.isNotBlank(record.Id)) {
        throw new CoreLibs_DataExceptions.MockDatabaseException('Cannot insert record with Id: ' + record.Id);
      }
      record.Id = new CoreLibs_SObjectMocker(record.getSObjectType()).generateMockId();
      state.put(record.Id, record);
      this.addRecordToSObjectGroup(record);
      results.add(this.buildBaseResult(record.Id));
    }
    return (List<Database.SaveResult>) JSON.deserialize(JSON.serialize(results), List<Database.SaveResult>.class);
  }

  public List<Database.SaveResult> updateRecords(List<SObject> records, Database.DMLOptions options) {
    List<Map<String, Object>> results = new List<Map<String, Object>>();
    for (SObject record : records) {
      if (String.isBlank(record.Id)) {
        throw new CoreLibs_DataExceptions.MockDatabaseException('Cannot update record without Id');
      }
      state.put(record.Id, record);
      this.addRecordToSObjectGroup(record);
      results.add(this.buildBaseResult(record.Id));
    }
    return (List<Database.SaveResult>) JSON.deserialize(JSON.serialize(results), List<Database.SaveResult>.class);
  }

  public List<Database.UpsertResult> upsertRecords(List<SObject> records, Boolean allOrNone) {
    List<Map<String, Object>> results = new List<Map<String, Object>>();
    for (SObject record : records) {
      Boolean isInsert = false;
      if (String.isBlank(record.Id)) {
        record.Id = new CoreLibs_SObjectMocker(record.getSObjectType()).generateMockId();
        isInsert = true;
      }
      state.put(record.Id, record);
      this.addRecordToSObjectGroup(record);
      results.add(this.buildUpsertResult(record.Id, isInsert));
    }
    return (List<Database.UpsertResult>) JSON.deserialize(JSON.serialize(results), List<Database.UpsertResult>.class);
  }

  public List<Database.UpsertResult> upsertRecords(
    List<SObject> records,
    Schema.SObjectField externalIdField,
    Boolean allOrNone
  ) {
    List<Map<String, Object>> results = new List<Map<String, Object>>();
    String fieldName = String.valueOf(externalIdField);
    for (SObject record : records) {
      // I think this probably needs to be revisisted to be more robust
      // but short term, we can just require that when using upsert, you can set the
      // state directly if needed
      List<SObject> existingRecords = recordsBySObject.get(record.getSObjectType());
      for (SObject existingRecord : existingRecords) {
        if (record.get(fieldName) == existingRecord.get(fieldName)) {
          record.Id = existingRecord.Id;
          break;
        }
      }
      Boolean isInsert = false;
      if (String.isBlank(record.Id)) {
        record.Id = new CoreLibs_SObjectMocker(record.getSObjectType()).generateMockId();
        isInsert = true;
      }
      state.put(record.Id, record);
      this.addRecordToSObjectGroup(record);
      results.add(this.buildUpsertResult(record.Id, isInsert));
    }
    return (List<Database.UpsertResult>) JSON.deserialize(JSON.serialize(results), List<Database.UpsertResult>.class);
  }

  public List<Database.DeleteResult> deleteRecords(List<SObject> records, Boolean allOrNone) {
    List<Map<String, Object>> results = new List<Map<String, Object>>();
    for (SObject record : records) {
      if (String.isNotBlank(record.Id)) {
        throw new CoreLibs_DataExceptions.MockDatabaseException('Cannot delete record with Id: ' + record.Id);
      }
      deletedState.put(record.Id, state.get(record.Id));
      state.remove(record.Id);
      // TODO probably need to remove from SObject group as well
      // TODO process for proper delete result f not working
    }
    return (List<Database.DeleteResult>) JSON.deserialize(JSON.serialize(results), List<Database.DeleteResult>.class);
  }

  public List<Database.DeleteResult> deleteRecords(List<Id> recordIds, Boolean allOrNone) {
    List<Map<String, Object>> results = new List<Map<String, Object>>();
    for (Id recordId : recordIds) {
      if (String.isNotBlank(recordId)) {
        throw new CoreLibs_DataExceptions.MockDatabaseException('Cannot delete record with Id: ' + recordId);
      }
      deletedState.put(recordId, state.get(recordId));
      state.remove(recordId);
      // TODO probably need to remove from SObject group as well
      // TODO process for proper delete result f not working
    }
    return (List<Database.DeleteResult>) JSON.deserialize(JSON.serialize(results), List<Database.DeleteResult>.class);
  }

  public List<Database.UndeleteResult> undeleteRecords(List<SObject> records, Boolean allOrNone) {
    List<Map<String, Object>> results = new List<Map<String, Object>>();
    for (SObject record : records) {
      if (String.isNotBlank(record.Id)) {
        throw new CoreLibs_DataExceptions.MockDatabaseException('Cannot delete record with Id: ' + record.Id);
      }
      state.put(record.Id, deletedState.get(record.Id));
      deletedState.remove(record.Id);
      // TODO probably need to add back to SObject group as well
      // TODO process for proper undelete result f not working
    }
    return (List<Database.UndeleteResult>) JSON.deserialize(
      JSON.serialize(results),
      List<Database.UndeleteResult>.class
    );
  }

  public List<Database.UndeleteResult> undeleteRecords(List<Id> recordIds, Boolean allOrNone) {
    List<Map<String, Object>> results = new List<Map<String, Object>>();
    for (Id recordId : recordIds) {
      if (String.isNotBlank(recordId)) {
        throw new CoreLibs_DataExceptions.MockDatabaseException('Cannot delete record with Id: ' + recordId);
      }
      state.put(recordId, deletedState.get(recordId));
      deletedState.remove(recordId);
      // TODO probably need to addd back to SObject group as well
      // TODO process for proper undelete result f not working
    }
    return (List<Database.UndeleteResult>) JSON.deserialize(
      JSON.serialize(results),
      List<Database.UndeleteResult>.class
    );
  }

  @TestVisible
  private void addRecordToSObjectGroup(SObject record) {
    Schema.SObjectType sObjType = record.getSObjectType();
    if (!recordsBySObject.containsKey(sObjType)) {
      recordsBySObject.put(sObjType, new List<SObject>());
    }
    recordsBySObject.get(sObjType).add(record);
  }

  @TestVisible
  private Map<String, Object> buildBaseResult(Id recordId) {
    Map<String, Object> result = new Map<String, Object>{ 'success' => true, 'id' => recordId };
    return result;
  }

  @TestVisible
  private Map<String, Object> buildUpsertResult(Id recordId, Boolean isInsert) {
    Map<String, Object> result = this.buildBaseResult(recordId);
    result.put('created', isInsert);
    return result;
  }
}
