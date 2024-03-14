/**
 * @description Base interface for db connections
 * @author Tom Wilkins
 * @group Data
 */
public interface CoreLibs_IDatabaseConnection {
  /**
   * @description Inserts a collection of records
   * @param records Records to insert
   * @param options DML options
   * @return Save results from insert
   */
  List<Database.SaveResult> insertRecords(List<SObject> records, Database.DMLOptions options);
  /**
   * @description Updates a collection of records
   * @param records Records to update
   * @param options DML options
   * @return Save results from update
   */
  List<Database.SaveResult> updateRecords(List<SObject> records, Database.DMLOptions options);
  /**
   * @description Upserts a collection of records
   * @param records Records to upsert
   * @param allOrNone Whether or not the dml operation should be all or none
   * @return Results from upsert
   */
  List<Database.UpsertResult> upsertRecords(List<SObject> records, Boolean allorNone);
  /**
   * @description Upserts a collection of records
   * @param records Records to upsert
   * @param externalId External Id field to upsert on
   * @param allOrNone Whether or not the dml operation should be all or none
   * @return Results from upsert
   */
  List<Database.UpsertResult> upsertRecords(
    List<SObject> records,
    Schema.SObjectField externalIdField,
    Boolean allorNone
  );
  /**
   * @description Deletes a collection of records
   * @param records Records to delete
   * @param allOrNone Whether or not the dml operation should be all or none
   * @return Delete results from delete
   */
  List<Database.DeleteResult> deleteRecords(List<SObject> records, Boolean allorNone);
  /**
   * @description Deletes a collection of records
   * @param recordIds Ids of records to delete
   * @param allOrNone Whether or not the dml operation should be all or none
   * @return Delete results from delete
   */
  List<Database.DeleteResult> deleteRecords(List<Id> recordIds, Boolean allorNone);
  /**
   * @description Uneletes a collection of records
   * @param records Records to undelete
   * @param allOrNone Whether or not the dml operation should be all or none
   * @return Results from undelete
   */
  List<Database.UndeleteResult> undeleteRecords(List<SObject> records, Boolean allorNone);
  /**
   * @description Uneletes a collection of records
   * @param recordIds Ids of records to delete
   * @param allOrNone Whether or not the dml operation should be all or none
   * @return Results from undelete
   */
  List<Database.UndeleteResult> undeleteRecords(List<Id> recordIds, Boolean allorNone);
}
