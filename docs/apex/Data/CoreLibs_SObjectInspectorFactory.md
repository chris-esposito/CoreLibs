---
layout: default
---
# CoreLibs_SObjectInspectorFactory

Factory for producing SObject inspectors -- should be invoked from the CoreLibs_Factories class
in order to support mocking


**Author** Tom Wilkins


**Group** Data

## Methods
### `public CoreLibs_SObjectInspector create(Schema sObjType)`

Creates an inspector class for the provided type

#### Parameters

|Param|Description|
|---|---|
|`sObjType`|The type of SObject to create the inspector for|

#### Returns

|Type|Description|
|---|---|
|`CoreLibs_SObjectInspector`|Inspector instance|

### `public CoreLibs_SObjectInspector create(String sObjType)`

Creates an inspector class for the provided type

#### Parameters

|Param|Description|
|---|---|
|`sObjType`|The type of SObject as a string to create the inspector for|

#### Returns

|Type|Description|
|---|---|
|`CoreLibs_SObjectInspector`|Inspector instance|

---
