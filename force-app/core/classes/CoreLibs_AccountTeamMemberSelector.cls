/**
 * @description Data access class for Account Team Members
 * @author Tom Wilkins
 * @group Core
 */
public inherited sharing class CoreLibs_AccountTeamMemberSelector extends CoreLibs_BaseSelector {
  public override Schema.SObjectType getSObjectType() {
    return AccountTeamMember.getSObjectType();
  }
}
