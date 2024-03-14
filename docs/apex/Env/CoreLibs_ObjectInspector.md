---
layout: default
---
# CoreLibs_ObjectInspector

Reflection class for objects in Apex


**Author** Tom Wilkins


**Group** Env

## Constructors
### `public CoreLibs_ObjectInspector(Object obj)`

Constructor

#### Parameters

|Param|Description|
|---|---|
|`obj`|The object to inspect|

---
## Methods
### `public String getClassName()`

Returns the class name of the object being inspected Note this only works for classes that not have overridden the toString method

#### Returns

|Type|Description|
|---|---|
|`String`|Name of the apex class being inspected|

### `public System getClassType()`

Returns the class type of the object being inspected Note this only works for classes that not have overridden the toString method

#### Returns

|Type|Description|
|---|---|
|`System`|Type of the apex class being inspected|

---
