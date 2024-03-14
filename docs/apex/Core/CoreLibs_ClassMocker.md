---
layout: default
---
# CoreLibs_ClassMocker

`ISTEST`

Class mocker class for mocking dependencies in apex


**Implemented types**

[System.StubProvider](System.StubProvider)


**Author** Tom Wilkins


**Group** Core

## Methods
### `public Object generateStub(System stubClass)`

Generates the mock stub that can be assigned

#### Parameters

|Param|Description|
|---|---|
|`stubClass`|Class to be stubbed|

#### Returns

|Type|Description|
|---|---|
|`Object`|Mocked stub|

### `public CoreLibs_ClassMocker whenInvoking(String methodName)`

Sets the method to be mocked and must be called first in the mocking chain

#### Parameters

|Param|Description|
|---|---|
|`methodName`|Name of the method to mock|

#### Returns

|Type|Description|
|---|---|
|`CoreLibs_ClassMocker`|Reference to the invoking object|

#### Throws

|Exception|Description|
|---|---|
|`CoreLibs_CoreExceptions`|.TestSetupException [CoreLibs_CoreExceptions.TestSetupException](CoreLibs_CoreExceptions.TestSetupException)|

### `public CoreLibs_ClassMocker fromClass(System classType)`

Sets the class that mocked method must be invoked from -- this is optional and is only necessary when mocking classes that have the same method names across classes

#### Parameters

|Param|Description|
|---|---|
|`classType`|[System.Type](https://developer.salesforce.com/docs/atlas.en-us.apexref.meta/apexref/apex_methods_system_type.htm) type of class to mock method for|

#### Returns

|Type|Description|
|---|---|
|`CoreLibs_ClassMocker`|Reference to the invoking object|

#### Throws

|Exception|Description|
|---|---|
|`CoreLibs_CoreExceptions`|.TestSetupException [CoreLibs_CoreExceptions.TestSetupException](CoreLibs_CoreExceptions.TestSetupException)|

### `public CoreLibs_ClassMocker withArgs(List<Object> input)`

Sets the args that mocked method must use -- this is optional and not calling this method will result in the mock being exececuted for all inputs

#### Parameters

|Param|Description|
|---|---|
|`input`|List of inputs to be captured for the method mock|

#### Returns

|Type|Description|
|---|---|
|`CoreLibs_ClassMocker`|Reference to the invoking object|

#### Throws

|Exception|Description|
|---|---|
|`CoreLibs_CoreExceptions`|.TestSetupException [CoreLibs_CoreExceptions.TestSetupException](CoreLibs_CoreExceptions.TestSetupException)|

### `public CoreLibs_ClassMocker thenReturn(Object value)`

Sets the return value for the method being mocked -- this should be the last method called as it resets the stubbing for the next method to be mocked

#### Parameters

|Param|Description|
|---|---|
|`value`|Return value of the mocked method|

#### Returns

|Type|Description|
|---|---|
|`CoreLibs_ClassMocker`|Reference to the invoking object|

#### Throws

|Exception|Description|
|---|---|
|`CoreLibs_CoreExceptions`|.TestSetupException [CoreLibs_CoreExceptions.TestSetupException](CoreLibs_CoreExceptions.TestSetupException)|

### `public CoreLibs_ClassMocker thenReturnInvokingObject(Type mockedClass)`

Sets to return the invoking object, useful for fluent interface setups

#### Returns

|Type|Description|
|---|---|
|`CoreLibs_ClassMocker`|Reference to the invoking object|

### `public CoreLibs_ClassMocker thenDoNothing()`

Convenience function for stubbing out a method to do nothing

#### Returns

|Type|Description|
|---|---|
|`CoreLibs_ClassMocker`|Reference to the invoking object|

#### Throws

|Exception|Description|
|---|---|
|`CoreLibs_CoreExceptions`|.TestSetupException [CoreLibs_CoreExceptions.TestSetupException](CoreLibs_CoreExceptions.TestSetupException)|

### `public CoreLibs_ClassMocker thenThrow(Exception e)`

Sets the exception to be thrown for the method being mocked -- this should be the last method called as it resets the stubbing for the next method to be mocked

#### Parameters

|Param|Description|
|---|---|
|`e`|Exception to be thrown from the mocked method|

#### Returns

|Type|Description|
|---|---|
|`CoreLibs_ClassMocker`|Reference to the invoking object|

#### Throws

|Exception|Description|
|---|---|
|`CoreLibs_CoreExceptions`|.TestSetupException [CoreLibs_CoreExceptions.TestSetupException](CoreLibs_CoreExceptions.TestSetupException)|

### `public CoreLibs_ClassMocker thenExecute(CoreLibs_IMethodMock methodMock)`

Allows custom behavior for the method being mocked -- this should be the last method called as it resets the stubbing for the next method to be mocked

#### Parameters

|Param|Description|
|---|---|
|`methodMock`|The behavior for the mocked method|

#### Returns

|Type|Description|
|---|---|
|`CoreLibs_ClassMocker`|Reference to the invoking object|

#### Throws

|Exception|Description|
|---|---|
|`CoreLibs_CoreExceptions`|.TestSetupException [CoreLibs_CoreExceptions.TestSetupException](CoreLibs_CoreExceptions.TestSetupException)|

### `public CoreLibs_ClassMocker expectMethod(String methodName)`

Sets the method to use for assertions

#### Parameters

|Param|Description|
|---|---|
|`methodName`|Name of the method to use for assertions|

#### Returns

|Type|Description|
|---|---|
|`CoreLibs_ClassMocker`|Reference to the invoking object|

### `public void toHaveBeenCalled()`

Asserts that the established method has been called at least once

#### Throws

|Exception|Description|
|---|---|
|`CoreLibs_CoreExceptions`|.TestSetupException [CoreLibs_CoreExceptions.TestSetupException](CoreLibs_CoreExceptions.TestSetupException)|

### `public void toHaveBeenCalled(Integer count)`

Asserts that the established method has been the injected number of times

#### Parameters

|Param|Description|
|---|---|
|`count`|Number of times to assert method has been called|

#### Throws

|Exception|Description|
|---|---|
|`CoreLibs_CoreExceptions`|.TestSetupException [CoreLibs_CoreExceptions.TestSetupException](CoreLibs_CoreExceptions.TestSetupException)|

### `public Object handleMethodCall(Object stubbedObject, String stubbedMethodName, Type returnType, List<Type> listOfParamTypes, List<String> listOfParamNames, List<Object> listOfArgs)`

Will execute the appropriate mocked behavior based on how the method mock was set up


**See** [[System.StubProvider](https://developer.salesforce.com/docs/atlas.en-us.apexref.meta/apexref/apex_interface_System_StubProvider.htm)]([System.StubProvider](https://developer.salesforce.com/docs/atlas.en-us.apexref.meta/apexref/apex_interface_System_StubProvider.htm))

---
