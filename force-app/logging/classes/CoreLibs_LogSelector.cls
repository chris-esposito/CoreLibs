/**
 * @description Data access class for the CoreLibs_Log__c SObject
 * @author Tom Wilkins
 * @group Logging
 */
public inherited sharing class CoreLibs_LogSelector extends CoreLibs_BaseSelector {
  public override Schema.SObjectType getSObjectType() {
    return CoreLibs_Log__c.getSObjectType();
  }
}
