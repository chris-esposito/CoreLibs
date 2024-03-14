---
layout: default
---
# CoreLibs_IDatabaseConnection

Base interface for db connections


**Author** Tom Wilkins


**Group** Data

## Methods
### `public List<Database.SaveResult> insertRecords(List<SObject> records, Database options)`

Inserts a collection of records

#### Parameters

|Param|Description|
|---|---|
|`records`|Records to insert|
|`options`|DML options|

#### Returns

|Type|Description|
|---|---|
|`List<Database.SaveResult>`|Save results from insert|

### `public List<Database.SaveResult> updateRecords(List<SObject> records, Database options)`

Updates a collection of records

#### Parameters

|Param|Description|
|---|---|
|`records`|Records to update|
|`options`|DML options|

#### Returns

|Type|Description|
|---|---|
|`List<Database.SaveResult>`|Save results from update|

### `public List<Database.UpsertResult> upsertRecords(List<SObject> records, Boolean allorNone)`

Upserts a collection of records

#### Parameters

|Param|Description|
|---|---|
|`records`|Records to upsert|
|`allOrNone`|Whether or not the dml operation should be all or none|

#### Returns

|Type|Description|
|---|---|
|`List<Database.UpsertResult>`|Results from upsert|

### `public List<Database.UpsertResult> upsertRecords(List<SObject> records, Schema externalIdField, Boolean allorNone)`

Upserts a collection of records

#### Parameters

|Param|Description|
|---|---|
|`records`|Records to upsert|
|`externalId`|External Id field to upsert on|
|`allOrNone`|Whether or not the dml operation should be all or none|

#### Returns

|Type|Description|
|---|---|
|`List<Database.UpsertResult>`|Results from upsert|

### `public List<Database.DeleteResult> deleteRecords(List<SObject> records, Boolean allorNone)`

Deletes a collection of records

#### Parameters

|Param|Description|
|---|---|
|`records`|Records to delete|
|`allOrNone`|Whether or not the dml operation should be all or none|

#### Returns

|Type|Description|
|---|---|
|`List<Database.DeleteResult>`|Delete results from delete|

### `public List<Database.DeleteResult> deleteRecords(List<Id> recordIds, Boolean allorNone)`

Deletes a collection of records

#### Parameters

|Param|Description|
|---|---|
|`recordIds`|Ids of records to delete|
|`allOrNone`|Whether or not the dml operation should be all or none|

#### Returns

|Type|Description|
|---|---|
|`List<Database.DeleteResult>`|Delete results from delete|

### `public List<Database.UndeleteResult> undeleteRecords(List<SObject> records, Boolean allorNone)`

Uneletes a collection of records

#### Parameters

|Param|Description|
|---|---|
|`records`|Records to undelete|
|`allOrNone`|Whether or not the dml operation should be all or none|

#### Returns

|Type|Description|
|---|---|
|`List<Database.UndeleteResult>`|Results from undelete|

### `public List<Database.UndeleteResult> undeleteRecords(List<Id> recordIds, Boolean allorNone)`

Uneletes a collection of records

#### Parameters

|Param|Description|
|---|---|
|`recordIds`|Ids of records to delete|
|`allOrNone`|Whether or not the dml operation should be all or none|

#### Returns

|Type|Description|
|---|---|
|`List<Database.UndeleteResult>`|Results from undelete|

---
