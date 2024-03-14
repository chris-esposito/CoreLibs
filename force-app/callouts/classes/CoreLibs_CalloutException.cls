/**
 * @description Exception that can be used/extended for callout functionality, particularly for
 * internal callouts that have standardized error codes
 * @author Tom Wilkins
 */
public inherited sharing class CoreLibs_CalloutException extends Exception implements CoreLibs_IErrorCodeProvider {
  @TestVisible
  private String errorCode;

  /**
   * @description Constructor
   * @param errorCode Error code to set
   */
  public CoreLibs_CalloutException setErrorCode(String errorCode) {
    this.errorCode = errorCode;
    return this;
  }

  /**
   * @see CoreLibs_IErrorCodeProvider
   */
  public String getErrorCode() {
    return this.errorCode;
  }
}
