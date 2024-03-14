/**
 * @description Primary database connection class for apex operations. See {@link CoreLibs_IDatabaseConnection}
 * @author Tom Wilkins
 * @group Data
 */
public inherited sharing class CoreLibs_DatabaseConnection implements CoreLibs_IDatabaseConnection {
  public List<Database.SaveResult> insertRecords(List<SObject> records, Database.DMLOptions options) {
    if (options == null) {
      return Database.insert(records);
    } else {
      return Database.insert(records, options);
    }
  }
  public List<Database.SaveResult> updateRecords(List<SObject> records, Database.DMLOptions options) {
    if (options == null) {
      return Database.update(records);
    } else {
      return Database.update(records, options);
    }
  }
  public List<Database.UpsertResult> upsertRecords(List<SObject> records, Boolean allOrNone) {
    return Database.upsert(records, allOrNone);
  }
  public List<Database.UpsertResult> upsertRecords(
    List<SObject> records,
    Schema.SObjectField externalIdField,
    Boolean allOrNone
  ) {
    return Database.upsert(records, externalIdField, allOrNone);
  }
  public List<Database.DeleteResult> deleteRecords(List<SObject> records, Boolean allOrNone) {
    return Database.delete(records, allOrNone);
  }
  public List<Database.DeleteResult> deleteRecords(List<Id> recordIds, Boolean allOrNone) {
    return Database.delete(recordIds, allOrNone);
  }
  public List<Database.UndeleteResult> undeleteRecords(List<SObject> records, Boolean allOrNone) {
    return Database.undelete(records, allOrNone);
  }
  public List<Database.UndeleteResult> undeleteRecords(List<Id> recordIds, Boolean allOrNone) {
    return Database.undelete(recordIds, allOrNone);
  }
}
