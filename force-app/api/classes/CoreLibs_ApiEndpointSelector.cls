/**
 * @description Data selector class for Api_Endpoint__mdt custom metadata
 * @author Tom Wilkins
 * @group Api
 */
public inherited sharing class CoreLibs_ApiEndpointSelector extends CoreLibs_BaseSelector {
  public override Schema.SObjectType getSObjectType() {
    return CoreLibs_ApiEndpoint__mdt.getSObjectType();
  }

  public override List<SObject> getAll() {
    return CoreLibs_ApiEndpoint__mdt.getAll().values();
  }
}
