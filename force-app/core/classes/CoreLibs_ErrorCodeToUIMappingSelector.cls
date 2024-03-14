/**
 * @description Data access class for the CoreLibs_ErrorCodeToUIMessageMapping__mdt object
 * @author Tom Wilkins
 */
public inherited sharing class CoreLibs_ErrorCodeToUIMappingSelector extends CoreLibs_BaseSelector {
  public override Schema.SObjectType getSObjectType() {
    return CoreLibs_ErrorCodeToUIMessageMapping__mdt.getSObjectType();
  }

  /**
   * @description Returns the relevant mappings for the provided error codes
   * @param errorCodes error codes to retrieve mappings fr
   * @return Results from the query
   */
  public List<CoreLibs_ErrorCodeToUIMessageMapping__mdt> getByErrorCodes(Set<String> errorCodes) {
    return (List<CoreLibs_ErrorCodeToUIMessageMapping__mdt>) Database.query(
      this.buildQueryString('ErrorCode__c IN :errorCodes')
    );
  }
}
