/**
 * @description Services class for exposing factories for generating CoreLibs objects
 * @author Tom Wilkins
 * @group Core
 */
public inherited sharing class CoreLibs_Factories {
  @TestVisible
  public static CoreLibs_SObjectInspectorFactory sObjectInspector {
    get {
      if (sObjectInspector == null) {
        sObjectInspector = new CoreLibs_SObjectInspectorFactory();
      }
      return sObjectInspector;
    }
    private set;
  }
  @TestVisible
  public static CoreLibs_SelectorFactory selector {
    get {
      if (selector == null) {
        selector = new CoreLibs_SelectorFactory();
      }
      return selector;
    }
    set;
  }
}
