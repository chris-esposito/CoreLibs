/**
 * @description Enume for capturng database operations, inclusive of those not covered
 * by system libs
 * @author Tom Wilkins
 * @group Data
 */
public enum CoreLibs_DatabaseOperation {
  DML_INSERT,
  DML_UPDATE,
  DML_UPSERT,
  DML_DELETE,
  DML_UNDELETE
}
