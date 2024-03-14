---
layout: default
---
# CoreLibs_MockDatabaseConnection

`ISTEST`

Mocked db that can be used to replace the standard testing db for most applications,
affording further decoupling from other parts of the system


**Implemented types**

[CoreLibs_IDatabaseConnection](./CoreLibs_IDatabaseConnection.md)


**Author** Tom Wilkins


**Group** Data

## Properties

### `public deletedState` → `Map<Id,SObject>`


### `public recordsBySObject` → `Map<Schema.SObjectType,List<SObject>>`


### `public state` → `Map<Id,SObject>`


---
## Methods
### `public List<Database.SaveResult> insertRecords(List<SObject> records, Database options)`
### `public List<Database.SaveResult> updateRecords(List<SObject> records, Database options)`
### `public List<Database.UpsertResult> upsertRecords(List<SObject> records, Boolean allOrNone)`
### `public List<Database.UpsertResult> upsertRecords(List<SObject> records, Schema externalIdField, Boolean allOrNone)`
### `public List<Database.DeleteResult> deleteRecords(List<SObject> records, Boolean allOrNone)`
### `public List<Database.DeleteResult> deleteRecords(List<Id> recordIds, Boolean allOrNone)`
### `public List<Database.UndeleteResult> undeleteRecords(List<SObject> records, Boolean allOrNone)`
### `public List<Database.UndeleteResult> undeleteRecords(List<Id> recordIds, Boolean allOrNone)`
---
