/**
 * @description Flexible data factory for generating data with required fields generated with some reasonable value
 * @author Tom Wilkins
 * @group Data
 */
@IsTest
public inherited sharing class CoreLibs_SmartDataFactory {
  // We can extend this to be configurable in the future
  private static final String DEFAULT_STRING = 'Test String';
  private static final Double DEFAULT_DOUBLE = 12.34;
  private static final Date DEFAULT_DATE = Date.today();
  private static final Datetime DEFAULT_DATETIME = Datetime.now();
  private static final Time DEFAULT_TIME = Time.newInstance(0, 0, 0, 0);
  private static final String DEFAULT_EMAIL = 'test@corelibs.com';
  private static final Integer DEFAULT_INTEGER = 42;
  private static final String DEFAULT_PHONE = '555-555-5555';
  private static final Boolean DEFAULT_BOOLEAN = false;
  private static final String DEFAULT_URL = 'https://tests.corelibs.com';

  private static final Map<Schema.DisplayType, Object> DEFAULT_MAPPINGS = new Map<Schema.DisplayType, Object>{
    Schema.DisplayType.BASE64 => Blob.valueOf(DEFAULT_STRING),
    Schema.DisplayType.BOOLEAN => DEFAULT_BOOLEAN,
    Schema.DisplayType.COMBOBOX => DEFAULT_STRING,
    Schema.DisplayType.CURRENCY => DEFAULT_DOUBLE,
    Schema.DisplayType.DATE => DEFAULT_DATE,
    Schema.DisplayType.DATETIME => DEFAULT_DATETIME,
    Schema.DisplayType.DOUBLE => DEFAULT_DOUBLE,
    Schema.DisplayType.EMAIL => DEFAULT_EMAIL,
    Schema.DisplayType.ENCRYPTEDSTRING => DEFAULT_STRING,
    Schema.DisplayType.INTEGER => DEFAULT_INTEGER,
    Schema.DisplayType.PERCENT => DEFAULT_DOUBLE,
    Schema.DisplayType.PHONE => DEFAULT_PHONE,
    Schema.DisplayType.STRING => DEFAULT_STRING,
    Schema.DisplayType.TEXTAREA => DEFAULT_STRING,
    Schema.DisplayType.TIME => DEFAULT_TIME,
    Schema.DisplayType.URL => DEFAULT_URL
  };

  /**
   * @description Generates SObjects (not inserted) for the provided SObject inputs
   * @param sObjType Type of SObject to make records for
   * @param fieldValues Field -> value mapping to set on each record
   * @param numOfRecords Numbe of records to generate
   * @return List of generated, not inserted
   */
  public List<SObject> createSObjects(
    Schema.SObjectType sObjType,
    Map<Schema.SObjectField, Object> fieldValues,
    Integer numOfRecords
  ) {
    List<SObject> records = new List<SObject>();
    for (Integer i = 0; i < numOfRecords; i++) {
      records.add(this.applyFieldValues(this.getBaseSObject(sObjType), fieldValues, i));
    }
    return records;
  }

  /**
   * @description Generates SObjects (not inserted) for the provided SObject inputs
   * @param sObjType Type of SObject to make records for
   * @param numOfRecords Numbe of records to generate
   * @return List of generated, not inserted
   */
  public List<SObject> createSObjects(Schema.SObjectType sObjType, Integer numOfRecords) {
    List<SObject> records = new List<SObject>();
    for (Integer i = 0; i < numOfRecords; i++) {
      records.add(this.getBaseSObject(sObjType));
    }
    return records;
  }

  /**
   * @description Returns a base object with default (required) fields populated
   * @param sObjType Type of SObject to generate a base record of
   * @return Basic Sobject with required fields populated with defaults
   */
  @TestVisible
  private SObject getBaseSObject(Schema.SObjectType sObjType) {
    SObject record = sObjType.newSObject();
    for (Schema.SObjectField field : new CoreLibs_SObjectInspector(sObjType).getAllFields()) {
      Schema.DescribeFieldResult fieldDescribe = field.getDescribe();
      if (fieldDescribe.isNillable() || !fieldDescribe.isCreateable() || this.shouldByPassField(field)) {
        continue;
      }
      record.put(String.valueOf(field), this.getDefaultValue(fieldDescribe));
    }
    return record;
  }

  /**
   * @description Helper that gets the default value for a field
   * @param fieldDescribe Field describe used to determine value
   * @return Default value, null if type not supported
   */
  @TestVisible
  private Object getDefaultValue(Schema.DescribeFieldResult fieldDescribe) {
    Schema.DisplayType fieldType = fieldDescribe.getType();
    if (DEFAULT_MAPPINGS.containsKey(fieldType)) {
      return DEFAULT_MAPPINGS.get(fieldType);
    } else if (fieldType == Schema.DisplayType.MULTIPICKLIST || fieldType == Schema.DisplayType.PICKLIST) {
      return this.getDefaultPicklistValue(fieldDescribe);
    }
    return null;
  }

  /**
   * @description Helpers that returns the default picklist value for a field
   * @param fieldDescribe field describe to extract picklist values from
   * @return String picklist value, null if no values found
   */
  @TestVisible
  private String getDefaultPicklistValue(Schema.DescribeFieldResult fieldDescribe) {
    List<Schema.PicklistEntry> entries = fieldDescribe.getPicklistValues();
    String value = entries.isEmpty() ? null : entries[0].getValue();
    for (Schema.PicklistEntry entry : entries) {
      if (entry.isDefaultValue()) {
        if (entry.isDefaultValue()) {
          value = entry.getValue();
          break;
        }
      }
    }
    return value;
  }

  /**
   * @description Helper which applies the provided field values to the provided SObject
   * @param obj The SObject to apply field values to
   * @param fieldValues The values to be applied
   * @param recordNumber The current record number that will be appended to strings
   * @return Record with field values applied
   */
  @TestVisible
  private SObject applyFieldValues(SObject obj, Map<Schema.SObjectField, Object> fieldValues, Integer recordNumber) {
    for (Schema.SObjectField field : fieldValues.keySet()) {
      if (field.getDescribe().getType() == Schema.DisplayType.STRING) {
        obj.put(String.valueOf(field), ((String) fieldValues.get(field) + String.valueOf(recordNumber)));
      } else {
        obj.put(String.valueOf(field), fieldValues.get(field));
      }
    }
    return obj;
  }

  /**
   * @description Helper for determining which fields should be bypassed for whatever reason
   * e.g. ignore owner so we don't run into save errors
   */
  @TestVisible
  private Boolean shouldBypassField(Schema.SObjectField field) {
    String fieldName = String.valueOf(field);
    return fieldName == 'OwnerId';
  }
}
