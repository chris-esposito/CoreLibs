/**
 * @description Provided method mock for throwing exceptions
 * @author Tom Wilkins
 * @group Core
 */
@IsTest
public inherited sharing class CoreLibs_ThrowExceptionMethodMock implements CoreLibs_IMethodMock {
  private Exception exceptionToThrow;
  /**
   * @description Constructor
   * @param exceptionToThrow [Exception](https://developer.salesforce.com/docs/atlas.en-us.apexref.meta/apexref/apex_classes_exception_methods.htm) to be thrown in the execute invocation
   */
  public CoreLibs_ThrowExceptionMethodMock(Exception exceptionToThrow) {
    this.exceptionToThrow = exceptionToThrow;
  }
  /**
   * @description Throws the injected exception
   */
  public Object execute(List<Object> args) {
    throw this.exceptionToThrow;
  }
}
