/**
 * @description Method mock for simply returning values
 * @author Tom Wilkins
 * @group Core
 */
@IsTest
public inherited sharing class CoreLibs_ReturnValueMethodMock implements CoreLibs_IMethodMock {
  private Object returnValue;
  /**
   * @description Constructor
   * @param returnValue value to be returned in the execute invocation
   */
  public CoreLibs_ReturnValueMethodMock(Object returnValue) {
    this.returnValue = returnValue;
  }
  /**
   * @description returns the value injected into the constructor
   * @return Mocked object injected into constructor
   */
  public Object execute(List<Object> args) {
    return this.returnValue;
  }
}
