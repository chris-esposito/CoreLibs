/**
 * @description Resolves a given Url to the appropriate API service resolver
 * @author Tom Wilkins
 * @group API
 */
public inherited sharing class CoreLibs_ApiUrlResolver {
  @TestVisible
  private static final String ENDPOINT_NOT_FOUND = 'Endpoint: {0} not found.';
  @TestVisible
  private RestRequest req;

  /**
   * @description Constructor
   * @param req The RestRequest to process
   */
  public CoreLibs_ApiUrlResolver(RestRequest req) {
    this.req = req;
  }

  /**
   * @description Evalutes the url against configured resolvers and returns the resolver if found
   * @return ApiEndpointResolver
   * @throw {@link CoreLibs_ApiExceptions.NotFoundException} if the resolver does not exist
   */
  public CoreLibs_ApiEndpointResolver resolve() {
    CoreLibs_ApiEndpointSelector selector = (CoreLibs_ApiEndpointSelector) CoreLibs_Factories.selector.create(
        CoreLibs_ApiEndpointSelector.class
      )
      .setFields(
        new List<Schema.SObjectField>{
          CoreLibs_ApiEndpoint__mdt.EndpointRegex__c,
          CoreLibs_ApiEndpoint__mdt.ResolverClassName__c
        }
      );
    for (CoreLibs_ApiEndpoint__mdt endpoint : (List<CoreLibs_ApiEndpoint__mdt>) selector.getAll()) {
      if (Pattern.matches(endpoint.EndpointRegex__c, this.req.requestURI)) {
        return ((CoreLibs_ApiEndpointResolver) Type.forName(endpoint.ResolverClassName__c).newInstance())
          .setRequest(req);
      }
    }
    throw new CoreLibs_ApiExceptions.NotFoundException(
      String.format(ENDPOINT_NOT_FOUND, new List<String>{ this.req.requestURI })
    );
  }
}
