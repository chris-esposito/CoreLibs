/**
 * @description Base interface for mocking methods
 * @author Tom Wilkins
 * @group Core
 */
public interface CoreLibs_IMethodMock {
  /**
   * @description executes the intended mock behavior. If a method returns void, then simply return null from the function
   * @param args Args that were passed into the method invocation
   * @return Object the object to be returned, null for void
   */
  Object execute(List<Object> args);
}
