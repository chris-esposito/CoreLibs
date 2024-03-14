/**
 * @description Mocking utility for generating mock and test data
 * @author Tom Wilkins
 * @group Data
 */
@IsTest
public inherited sharing class CoreLibs_SObjectMocker {
  @TestVisible
  private static Map<Schema.SObjectType, Integer> currentIndex {
    get {
      if (currentIndex == null) {
        currentIndex = new Map<Schema.SObjectType, Integer>();
      }
      return currentIndex;
    }
    set;
  }

  @TestVisible
  private CoreLibs_SmartDataFactory dataFactory {
    get {
      if (this.dataFactory == null) {
        this.dataFactory = new CoreLibs_SmartDataFactory();
      }
      return this.dataFactory;
    }
    set;
  }

  @TestVisible
  private Map<String, List<SObject>> relatedLists {
    get {
      if (this.relatedLists == null) {
        this.relatedLists = new Map<String, List<SObject>>();
      }
      return this.relatedLists;
    }
    set;
  }

  @TestVisible
  private boolean generateIds {
    get {
      if (this.generateIds == null) {
        this.generateIds = false;
      }
      return this.generateIds;
    }
    set;
  }

  @TestVisible
  private Schema.SObjectType sObjType;
  @TestVisible
  System.Type sObjClassType;
  @TestVisible
  private CoreLibs_SObjectInspector inspector;

  /**
   * @description Constructor
   * @param sObjType The type of SObject that should be mocked by this instance
   */
  public CoreLibs_SObjectMocker(Schema.SObjectType sObjType) {
    this(sObjType, null);
  }

  /**
   * @description Constructor - both schema nd system types
   * @param sObjtType The type of SObject that should be mocked by this instance
   * @param sObjClassType The class of the SObject -- should make the SObject type
   */
  public CoreLibs_SObjectMocker(Schema.SObjectType sObjType, System.Type sObjClassType) {
    this.sObjType = sObjType;
    this.inspector = new CoreLibs_SObjectInspector(this.sObjType);
    this.sObjClassType = sObjClassType;
    if (!currentIndex.containsKey(this.sObjType)) {
      currentIndex.put(this.sObjType, 0);
    }
  }

  /**
   * @description Generates a mock Id for the mocked sobject
   * @return Mocked Id
   */
  public Id generateMockId() {
    String result = String.valueOf(currentIndex.get(this.sObjType));
    currentIndex.put(this.sObjType, currentIndex.get(this.sObjType) + 1);
    return this.inspector.getPrefix() + '0'.repeat(12 - result.length()) + result;
  }

  /**
   * @description Sets whether or not generated records should also have mocked ids generated and set
   * @param generateIds Whether or not the mocker should generate ids
   * @return Referent to the invoking object
   */
  public CoreLibs_SObjectMocker shouldGenerateIds(Boolean generateIds) {
    this.generateIds = generateIds;
    return this;
  }

  /**
   * @description Sets a related list that will be created with each generated SObject
   * @param relatedListname API name for the related list
   * @param relatedListRecords Records to be set to the related list
   * @return Reference to the invoking object
   */
  public CoreLibs_SObjectMocker setRelatedList(String relatedListName, List<SObject> relatedListRecords) {
    this.relatedLists.put(relatedListName, relatedListRecords);
    return this;
  }

  /**
   * @description Generates a single record for the mocked sobject type
   * @return Mocked SObject record
   */
  public SObject generateRecord() {
    return this.augmentSObject(this.dataFactory.createSObjects(this.sObjType, 1)[0]);
  }

  /**
   * @description Generates a single record with the applied field values
   * @param fieldValues Field values to apply to the record
   * @return Mocked SObject record
   */
  public SObject generateRecord(Map<Schema.SObjectField, Object> fieldValues) {
    return this.augmentSObject(this.dataFactory.createSObjects(this.sObjType, fieldValues, 1)[0]);
  }

  /**
   * @description Generates a determined number of mocked records
   * @param numOfRecords Number of records to generate
   * @return Mocked records
   */
  public List<SObject> generateRecords(Integer numOfRecords) {
    List<SObject> records = new List<SObject>();
    for (SObject record : this.dataFactory.createSObjects(this.sObjType, numOfRecords)) {
      records.add(this.augmentSObject(record));
    }
    return records;
  }

  /**
   * @description Generates a determined number of mocked records with applied field values
   * @param fieldValues Field values to apply to the record
   * @param numOfRecords Number of records to generate
   * @return Mocked records
   */
  public List<SObject> generateRecords(Map<Schema.SObjectField, Object> fieldValues, Integer numOfRecords) {
    List<SObject> records = new List<SObject>();
    for (SObject record : this.dataFactory.createSObjects(this.sObjType, fieldValues, numOfRecords)) {
      records.add(this.augmentSObject(record));
    }
    return records;
  }

  @TestVisible
  private SObject augmentSObject(SObject record) {
    if (this.generateIds) {
      record.Id = this.generateMockId();
    }
    if (!this.relatedLists.isEmpty()) {
      Map<String, Object> objMap = record.getPopulatedFieldsAsMap().clone();
      for (String relatedList : this.relatedLists.keySet()) {
        objMap.put(
          relatedList,
          new Map<String, Object>{
            'totalSize' => this.relatedLists.get(relatedList).size(),
            'done' => true,
            'records' => this.relatedLists.get(relatedList)
          }
        );
      }
      return (SObject) JSON.deserialize(JSON.serialize(objMap), this.sObjClassType);
    }
    return record;
  }
}
