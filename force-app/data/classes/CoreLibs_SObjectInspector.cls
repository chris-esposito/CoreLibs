/**
 * @description Reflection class for inspecting an SObject
 * @author Tom Wilkins
 * @group Data
 */
public inherited sharing class CoreLibs_SObjectInspector {
  @TestVisible
  private Schema.SObjectType sObjType;

  @TestVisible
  private Schema.DescribeSObjectResult describeResult {
    get {
      if (this.describeResult == null) {
        this.describeResult = this.sObjType.getDescribe();
      }
      return this.describeResult;
    }
    set;
  }

  /**
   * @description Constructor
   * @param sObjType The type of SObject to inspect
   */
  public CoreLibs_SObjectInspector(Schema.SObjectType sObjType) {
    this.sObjType = sObjType;
  }

  /**
   * @description Constructor
   * @param sObjType The type of SObject to inspect
   */
  public CoreLibs_SObjectInspector(String sObjType) {
    this.sObjType = ((SObject) Type.forName(sObjType).newInstance()).getSObjectType();
  }
  /**
   * @description Contructor
   * @param recordId Record id to extract sobject type from
   */
  public CoreLibs_SObjectInspector(Id recordId) {
    this.sObjType = recordId.getSobjectType();
  }

  /**
   * @description Returns all fields for the SObject type being inspected
   * @return List of all fields for the SObject
   */
  public List<Schema.SObjectField> getAllFields() {
    return this.describeResult.fields.getMap().values();
  }

  /**
   * @description Returns a single field for the SObject type being inspected
   * @param fieldName Name of the field to retrieve
   * @return Field captured by provided field name, null if invalid field
   */
  public Schema.SObjectField getField(String fieldName) {
    return this.describeResult.fields.getMap().get(fieldName);
  }

  /**
   * @description Returns the picklist values for the provided field name
   * @param fieldName The name of the field to retrieve picklist values for
   * @return List of picklist entries, null if the field is not valid for the SObject
   */
  public List<Schema.PicklistEntry> getPicklistValues(String fieldName) {
    return this.describeResult.fields.getMap().get(fieldName)?.getDescribe().getPicklistValues();
  }

  /**
   * @description Returns the picklist values for the provided field
   * @param field Field to retrieve picklist values for
   * @return List of picklist entries
   */
  public List<Schema.PicklistEntry> getPicklistValues(Schema.SObjectField field) {
    return field.getDescribe().getPicklistValues();
  }

  /**
   * @description Returns the record type Id for the provided developer name
   * @param recordTypeDevName The Developer name of the record type to get the Id for
   * @return Record type Id if the SObject being inspected has a valid record type for the provided dev name, null otherwise
   */
  public Id getRecordTypeId(String recordTypeDevName) {
    return this.describeResult.getRecordTypeInfosByDeveloperName()?.get(recordTypeDevName)?.getRecordTypeId();
  }

  /**
   * @description Returns the record type developer name for the provided record type id
   * @param recordTypeId Id of the record type to retrieve the developer name for
   * @return Record type developer name if the SObject being inspected has a valid record type for the provided id, null otherwise
   */
  public String getRecordTypeDeveloperName(Id recordTypeId) {
    return this.describeResult.getRecordTypeInfosById()?.get(recordTypeId)?.getDeveloperName();
  }

  /**
   * @description Returns whether or not the current user can delete the SObject being inspected
   * @return True if can delete, false otherwise
   */
  public Boolean canDelete() {
    return this.describeResult.isDeletable();
  }

  /**
   * @description returns a field set on the SObject being inspected
   * @param fieldSetName The name of the field set to retrieve
   * @return The field set if it exists, null otherwise
   */
  public Schema.FieldSet getFieldSet(String fieldSetName) {
    return this.describeResult.fieldsets?.getMap()?.get(fieldSetName);
  }

  /**
   * @description Returns the SObject id prefix for the SObject being inspected
   * @return SObject Id prefix
   */
  public String getPrefix() {
    return this.describeResult.getKeyPrefix();
  }

  /**
   * @description SObject type getter
   * @return SObject type being inspected
   */
  public Schema.SObjectType getSObjectType() {
    return this.sObjType;
  }
}
