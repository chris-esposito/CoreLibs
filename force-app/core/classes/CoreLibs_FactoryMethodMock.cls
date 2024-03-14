/**
 * @description Method mock for mocking classes returned from factories
 * @author Tom Wilkins
 * @group Core
 */
@IsTest
public inherited sharing class CoreLibs_FactoryMethodMock implements CoreLibs_IMethodMock {
  @TestVisible
  private CoreLibs_ClassMocker mocker;

  /**
   * @description Constructor
   * @param mocker Mocker to be returned from the factory
   */
  public CoreLibs_FactoryMethodMock(CoreLibs_ClassMocker mocker) {
    this.mocker = mocker;
  }

  /**
   * @description Returns a mock from the factory
   * @see {@link CoreLibs_IMethodMock}
   */
  public Object execute(List<Object> args) {
    if (args[0] instanceof System.Type) {
      return System.Test.createStub((System.Type) args[0], this.mocker);
    } else if (args[0] instanceof Schema.SObjectType) {
      // brittle for sobject inspector, we can revisit later if needed to make more robust
      return System.Test.createStub(CoreLibs_SObjectInspector.class, this.mocker);
    }
    return null;
  }
}
