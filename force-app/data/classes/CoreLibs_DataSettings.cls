/**
 * @description Settings singleton for data interactions
 * @author Tom Wilkins
 * @group Data
 */
public inherited sharing virtual class CoreLibs_DataSettings {
  @TestVisible
  private static final String CAN_ONLY_ENABLE_MOCK_DB_IN_TEST = 'Mock Database can nly be enabled in tests.';

  @TestVisible
  private static CoreLibs_DataSettings instance;

  @TestVisible
  private Boolean isFlsEnabled {
    get {
      if (this.isFlsEnabled == null) {
        this.isFlsEnabled = true;
      }
      return this.isFlsEnabled;
    }
    set;
  }

  @TestVisible
  private Boolean isMockDatabaseEnabled {
    get {
      if (this.isMockDatabaseEnabled == null) {
        this.isMockDatabaseEnabled = false;
      }
      return this.isMockDatabaseEnabled;
    }
    set;
  }

  /**
   * @description Singleton access for data settings class
   * @return Reference to the data settings singleton
   */
  public static CoreLibs_DataSettings getInstance() {
    if (instance == null) {
      instance = new CoreLibs_DataSettings();
    }
    return instance;
  }

  /**
   * @description Returns whether or not FLS is enforced for data transactions
   * This will always return false if the user has the BypassFls custom permission
   * @return True if FLS should be enforced, false otherwise
   */
  public Boolean isFlsEnforced() {
    // Remove running test clause when we start to support persona-based testing
    if (FeatureManagement.checkPermission('CoreLibs_BypassFls') || System.Test.isRunningTest()) {
      return false;
    }
    return this.isFlsEnabled;
  }

  /**
   * @description Enables FLS for subsequent data actions
   */
  public void enableFls() {
    this.isFlsEnabled = true;
  }

  /**
   * @description Disables FLS for subsequent data actions
   */
  public void disableFls() {
    this.isFlsEnabled = false;
  }

  /**
   * @description Returns whether or not a mock database connection should be used in data operations
   * @return True if a mock db should be used, false otherwise
   */
  public Boolean shouldUseMockDatabase() {
    return this.isMockDatabaseEnabled;
  }

  /**
   * @descriptions Enables the mock database for use in data operations
   */
  public void enableMockDatabase() {
    if (!System.Test.isRunningTest()) {
      throw new CoreLibs_DataExceptions.SettingsException(CAN_ONLY_ENABLE_MOCK_DB_IN_TEST);
    }
    this.isMockDatabaseEnabled = true;
  }

  /**
   * @descriptions Disables the mock database for use in data operations
   */
  public void disableMockDatabase() {
    this.isMockDatabaseEnabled = false;
  }

  /**
   * @description Protected constructor for mocking
   */
  protected CoreLibs_DataSettings() {
    return;
  }
}
