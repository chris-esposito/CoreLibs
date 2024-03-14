/**
 * @description Centralized dispatcher for managing api resolver logic
 * @author Tom Wilkins
 * @group Api
 */
public inherited sharing class CoreLibs_ApiDispatcher {
  @TestVisible
  private static final String IDEMPOTENCY_KEY = 'x-idempotent-key';

  @TestVisible
  private CoreLibs_HttpMethod method;
  @TestVisible
  private CoreLibs_ApiUrlResolver urlResolver;
  @TestVisible
  private Boolean hasIdempotentResponse;
  @TestVisible
  private Boolean errorOccured;

  /**
   * @description Constructor
   * @param method Http method marking the context of the current API transaction
   * @param urlResolver Url resolver used to generate endpoint resolver
   */
  public CoreLibs_ApiDispatcher(CoreLibs_HttpMethod method, CoreLibs_ApiUrlResolver urlResolver) {
    this.method = method;
    this.urlResolver = urlResolver;
    this.hasIdempotentResponse = false;
    this.errorOccured = false;
  }

  /**
   * @description Gets, executes, and handles an endpoint resolver. Sets the rest response.
   */
  public void dispatch() {
    CoreLibs_IApiResponse res;
    Savepoint sp = Database.setSavepoint();
    Boolean shouldSaveApiRequest = false;
    String resolverLabel = 'Unknown API';
    try {
      CoreLibs_ApiEndpointResolver endpointResolver = urlResolver.resolve();
      resolverLabel = endpointResolver.getLabel();
      if (endpointResolver.shouldBeIdempotent()) {
        res = this.getResponseForExistingRequest();
      }
      if (res == null) {
        if (endpointResolver.shouldBeIdempotent()) {
          shouldSaveApiRequest = true;
        }
        switch on (this.method) {
          when GET {
            res = endpointResolver.doGet();
          }
          when POST {
            res = endpointResolver.doPost();
          }
          when PUT {
            res = endpointResolver.doPut();
          }
          when PATCH {
            res = endpointResolver.doPatch();
          }
          when DEL {
            res = endpointResolver.doDelete();
          }
        }
      }
    } catch (CoreLibs_ApiExceptions.ApiException e) {
      Database.rollback(sp);
      res = new CoreLibs_ApiErrorResponse(e);
      this.errorOccured = true;
    } catch (Exception e) {
      Database.rollback(sp);
      res = new CoreLibs_ApiErrorResponse(new CoreLibs_ApiExceptions.InternalServerErrorException(e.getMessage()));
      this.errorOccured = true;
    } finally {
      RestContext.response = res.toResponse();
      if (shouldSaveApiRequest) {
        this.saveApiRequest();
      }
      if (errorOccured) {
        CoreLibs_Services.logger.error(resolverLabel, this.getLog());
      } else {
        CoreLibs_Services.logger.info(resolverLabel, this.getLog());
      }
    }
  }

  /**
   * @description Returns an api response for an existing request if it exists
   * @return Response if record exists, null if it does not or the key is blank
   */
  @TestVisible
  private CoreLibs_IApiResponse getResponseForExistingRequest() {
    // we don't want to openup this record to end/integration users
    // so run this query in system mode
    Boolean isFlsEnabled = CoreLibs_DataSettings.getInstance().isFlsEnforced();
    CoreLibs_DataSettings.getInstance().disableFls();
    String idempotencyKey = this.getIdempotencyKey();
    if (String.isBlank(idempotencyKey)) {
      return null;
    }
    CoreLibs_IdempotentEntrySelector entrySelector = (CoreLibs_IdempotentEntrySelector) CoreLibs_Factories.selector.create(
        CoreLibs_IdempotentEntrySelector.class
      )
      .setFields(
        new List<Schema.SObjectField>{
          CoreLibs_IdempotentEntry__c.IdempotencyKey__c,
          CoreLibs_IdempotentEntry__c.HttpMethod__c,
          CoreLibs_IdempotentEntry__c.Url__c,
          CoreLibs_IdempotentEntry__c.ResponseBody__c,
          CoreLibs_IdempotentEntry__c.ResponseHeaders__c,
          CoreLibs_IdempotentEntry__c.ResponseStatusCode__c
        }
      );
    List<CoreLibs_IdempotentEntry__c> entry = entrySelector.getByIdempotencyKey(new Set<String>{ idempotencyKey });
    if (isFlsEnabled) {
      CoreLibs_DataSettings.getInstance().enableFls();
    }
    if (!entry.isEmpty()) {
      this.hasIdempotentResponse = true;
    }
    return (entry.isEmpty()) ? null : new CoreLibs_IdempotentApiResponse(entry[0]);
  }

  /**
   * @description Saves an Api Request with the provided idempotency key and metadata
   * @param metadata Additional information to save for the request -- must be serializable
   */
  @TestVisible
  private void saveApiRequest() {
    String idempotencyKey = this.getIdempotencyKey();
    if (String.isBlank(idempotencyKey)) {
      return;
    }
    // we don't want to openup this record to end/integration users
    // so run this query in system mode
    Boolean isFlsEnabled = CoreLibs_DataSettings.getInstance().isFlsEnforced();
    CoreLibs_DataSettings.getInstance().disableFls();
    CoreLibs_IdempotentEntry__c entry = new CoreLibs_IdempotentEntry__c(
      HttpMethod__c = RestContext.request.httpMethod,
      Url__c = RestContext.request.requestUri,
      IdempotencyKey__c = RestContext.request.headers.get(IDEMPOTENCY_KEY),
      ResponseStatusCode__c = String.valueOf(RestContext.response.statusCode),
      ResponseHeaders__c = JSON.serialize(RestContext.response.headers),
      ResponseBody__c = RestContext.response.responseBody.toString()
    );
    CoreLibs_Services.dml.insertRecord(entry);
    if (isFlsEnabled) {
      CoreLibs_DataSettings.getInstance().enableFls();
    }
  }

  /**
   * @description Helper to return idempotency key header
   * @return Key value if it exists, null otherwise
   */
  @TestVisible
  private String getIdempotencyKey() {
    return RestContext.request?.headers.get(IDEMPOTENCY_KEY);
  }

  // Note we may want to move this to another async method if perf is probelmatic for endpoints
  @TestVisible
  private Map<String, Object> getLog() {
    Map<String, Object> log = new Map<String, Object>();
    log.put(
      'request',
      new Map<String, Object>{
        'uri' => RestContext.request.requestURI,
        'body' => RestContext.request.requestBody?.toString(),
        'headers' => RestContext.request.headers
      }
    );
    log.put(
      'response',
      new Map<String, Object>{
        'idempotentResponse' => this.hasIdempotentResponse,
        'statusCode' => RestContext.response.statusCode,
        'body' => RestContext.response.responseBody?.toString(),
        'headers' => RestContext.response.headers
      }
    );
    return log;
  }
}
