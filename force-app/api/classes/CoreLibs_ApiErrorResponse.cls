/**
 * @description Simple API error response
 * @author Tom Wilkins
 * @group Api
 */
public inherited sharing class CoreLibs_ApiErrorResponse implements CoreLibs_IApiResponse {
  @TestVisible
  private Integer statusCode;
  @TestVisible
  private String errorMessage;

  /**
   * @description Constructor
   * @param e ApiException to process and transform into an error response
   */
  public CoreLibs_ApiErrorResponse(CoreLibs_ApiExceptions.ApiException e) {
    this.statusCode = CoreLibs_HttpStatusCode.getFor(e.getStatus());
    this.errorMessage = e.getMessage();
  }

  /**
   * @see {@link IApiResponse}
   */
  public RestResponse toResponse() {
    RestResponse res = RestContext.response;
    res.responseBody = Blob.valueOf(this.errorMessage);
    res.statusCode = this.statusCode;
    return res;
  }
}
