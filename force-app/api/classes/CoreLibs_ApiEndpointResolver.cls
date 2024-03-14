/**
 * @description Base resolver class for endpoints to implement. By default, methods will throw a method not supported exception.
 * Override only the methods which make sense for the endpoint
 * @author Tom Wilkins
 * @group Api
 */
public inherited sharing virtual class CoreLibs_ApiEndpointResolver {
  @TestVisible
  private static final String METHOD_NOT_SUPPORTED = 'Method not supported';
  @TestVisible
  protected Map<String, String> urlParams {
    get {
      if (this.urlParams == null) {
        this.urlParams = new Map<String, String>();
      }
      return this.urlParams;
    }
    set;
  }
  @TestVisible
  protected RestRequest req;

  /**
   * @description sets the request to be used by the resolver
   * @param req The incoming rest to process
   * @return Reference to the invoking object
   */
  public CoreLibs_ApiEndpointResolver setRequest(RestRequest req) {
    this.req = req;
    Set<String> definedUrlParams = this.getUrlParams();
    List<String> urlParts = req.requestURI.split('/');
    Integer numOfParts = urlParts.size();
    for (String urlParam : definedUrlParams) {
      this.urlParams.put(urlParam, this.getUrlParamValue(urlParts, numOfParts, urlParam));
    }
    return this;
  }

  /**
   * @description Returnsthe label for the class -- defaults to class name
   * override the method to provide custom label
   */
  public virtual String getLabel() {
    return new CoreLibs_ObjectInspector(this).getClassName();
  }

  /**
   * Get handler, override if this resolver should support get requests
   * @return A valid API response that will be mapped to Salesforce System RestResponse
   */
  public virtual CoreLibs_IApiResponse doGet() {
    throw new CoreLibs_ApiExceptions.MethodNotAllowedException(METHOD_NOT_SUPPORTED);
  }

  /**
   * Get handler, override if this resolver should support post requests
   * @return A valid API response that will be mapped to Salesforce System RestResponse
   */
  public virtual CoreLibs_IApiResponse doPost() {
    throw new CoreLibs_ApiExceptions.MethodNotAllowedException(METHOD_NOT_SUPPORTED);
  }

  /**
   * Get handler, override if this resolver should support put requests
   * @return A valid API response that will be mapped to Salesforce System RestResponse
   */
  public virtual CoreLibs_IApiResponse doPut() {
    throw new CoreLibs_ApiExceptions.MethodNotAllowedException(METHOD_NOT_SUPPORTED);
  }

  /**
   * Get handler, override if this resolver should support patch requests
   * @return A valid API response that will be mapped to Salesforce System RestResponse
   */
  public virtual CoreLibs_IApiResponse doPatch() {
    throw new CoreLibs_ApiExceptions.MethodNotAllowedException(METHOD_NOT_SUPPORTED);
  }

  /**
   * Get handler, override if this resolver should support delete requests
   * @return A valid API response that will be mapped to Salesforce System RestResponse
   */
  public virtual CoreLibs_IApiResponse doDelete() {
    throw new CoreLibs_ApiExceptions.MethodNotAllowedException(METHOD_NOT_SUPPORTED);
  }

  /**
   * @description Return whether or not the endpoint should be idempotent. False by default
   * @return True if should be idempotent, false otherwise
   */
  public virtual Boolean shouldBeIdempotent() {
    return false;
  }

  /**
   * @description Should return the url params to be pulled out of the endpoint url e.g. the url /cases/12345 has a
   * param cases with a vlaue 12345. This should not include query params
   * @return Set of url param names
   */
  protected virtual Set<String> getUrlParams() {
    return new Set<String>();
  }

  /**
   * @description Helper to parse the url params out of the request url
   * @param urlParts the various components of the url, usually the url split on /
   * @param len Length of url parts, provided to not have to recalculate size
   * @param param the name of the param to pull the value for
   * @return The param if found, an empty string otherwise
   */
  @TestVisible
  private String getUrlParamValue(List<String> urlParts, Integer len, String param) {
    for (Integer i = 0; i < len; i++) {
      if (urlParts[i] == param && (i + 1) < len) {
        return urlParts[i + 1];
      }
    }
    return '';
  }
}
