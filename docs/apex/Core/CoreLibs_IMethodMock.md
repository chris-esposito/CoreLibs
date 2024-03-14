---
layout: default
---
# CoreLibs_IMethodMock

Base interface for mocking methods


**Author** Tom Wilkins


**Group** Core

## Methods
### `public Object execute(List<Object> args)`

executes the intended mock behavior. If a method returns void, then simply return null from the function

#### Parameters

|Param|Description|
|---|---|
|`args`|Args that were passed into the method invocation|

#### Returns

|Type|Description|
|---|---|
|`Object`|Object the object to be returned, null for void|

---
