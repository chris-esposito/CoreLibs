/**
 * @description Base interface for any external callouts. This is used with the CoreLibs_HttpClient
 * rather than building req/res handling on every callout. Currently only supports string bodies, will
 * extend later for blob bodies if necessary
 * @author Tom Wilkins
 * @group Callouts
 */
public interface CoreLibs_ICallout {
  /**
   * @description Returns the label of the callout, this is used to identify the callout in logs
   * among other future uses
   * @return Label to be used in logging etc.
   */
  string getCalloutLabel();
  /**
   * @description Returns the endpoint for the request -- could be an endpoint or named credential
   * @return Endpoint string value
   */
  string getEndpoint();

  /**
   * @description Returns the headers for the request. Return an empty map for no headers
   * @return Header map
   */
  Map<String, String> getHeaders();

  /**
   * @description Returns the http method of the request
   * @return Http method
   */
  CoreLibs_HttpMethod getMethod();

  /**
   * @description Returns the body of the request
   * @return String body of the request
   */
  String getBody();
}
