/**
 * @description Data access class for idempotent keys
 * @author Tom Wilkins
 * @group Api
 */
public inherited sharing class CoreLibs_IdempotentEntrySelector extends CoreLibs_BaseSelector {
  public override Schema.SObjectType getSObjectType() {
    return CoreLibs_IdempotentEntry__c.getSObjectType();
  }

  /**
   * @description Returns requests by their idempotency keys
   * @param idempotencyKeys Request keys to filter on
   * @return List of api requests
   */
  public List<CoreLibs_IdempotentEntry__c> getByIdempotencyKey(Set<String> idempotencyKeys) {
    return Database.query(this.buildQueryString('IdempotencyKey__c IN :idempotencyKeys'));
  }
}
