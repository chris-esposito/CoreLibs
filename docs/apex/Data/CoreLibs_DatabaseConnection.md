---
layout: default
---
# CoreLibs_DatabaseConnection

Primary database connection class for apex operations. See [CoreLibs_IDatabaseConnection](./CoreLibs_IDatabaseConnection.md)


**Implemented types**

[CoreLibs_IDatabaseConnection](./CoreLibs_IDatabaseConnection.md)


**Author** Tom Wilkins


**Group** Data

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
