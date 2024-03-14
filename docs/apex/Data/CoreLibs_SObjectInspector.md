---
layout: default
---
# CoreLibs_SObjectInspector

Reflection class for inspecting an SObject


**Author** Tom Wilkins


**Group** Data

## Constructors
### `public CoreLibs_SObjectInspector(Schema sObjType)`

Constructor

#### Parameters

|Param|Description|
|---|---|
|`sObjType`|The type of SObject to inspect|

### `public CoreLibs_SObjectInspector(String sObjType)`

Constructor

#### Parameters

|Param|Description|
|---|---|
|`sObjType`|The type of SObject to inspect|

### `public CoreLibs_SObjectInspector(Id recordId)`

Contructor

#### Parameters

|Param|Description|
|---|---|
|`recordId`|Record id to extract sobject type from|

---
## Methods
### `public List<Schema.SObjectField> getAllFields()`

Returns all fields for the SObject type being inspected

#### Returns

|Type|Description|
|---|---|
|`List<Schema.SObjectField>`|List of all fields for the SObject|

### `public Schema getField(String fieldName)`

Returns a single field for the SObject type being inspected

#### Parameters

|Param|Description|
|---|---|
|`fieldName`|Name of the field to retrieve|

#### Returns

|Type|Description|
|---|---|
|`Schema`|Field captured by provided field name, null if invalid field|

### `public List<Schema.PicklistEntry> getPicklistValues(String fieldName)`

Returns the picklist values for the provided field name

#### Parameters

|Param|Description|
|---|---|
|`fieldName`|The name of the field to retrieve picklist values for|

#### Returns

|Type|Description|
|---|---|
|`List<Schema.PicklistEntry>`|List of picklist entries, null if the field is not valid for the SObject|

### `public List<Schema.PicklistEntry> getPicklistValues(Schema field)`

Returns the picklist values for the provided field

#### Parameters

|Param|Description|
|---|---|
|`field`|Field to retrieve picklist values for|

#### Returns

|Type|Description|
|---|---|
|`List<Schema.PicklistEntry>`|List of picklist entries|

### `public Id getRecordTypeId(String recordTypeDevName)`

Returns the record type Id for the provided developer name

#### Parameters

|Param|Description|
|---|---|
|`recordTypeDevName`|The Developer name of the record type to get the Id for|

#### Returns

|Type|Description|
|---|---|
|`Id`|Record type Id if the SObject being inspected has a valid record type for the provided dev name, null otherwise|

### `public String getRecordTypeDeveloperName(Id recordTypeId)`

Returns the record type developer name for the provided record type id

#### Parameters

|Param|Description|
|---|---|
|`recordTypeId`|Id of the record type to retrieve the developer name for|

#### Returns

|Type|Description|
|---|---|
|`String`|Record type developer name if the SObject being inspected has a valid record type for the provided id, null otherwise|

### `public Boolean canDelete()`

Returns whether or not the current user can delete the SObject being inspected

#### Returns

|Type|Description|
|---|---|
|`Boolean`|True if can delete, false otherwise|

### `public Schema getFieldSet(String fieldSetName)`

returns a field set on the SObject being inspected

#### Parameters

|Param|Description|
|---|---|
|`fieldSetName`|The name of the field set to retrieve|

#### Returns

|Type|Description|
|---|---|
|`Schema`|The field set if it exists, null otherwise|

### `public String getPrefix()`

Returns the SObject id prefix for the SObject being inspected

#### Returns

|Type|Description|
|---|---|
|`String`|SObject Id prefix|

### `public Schema getSObjectType()`

SObject type getter

#### Returns

|Type|Description|
|---|---|
|`Schema`|SObject type being inspected|

---
