/**
 * @description Reflection class for objects in Apex
 * @author Tom Wilkins
 * @group Env
 */
public inherited sharing class CoreLibs_ObjectInspector {
  @TestVisible
  private Object obj;

  /**
   * @description Constructor
   * @param obj The object to inspect
   */
  public CoreLibs_ObjectInspector(Object obj) {
    this.obj = obj;
  }

  /**
   * @description Returns the class name of the object being inspected
   * Note this only works for classes that not have overridden the toString method
   * @return Name of the apex class being inspected
   */
  public String getClassName() {
    return String.valueOf(this.obj).split(':')[0];
  }

  /**
   * @description Returns the class type of the object being inspected
   * Note this only works for classes that not have overridden the toString method
   * @return Type of the apex class being inspected
   */
  public System.Type getClassType() {
    return System.Type.forName(this.getClassName());
  }
}
