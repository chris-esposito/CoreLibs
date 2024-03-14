/**
 * @description Base interface for any operation that may provide an error code
 * @author Tom Wilkins
 */
public interface CoreLibs_IErrorCodeProvider {
  /**
   * @description Returns an error code
   * @return Error code string
   */
  String getErrorCode();
}
