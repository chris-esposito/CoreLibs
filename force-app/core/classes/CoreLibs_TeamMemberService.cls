/**
 * @description Service layer for managing team members
 * @author Tom Wilkins
 * @group Core
 */
public inherited sharing class CoreLibs_TeamMemberService {
  /**
   * @description Returns the team members for the provided parent record id/team sobject type (e.g. AccountTeamMember)
   * @param recordId Record Id for the parent object the team is for
   * @param sObjType The team sobject type e.g. AccountTeamMember, CaseTeamMember
   * @param fieldSetName The name of the field set that should be used to query fields
   */
  public List<SObject> getTeamMembers(Id recordId, Schema.SObjectType sObjType, String fieldSetName) {
    CoreLibs_SObjectInspector inspector = CoreLibs_Factories.sObjectInspector.create(sObjType);
    List<String> fields = new List<String>();
    for (Schema.FieldSetMember member : inspector.getFieldSet(fieldSetName).getFields()) {
      fields.add(member.fieldpath);
    }
    CoreLibs_BaseSelector teamMemberSelector;
    String filter;
    switch on (String.valueOf(sObjType)) {
      when 'AccountTeamMember' {
        teamMemberSelector = CoreLibs_Factories.selector.create(CoreLibs_AccountTeamMemberSelector.class);
        filter = 'AccountId = :recordId';
      }
    }
    String query = teamMemberSelector.buildQuery(fields, filter);
    return Database.query(query);
  }
}
