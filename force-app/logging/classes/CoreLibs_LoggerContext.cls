/**
 * @description Context singleton class used by logging functionality around logging events
 * @author Tom Wilkins
 * @group Logging
 */
public inherited sharing virtual class CoreLibs_LoggerContext {
  @TestVisible
  private static CoreLibs_LoggerContext instance;

  @TestVisible
  private String transactionId {
    get {
      if (String.isBlank(this.transactionId)) {
        this.transactionId = new CoreLibs_Uuid().getValue();
      }
      return this.transactionId;
    }
    set;
  }

  /**
   * @description Singleton getter
   * @return Singleton instance of the logger context for the transaction
   */
  public static CoreLibs_LoggerContext getInstance() {
    if (instance == null) {
      instance = new CoreLibs_LoggerContext();
    }
    return instance;
  }

  /**
   * @description Transaction Id (UUID) getter
   * @return UUID for the transaction
   */
  public String getTransactionId() {
    return this.transactionId;
  }

  /**
   * @description Transaction Type getter
   * @return Type of transaction as string
   */
  public String getTransactionType() {
    // this seems to only work if the user has a running session
    if (String.isNotBlank(this.getRunningUserSessionId())) {
      return System.Request.getCurrent().getQuiddity().name();
    }
    return null;
  }

  /**
   * @description Session Id getter
   * @return The current user's session Id
   */
  public String getRunningUserSessionId() {
    return System.UserInfo.getSessionId();
  }

  /**
   * @description User ID getter
   * @return The Id of the current user
   */
  public Id getRunningUserId() {
    return System.UserInfo.getUserId();
  }

  /**
   * @description Protected constructor for mocking
   */
  @TestVisible
  protected CoreLibs_LoggerContext() {
  }
}
