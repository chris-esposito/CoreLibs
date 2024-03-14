/**
 * @description Invocable action for retrieving feature flag settings in flows
 * @author Tom Wilkins
 * @group Env
 */
public with sharing class CoreLibs_GetFeatureFlagValue {
  @InvocableMethod(label='Get Feature Flag Value' description='Retrieves a feature flag value for use in flows')
  public static List<CoreLibs_GetFeatureFlagValue.Response> execute(
    List<CoreLibs_GetFeatureFlagValue.Request> requests
  ) {
    try {
      List<CoreLibs_GetFeatureFlagValue.Response> responses = new List<CoreLibs_GetFeatureFlagValue.Response>();
      for (CoreLibs_GetFeatureFlagValue.Request req : requests) {
        responses.add(
          new CoreLibs_GetFeatureFlagValue.Response(
            req.featureName,
            CoreLibs_Environment.getInstance().isFeatureOn(req.featureName)
          )
        );
      }
      return responses;
    } catch (exception e) {
      CoreLibs_Services.logger.error('CoreLibs_GetFeatureFlagValue.exeucte', e);
      throw e;
    }
  }

  public inherited sharing class Request {
    @InvocableVariable(
      label='Feature Flag Name'
      description='API name of the custom setting field this feature is dependent on'
      required=true
    )
    public String featureName;
  }

  public inherited sharing class Response {
    @InvocableVariable
    public String featureName;
    @InvocableVariable
    public Boolean value;

    public Response(String featureName, Boolean value) {
      this.featureName = featureName;
      this.value = value;
    }
  }
}
