/**
 * @description Controller for leverage with team viewer components
 */
public with sharing class CoreLibs_TeamViewerController {
  @AuraEnabled
  public static List<GetTeamViewerColumn> getTeamViewerColumns(String sObjType, String fieldSetName) {
    try {
      Schema.FieldSet fields = CoreLibs_Factories.sObjectInspector.create(sObjType).getFieldSet(fieldSetName);
      List<GetTeamViewerColumn> results = new List<GetTeamViewerColumn>();
      for (Schema.FieldSetMember member : fields.getFields()) {
        results.add(new GetTeamViewerColumn(member.getLabel(), member.getFieldPath(), member.getType()));
      }
      return results;
    } catch (Exception e) {
      CoreLibs_Services.logger.error('CoreLibs_TeamViewerController.getTeamViewerColumns', e);
      throw CoreLibs_Services.errors.buildUIException(e);
    }
  }

  @AuraEnabled
  public static GetTeamMemberResult getTeamMembers(Id recordId, String sObjType, String fieldSetName) {
    try {
      return new GetTeamMemberResult(
        recordId,
        sObjType,
        CoreLibs_Services.teamMembers.getTeamMembers(
          recordId,
          CoreLibs_Factories.sObjectInspector.create(sObjType)?.getSObjectType(),
          fieldSetName
        )
      );
    } catch (Exception e) {
      CoreLibs_Services.logger.error('CoreLibs_TeamViewerController.getTeamMembers', e);
      throw CoreLibs_Services.errors.buildUIException(e);
    }
  }

  public inherited sharing class GetTeamViewerColumn {
    @AuraEnabled
    public String label { get; set; }
    @AuraEnabled
    public String apiName { get; set; }
    @AuraEnabled
    public String type { get; set; }

    public GetTeamViewerColumn(String label, String apiName, Schema.DisplayType type) {
      this.label = label;
      this.apiName = apiName;
      this.type = type.name();
    }
  }

  public inherited sharing class GetTeamMemberResult {
    @AuraEnabled
    public Id recordId { get; set; }
    @AuraEnabled
    public String sObjType { get; set; }
    @AuraEnabled
    public List<SObject> records { get; set; }

    public GetTeamMemberResult(Id recordId, String sObjType, List<SObject> records) {
      this.recordId = recordId;
      this.sObjType = sObjType;
      this.records = records;
    }
  }
}
