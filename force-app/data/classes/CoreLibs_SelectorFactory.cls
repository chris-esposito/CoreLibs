/**
 * @description Factory class for producing selectors to allow decoupling of construction
 * and utilization
 * @author Tom Wilkins
 * @group Data
 */
public inherited sharing class CoreLibs_SelectorFactory {
  /**
   * @description Creates the selector established by the provided type and
   * casts it to a selector. Will throw a runtime exception if the type provided is not
   * a concrete selector class
   */
  public CoreLibs_BaseSelector create(Type selectorType) {
    return (CoreLibs_BaseSelector) selectorType.newInstance();
  }
}
