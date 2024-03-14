/**
 * @description Simple api success response
 * @author Tom Wilkins
 * @group Api
 */
public inherited sharing class CoreLibs_ApiSuccessResponse implements CoreLibs_IApiResponse {
  @TestVisible
  Integer statusCode;
  @TestVisible
  Object body;

  /**
   * @description Constructor
   * @param status Http success status to set
   */
  public CoreLibs_ApiSuccessResponse(CoreLibs_HttpStatusCode.SUCCESS status) {
    this(status, null);
  }

  /**
   * @description Constructor
   * @param status Http success status to set
   * @param body body of the response -- must be null orserializable
   */
  public CoreLibs_ApiSuccessResponse(CoreLibs_HttpStatusCode.SUCCESS status, Object body) {
    this.statusCode = CoreLibs_HttpStatusCode.getFor(status);
    if (body == null) {
      this.body = new Map<String, String>();
    } else {
      this.body = body;
    }
  }

  /**
   * @see {@link IApiResponse}
   */
  public RestResponse toResponse() {
    RestResponse res = RestContext.response;
    res.statusCode = this.statusCode;
    res.responseBody = Blob.valueOf(JSON.serialize(this.body));
    return res;
  }
}
