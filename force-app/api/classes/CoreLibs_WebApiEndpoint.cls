/**
 * @description Entry point for our web api. Resolving a URL is managed in the service layer rather than trying
 * to use Salesforce's terrible url resolver
 * @author Tom Wilkins
 * @group Api
 */
@RestResource(urlMapping='/webapi/*')
global with sharing class CoreLibs_WebApiEndpoint {
  /**
   * @description GET method entry point
   */
  @HttpGet
  global static void doGet() {
    processRequest(CoreLibs_HttpMethod.GET);
  }
  /**
   * @description POST method entry point
   */
  @HttpPost
  global static void doPost() {
    processRequest(CoreLibs_HttpMethod.POST);
  }
  /**
   * @description PUT method entry point
   */
  @HttpPut
  global static void doPut() {
    processRequest(CoreLibs_HttpMethod.PUT);
  }
  /**
   * @description PATCH method entry point
   */
  @HttpPatch
  global static void doPatch() {
    processRequest(CoreLibs_HttpMethod.PATCH);
  }
  /**
   * @description DELETE method entry point
   */
  @HttpDelete
  global static void doDelete() {
    processRequest(CoreLibs_HttpMethod.DEL);
  }

  /**
   * @description Helper to kick off actual processing of the request
   */
  @TestVisible
  private static void processRequest(CoreLibs_HttpMethod method) {
    new CoreLibs_ApiDispatcher(method, new CoreLibs_ApiUrlResolver(RestContext.request)).dispatch();
  }
}
