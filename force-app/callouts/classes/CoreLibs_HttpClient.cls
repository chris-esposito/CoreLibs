/**
 * @description Custom http client for executing callouts
 * @author Tom Wilkins
 * @group Callouts
 */
public inherited sharing class CoreLibs_HttpClient {
  /**
   * @description Executes a custom callout
   * @param callout Callout to execute
   * @return The response from the callout
   */
  public System.HttpResponse send(CoreLibs_ICallout callout) {
    System.HttpRequest req = new System.HttpRequest();
    req.setEndpoint(callout.getEndpoint());
    Map<String, String> headers = callout.getHeaders();
    if (headers != null) {
      for (String header : headers.keySet()) {
        req.setHeader(header, headers.get(header));
      }
    }
    if (callout.getMethod() == CoreLibs_HttpMethod.DEL) {
      req.setMethod('DELETE');
    } else {
      req.setMethod(callout.getMethod().name());
    }
    if (callout.getBody() != null) {
      req.setBody(callout.getBody());
    }
    System.HttpResponse res = new Http().send(req);
    this.log(callout.getCalloutLabel(), headers, req, res);
    return res;
  }

  @TestVisible
  private void log(String label, Map<String, String> requestHeaders, System.HttpRequest req, System.HttpResponse res) {
    Map<String, Object> log = new Map<String, Object>();
    Map<String, String> responseHeaders = new Map<String, String>();
    for (String header : res.getHeaderKeys()) {
      responseHeaders.put(header, res.getHeader(header));
    }
    log.put(
      'request',
      new Map<String, Object>{
        'endpoint' => req.getEndpoint(),
        'method' => req.getMethod(),
        'headers' => requestHeaders,
        'body' => req.getBody()
      }
    );
    log.put(
      'response',
      new Map<String, Object>{
        'statusCode' => res.getStatusCode(),
        'status' => res.getStatus(),
        'body' => res.getBody(),
        'headers' => responseHeaders
      }
    );
    CoreLibs_Services.logger.info(label, log);
  }
}
