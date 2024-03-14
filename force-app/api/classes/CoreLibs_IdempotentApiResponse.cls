/**
 * @description Data selector class for Api_Endpoint__mdt custom metadata
 * @author Tom Wilkins
 * @group Api
 */
public with sharing class CoreLibs_IdempotentApiResponse implements CoreLibs_IApiResponse {
  @TestVisible
  private CoreLibs_IdempotentEntry__c entry;

  /**
   * @description Constructor
   * @param entry The Idempotent entry record to generate the response from
   */
  public CoreLibs_IdempotentApiResponse(CoreLibs_IdempotentEntry__c entry) {
    this.entry = entry;
  }

  /**
   * @see {@link CoreLibs_IApiResponse}
   */
  public System.RestResponse toResponse() {
    RestResponse res = RestContext.response;
    res.statusCode = Integer.valueOf(this.entry.ResponseStatusCode__c);
    res.responseBody = Blob.valueOf(this.entry.ResponseBody__c);
    Map<String, String> headers = (Map<String, String>) JSON.deserialize(
      this.entry.ResponseHeaders__c,
      Map<String, String>.class
    );
    for (String header : headers.keySet()) {
      res.addHeader(header, headers.get(header));
    }
    return res;
  }
}
