/**
 * @description Exceptions class for grouping data related exceptions
 * @author Tom Wilkins
 * @group Data
 */
public inherited sharing class CoreLibs_DataExceptions {
  public inherited sharing class SettingsException extends Exception {
  }
  public inherited sharing class FlsException extends Exception {
    @TestVisible
    private final String INSUFFICIENT_ACCESS_MESSAGE = 'Insufficient {0} access to: {1}';
    @TestVisible
    private CoreLibs_DataStringAdapter strings {
      get {
        if (this.strings == null) {
          this.strings = new CoreLibs_DataStringAdapter();
        }
        return this.strings;
      }
      set;
    }
    @TestVisible
    private List<String> violations {
      get {
        if (this.violations == null) {
          this.violations = new List<String>();
        }
        return this.violations;
      }
      set;
    }
    @TestVisible
    private String operationType;

    /**
     * @description Constructor
     * @param access System access type to get operation from
     * @param violations List of Fls violation strings
     */
    public FlsException(System.AccessType access, List<String> violations) {
      this.operationType = this.strings.fromAccessType(access);
      this.violations = violations;
    }

    /**
     * @description Constructor
     * @param operation Databse operaiton to get op string from
     * @param violations List of Fls violation strings
     */
    public FlsException(CoreLibs_DatabaseOperation operation, List<String> violations) {
      this.operationType = this.strings.fromDatabaseOperation(operation);
      this.violations = violations;
    }

    /**
     * @descriptions Returns the FLS error message based on state
     * @return Custom error message
     */
    public override String getMessage() {
      return String.format(
        INSUFFICIENT_ACCESS_MESSAGE,
        new List<String>{ this.operationType, String.join(this.violations, ',') }
      );
    }
  }
  public inherited sharing class MockDatabaseException extends Exception {
  }
}
