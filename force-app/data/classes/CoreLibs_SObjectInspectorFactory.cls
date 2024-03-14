/**
 * @description Factory for producing SObject inspectors -- should be invoked from the CoreLibs_Factories class
 * in order to support mocking
 * @author Tom Wilkins
 * @group Data
 */
public inherited sharing class CoreLibs_SObjectInspectorFactory {
  /**
   * @description Creates an inspector class for the provided type
   * @param sObjType The type of SObject to create the inspector for
   * @return Inspector instance
   */
  public CoreLibs_SObjectInspector create(Schema.SObjectType sObjType) {
    return new CoreLibs_SObjectInspector(sObjType);
  }
  /**
   * @description Creates an inspector class for the provided type
   * @param sObjType The type of SObject as a string to create the inspector for
   * @return Inspector instance
   */
  public CoreLibs_SObjectInspector create(String sObjType) {
    return new CoreLibs_SObjectInspector(sObjType);
  }
}
