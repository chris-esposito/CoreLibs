/**
 * @description Class mocker class for mocking dependencies in apex
 * @author Tom Wilkins
 * @group Core
 */
@IsTest
public inherited sharing class CoreLibs_ClassMocker implements System.StubProvider {
  private static final String SET_METHOD_TO_MOCK_MESSAGE = 'Must set method being mocked via whenInvoking before calling other mocking methods.';
  private static final String SET_METHOD_TO_ASSERT_MESSAGE = 'Must set method to base assertion on via expectMethod before calling assertion methods.';

  private Map<String, CoreLibs_IMethodMock> methodMocks {
    get {
      if (this.methodMocks == null) {
        this.methodMocks = new Map<String, CoreLibs_IMethodMock>();
      }
      return this.methodMocks;
    }
    set;
  }

  private Map<String, Integer> methodCallCount {
    get {
      if (this.methodCallCount == null) {
        this.methodCallCount = new Map<String, Integer>();
      }
      return this.methodCallCount;
    }
    set;
  }

  private String mockKey;
  private String assertMethod;

  /**
   * @description Generates the mock stub that can be assigned
   * @param stubClass Class to be stubbed
   * @return Mocked stub
   */
  public Object generateStub(System.Type stubClass) {
    return System.Test.createStub(stubClass, this);
  }

  /**
   * @description Sets the method to be mocked and must be called first in the mocking chain
   * @param methodName Name of the method to mock
   * @return Reference to the invoking object
   * @throws CoreLibs_CoreExceptions.TestSetupException {@link CoreLibs_CoreExceptions.TestSetupException}
   */
  public CoreLibs_ClassMocker whenInvoking(String methodName) {
    this.mockKey = methodName;
    return this;
  }

  /**
   * @description Sets the class that mocked method must be invoked from -- this is optional
   * and is only necessary when mocking classes that have the same method names across classes
   * @param classType [System.Type](https://developer.salesforce.com/docs/atlas.en-us.apexref.meta/apexref/apex_methods_system_type.htm) type of class to mock method for
   * @return Reference to the invoking object
   * @throws CoreLibs_CoreExceptions.TestSetupException {@link CoreLibs_CoreExceptions.TestSetupException}
   */
  public CoreLibs_ClassMocker fromClass(System.Type classType) {
    this.validateMockKey();
    String classString = String.valueOf(classType);
    this.mockKey = (classString.contains('.') ? classString.split('\\.')[1] : classString) + '.' + this.mockKey;
    return this;
  }

  /**
   * @description Sets the args that mocked method must use -- this is optional
   * and not calling this method will result in the mock being exececuted for all inputs
   * @param input List of inputs to be captured for the method mock
   * @return Reference to the invoking object
   * @throws CoreLibs_CoreExceptions.TestSetupException {@link CoreLibs_CoreExceptions.TestSetupException}
   */
  public CoreLibs_ClassMocker withArgs(List<Object> input) {
    this.validateMockKey();
    this.mockKey += ':' + String.valueOf(input);
    return this;
  }

  /**
   * @description Sets the return value for the method being mocked -- this should be the
   * last method called as it resets the stubbing for the next method to be mocked
   * @param value Return value of the mocked method
   * @return Reference to the invoking object
   * @throws CoreLibs_CoreExceptions.TestSetupException {@link CoreLibs_CoreExceptions.TestSetupException}
   */
  public CoreLibs_ClassMocker thenReturn(Object value) {
    this.validateMockKey();
    this.methodMocks.put(mockKey, new CoreLibs_ReturnValueMethodMock(value));
    this.mockKey = null;
    return this;
  }

  /**
   * @description Sets to return the invoking object, useful for fluent interface setups
   * @return Reference to the invoking object
   */
  public CoreLibs_ClassMocker thenReturnInvokingObject(Type mockedClass) {
    return this.thenReturn(System.Test.createStub(mockedClass, this));
  }

  /**
   * @description Convenience function for stubbing out a method to do nothing
   * @return Reference to the invoking object
   * @throws CoreLibs_CoreExceptions.TestSetupException {@link CoreLibs_CoreExceptions.TestSetupException}
   */
  public CoreLibs_ClassMocker thenDoNothing() {
    return this.thenReturn(null);
  }

  /**
   * @description Sets the exception to be thrown for the method being mocked -- this should be the
   * last method called as it resets the stubbing for the next method to be mocked
   * @param e Exception to be thrown from the mocked method
   * @return Reference to the invoking object
   * @throws CoreLibs_CoreExceptions.TestSetupException {@link CoreLibs_CoreExceptions.TestSetupException}
   */
  public CoreLibs_ClassMocker thenThrow(Exception e) {
    this.validateMockKey();
    this.methodMocks.put(this.mockKey, new CoreLibs_ThrowExceptionMethodMock(e));
    this.mockKey = null;
    return this;
  }

  /**
   * @description Allows custom behavior for the method being mocked -- this should be the
   * last method called as it resets the stubbing for the next method to be mocked
   * @param methodMock The behavior for the mocked method
   * @return Reference to the invoking object
   * @throws CoreLibs_CoreExceptions.TestSetupException {@link CoreLibs_CoreExceptions.TestSetupException}
   */
  public CoreLibs_ClassMocker thenExecute(CoreLibs_IMethodMock methodMock) {
    this.validateMockKey();
    this.methodMocks.put(this.mockKey, methodMOck);
    this.mockKey = null;
    return this;
  }
  /**
   * @description Sets the method to use for assertions
   * @param methodName Name of the method to use for assertions
   * @return Reference to the invoking object
   */
  public CoreLibs_ClassMocker expectMethod(String methodName) {
    this.mockKey = methodName;
    return this;
  }
  /**
   * @description Asserts that the established method has been called at least once
   * @throws CoreLibs_CoreExceptions.TestSetupException {@link CoreLibs_CoreExceptions.TestSetupException}
   */
  public void toHaveBeenCalled() {
    this.validateMockKey();
    System.assert(
      this.methodCallCount.get(this.mockKey) > 0,
      'Expect ' + this.mockKey + ' to be called at least once.'
    );
    this.mockKey = null;
  }

  /**
   * @description Asserts that the established method has been the injected number of times
   * @param count Number of times to assert method has been called
   * @throws CoreLibs_CoreExceptions.TestSetupException {@link CoreLibs_CoreExceptions.TestSetupException}
   */
  public void toHaveBeenCalled(Integer count) {
    this.validateMockKey();
    System.assert(
      this.methodCallCount.get(this.mockKey) == count,
      'Expect ' + this.mockKey + ' to be called ' + count + ' times.'
    );
    this.mockKey = null;
  }

  /**
   * @description Will execute the appropriate mocked behavior based on how the method mock was set up
   * @see [System.StubProvider](https://developer.salesforce.com/docs/atlas.en-us.apexref.meta/apexref/apex_interface_System_StubProvider.htm)
   */
  public Object handleMethodCall(
    Object stubbedObject,
    String stubbedMethodName,
    Type returnType,
    List<Type> listOfParamTypes,
    List<String> listOfParamNames,
    List<Object> listOfArgs
  ) {
    String apexClassString = String.valueOf(stubbedObject)
      .substring(0, String.valueOf(stubbedObject).indexOf('__sfdc_ApexStub'));
    String argsString = String.valueOf(listOfArgs);
    // order: Class.method.args -> method.args -> class.method -> method
    List<String> keysToCheck = new List<String>{
      apexClassString +
      '.' +
      stubbedMethodName +
      ':' +
      argsString,
      stubbedMethodName +
      ':' +
      argsString,
      apexClassString +
      '.' +
      stubbedMethodName,
      stubbedMethodName
    };
    CoreLibs_IMethodMock methodMock;
    for (String key : keysToCheck) {
      Integer callCount = methodCallCount.containsKey(key) ? methodCallCount.get(key) : 0;
      methodCallCount.put(key, ++callCount);
      if (this.methodMocks.containsKey(key)) {
        methodMock = this.methodMocks.get(key);
      }
    }
    return methodMock?.execute(listOfArgs);
  }

  /**
   * @description Helper for validating that a method is being mocked prior to interacting with certain methods
   */
  private void validateMockKey() {
    if (String.isBlank(this.mockKey)) {
      throw new CoreLibs_CoreExceptions.TestSetupException(SET_METHOD_TO_MOCK_MESSAGE);
    }
  }
}
