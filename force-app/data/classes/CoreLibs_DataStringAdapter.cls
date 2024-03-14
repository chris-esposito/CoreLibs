/**
 * @description Adapter for providing consistent way of mapping strings and enums
 * @author Tom Wilkins
 * @group Data
 */
public inherited sharing class CoreLibs_DataStringAdapter {
  @TestVisible
  private static final String READ_STRING = 'Read';
  @TestVisible
  private static final String INSERT_STRING = 'Insert';
  @TestVisible
  private static final String UPDATE_STRING = 'Update';
  @TestVisible
  private static final String UPSERT_STRING = 'Upsert';
  @TestVisible
  private static final String DELETE_STRING = 'Delete';
  @TestVisible
  private static final String UNDELETE_STRING = 'Undelete';

  /**
   * @description Returns a string based on System access type enum
   * @param access System access type enum
   * @return String representing the enum
   */
  public String fromAccessType(System.AccessType access) {
    switch on (access) {
      when READABLE {
        return READ_STRING;
      }
      when CREATABLE {
        return INSERT_STRING;
      }
      when UPDATABLE {
        return UPDATE_STRING;
      }
      when UPSERTABLE {
        return UPSERT_STRING;
      }
      when else {
        return '';
      }
    }
  }
  /**
   * @description Returns a string based on core libs db operation enum
   * @param operation Core libs opertaion enum
   * @return String representing the enum
   */
  public String fromDatabaseOperation(CoreLibs_DatabaseOperation operation) {
    switch on (operation) {
      when DML_INSERT {
        return INSERT_STRING;
      }
      when DML_UPDATE {
        return UPDATE_STRING;
      }
      when DML_UPSERT {
        return UPSERT_STRING;
      }
      when DML_DELETE {
        return DELETE_STRING;
      }
      when DML_UNDELETE {
        return UNDELETE_STRING;
      }
      when else {
        return '';
      }
    }
  }
}
