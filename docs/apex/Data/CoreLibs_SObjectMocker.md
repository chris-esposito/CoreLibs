---
layout: default
---
# CoreLibs_SObjectMocker

`ISTEST`

Mocking utility for generating mock and test data


**Author** Tom Wilkins


**Group** Data

## Constructors
### `public CoreLibs_SObjectMocker(Schema sObjType)`

Constructor

#### Parameters

|Param|Description|
|---|---|
|`sObjType`|The type of SObject that should be mocked by this instance|

### `public CoreLibs_SObjectMocker(Schema sObjType, System sObjClassType)`

Constructor - both schema nd system types

#### Parameters

|Param|Description|
|---|---|
|`sObjtType`|The type of SObject that should be mocked by this instance|
|`sObjClassType`|The class of the SObject -- should make the SObject type|

---
## Methods
### `public Id generateMockId()`

Generates a mock Id for the mocked sobject

#### Returns

|Type|Description|
|---|---|
|`Id`|Mocked Id|

### `public CoreLibs_SObjectMocker shouldGenerateIds(Boolean generateIds)`

Sets whether or not generated records should also have mocked ids generated and set

#### Parameters

|Param|Description|
|---|---|
|`generateIds`|Whether or not the mocker should generate ids|

#### Returns

|Type|Description|
|---|---|
|`CoreLibs_SObjectMocker`|Referent to the invoking object|

### `public CoreLibs_SObjectMocker setRelatedList(String relatedListName, List<SObject> relatedListRecords)`

Sets a related list that will be created with each generated SObject

#### Parameters

|Param|Description|
|---|---|
|`relatedListname`|API name for the related list|
|`relatedListRecords`|Records to be set to the related list|

#### Returns

|Type|Description|
|---|---|
|`CoreLibs_SObjectMocker`|Reference to the invoking object|

### `public SObject generateRecord()`

Generates a single record for the mocked sobject type

#### Returns

|Type|Description|
|---|---|
|`SObject`|Mocked SObject record|

### `public SObject generateRecord(Map<Schema.SObjectField,Object> fieldValues)`

Generates a single record with the applied field values

#### Parameters

|Param|Description|
|---|---|
|`fieldValues`|Field values to apply to the record|

#### Returns

|Type|Description|
|---|---|
|`SObject`|Mocked SObject record|

### `public List<SObject> generateRecords(Integer numOfRecords)`

Generates a determined number of mocked records

#### Parameters

|Param|Description|
|---|---|
|`numOfRecords`|Number of records to generate|

#### Returns

|Type|Description|
|---|---|
|`List<SObject>`|Mocked records|

### `public List<SObject> generateRecords(Map<Schema.SObjectField,Object> fieldValues, Integer numOfRecords)`

Generates a determined number of mocked records with applied field values

#### Parameters

|Param|Description|
|---|---|
|`fieldValues`|Field values to apply to the record|
|`numOfRecords`|Number of records to generate|

#### Returns

|Type|Description|
|---|---|
|`List<SObject>`|Mocked records|

---
