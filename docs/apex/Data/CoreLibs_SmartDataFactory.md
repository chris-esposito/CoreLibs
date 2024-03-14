---
layout: default
---
# CoreLibs_SmartDataFactory

`ISTEST`

Flexible data factory for generating data with required fields generated with some reasonable value


**Author** Tom Wilkins


**Group** Data

## Methods
### `public List<SObject> createSObjects(Schema sObjType, Map<Schema.SObjectField,Object> fieldValues, Integer numOfRecords)`

Generates SObjects (not inserted) for the provided SObject inputs

#### Parameters

|Param|Description|
|---|---|
|`sObjType`|Type of SObject to make records for|
|`fieldValues`|Field -> value mapping to set on each record|
|`numOfRecords`|Numbe of records to generate|

#### Returns

|Type|Description|
|---|---|
|`List<SObject>`|List of generated, not inserted|

### `public List<SObject> createSObjects(Schema sObjType, Integer numOfRecords)`

Generates SObjects (not inserted) for the provided SObject inputs

#### Parameters

|Param|Description|
|---|---|
|`sObjType`|Type of SObject to make records for|
|`numOfRecords`|Numbe of records to generate|

#### Returns

|Type|Description|
|---|---|
|`List<SObject>`|List of generated, not inserted|

---
