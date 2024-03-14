/**
 * @description Class used to manage and map the various HTTP codes that we support
 * @author Tom Wilkins
 * @group Api
 */
public inherited sharing class CoreLibs_HttpStatusCode {
  public enum SUCCESS {
    OK,
    CREATED,
    NO_CONTENT
  }
  public enum ERROR {
    BAD_REQUEST,
    UNAUTHORIZED,
    FORBIDDEN,
    NOT_FOUND,
    METHOD_NOT_ALLOWED,
    NOT_ACCEPTABLE,
    INTERNAL_SERVER_ERROR,
    NOT_IMPLEMENTED,
    BAD_GATEWAY,
    SERVICE_UNAVAILABLE,
    GATEWAY_TIMEOUT
  }

  @TestVisible
  private static Map<CoreLibs_HttpStatusCode.SUCCESS, Integer> successCodeMapping = new Map<CoreLibs_HttpStatusCode.SUCCESS, Integer>{
    CoreLibs_HttpStatusCode.SUCCESS.OK => 200,
    CoreLibs_HttpStatusCode.SUCCESS.CREATED => 201,
    CoreLibs_HttpStatusCode.SUCCESS.NO_CONTENT => 204
  };

  @TestVisible
  private static Map<CoreLibs_HttpStatusCode.ERROR, Integer> errorCodeMapping = new Map<CoreLibs_HttpStatusCode.ERROR, Integer>{
    CoreLibs_HttpStatusCode.ERROR.BAD_REQUEST => 400,
    CoreLibs_HttpStatusCode.ERROR.UNAUTHORIZED => 401,
    CoreLibs_HttpStatusCode.ERROR.FORBIDDEN => 403,
    CoreLibs_HttpStatusCode.ERROR.NOT_FOUND => 404,
    CoreLibs_HttpStatusCode.ERROR.METHOD_NOT_ALLOWED => 405,
    CoreLibs_HttpStatusCode.ERROR.NOT_ACCEPTABLE => 406,
    CoreLibs_HttpStatusCode.ERROR.INTERNAL_SERVER_ERROR => 500,
    CoreLibs_HttpStatusCode.ERROR.NOT_IMPLEMENTED => 501,
    CoreLibs_HttpStatusCode.ERROR.BAD_GATEWAY => 502,
    CoreLibs_HttpStatusCode.ERROR.SERVICE_UNAVAILABLE => 503,
    CoreLibs_HttpStatusCode.ERROR.GATEWAY_TIMEOUT => 504
  };

  /**
   * @description Returns the Http code for the provided http status
   * @param successStatus SUCCESS status value to get a numeric code for
   * @return Integer code for the status
   */
  public static Integer getFor(CoreLibs_HttpStatusCode.SUCCESS successStatus) {
    return successCodeMapping.get(successStatus);
  }

  /**
   * @description Returns the Http code for the provided http status
   * @param successStatus ERROR status value to get a numeric code for
   * @return Integer code for the status
   */
  public static Integer getFor(CoreLibs_HttpStatusCode.ERROR errorStatus) {
    return errorCodeMapping.get(errorStatus);
  }
}
