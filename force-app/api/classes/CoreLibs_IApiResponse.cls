/**
 * @description Base interface for responses to implement
 * @author Tom Wilkins
 * @group Api
 */
public interface CoreLibs_IApiResponse {
  /**
   * @description should return a valid rest response that can be used,
   * most likely when setting in the rest context
   * @return Valid RestResponse object
   */
  RestResponse toResponse();
}
