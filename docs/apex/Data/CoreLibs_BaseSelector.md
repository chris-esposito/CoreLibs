---
layout: default
---
# abstract CoreLibs_BaseSelector

Base CoreLibs_BaseSelector for query classes to implement which effectively combines
two aspects of data frameworks for cohesiveness and simplicity: the CoreLibs_BaseSelector and the query builder.
Respects security settings established in [CoreLibs_DataSettings](./CoreLibs_DataSettings.md).


**Author** Tom Wilkins


**Group** Data

## Methods
### `public Schema getSObjectType()`

Should return the type of SObject that the CoreLibs_BaseSelector is for

#### Returns

|Type|Description|
|---|---|
|`Schema`|Schema.SObjectTyp such as Account.getSObjectType() or Case.getSObjectType()|

### `public CoreLibs_BaseSelector setFields(List<Schema.SObjectField> fields)`

Sets the fields to be queried -- must be set prior to invoking inherited CoreLibs_BaseSelector methods or invoking the buildQueryString helper.

#### Parameters

|Param|Description|
|---|---|
|`fields`|Fields on the object (provided by getSObjectType override) to query for|

#### Returns

|Type|Description|
|---|---|
|`CoreLibs_BaseSelector`|Reference to the invoking object|

### `public CoreLibs_BaseSelector addRelatedListQuery(String relationName, List<Schema.SObjectField> fields)`

Sets a related list to be queried -- must be set prior to invoking inherited CoreLibs_BaseSelector methods or invoking the buildQueryString helper. Multiple related lists (assuming different relation names) can be set in a single query

#### Parameters

|Param|Description|
|---|---|
|`relationName`|String representation of a relation e.g. MyRelatedObjects__r|
|`fields`|Fields on the related object to query|

#### Returns

|Type|Description|
|---|---|
|`CoreLibs_BaseSelector`|Reference to the invoking object|

### `public CoreLibs_BaseSelector addCrossObjectQuery(String relationName, List<Schema.SObjectField> fields)`

Sets a parent object to be queried -- must be set prior to invoking inherited CoreLibs_BaseSelector methods or invoking the buildQueryString helper. Multiple parent objects (assuming different relation names) can be set in a single query

#### Parameters

|Param|Description|
|---|---|
|`relationName`|String representation of a relation e.g. MyParentObject__r|
|`fields`|Fields on the related object to query|

#### Returns

|Type|Description|
|---|---|
|`CoreLibs_BaseSelector`|Reference to the invoking object|

### `public CoreLibs_BaseSelector clearRelatedListQueries()`

Clears the related list queries -- useful if reusing the same CoreLibs_BaseSelector

#### Returns

|Type|Description|
|---|---|
|`CoreLibs_BaseSelector`|Reference to the invoking object|

### `public CoreLibs_BaseSelector clearCrossObjectQueries()`

Clears the cross object queries -- useful if reusing the same CoreLibs_BaseSelector

#### Returns

|Type|Description|
|---|---|
|`CoreLibs_BaseSelector`|Reference to the invoking object|

### `public CoreLibs_BaseSelector setLimit(Integer recordLimit)`

Sets the limit for the query

#### Parameters

|Param|Description|
|---|---|
|`recordLimit`|LIMIT value to apply|

#### Returns

|Type|Description|
|---|---|
|`CoreLibs_BaseSelector`|Reference to the invoking object|

### `public CoreLibs_BaseSelector setOffset(Integer recordOffset)`

Sets the offset for the query

#### Parameters

|Param|Description|
|---|---|
|`recordOffset`|OFFSET value to aplly|

#### Returns

|Type|Description|
|---|---|
|`CoreLibs_BaseSelector`|Reference to the invoking object|

### `public CoreLibs_BaseSelector setOrderBy(String orderBy)`

Sets the ordering for the query

#### Parameters

|Param|Description|
|---|---|
|`orderBy`|Ordering to orderby|

#### Returns

|Type|Description|
|---|---|
|`CoreLibs_BaseSelector`|Reference to the invoking object|

### `public List<SObject> getById(Set<Id> recordIds)`

Queries records by Id

#### Parameters

|Param|Description|
|---|---|
|`recordIds`|Set of record ids to filter on|

#### Returns

|Type|Description|
|---|---|
|`List<SObject>`|Records resulting from the query|

### `public List<SObject> getByRecordType(Set<Id> recordTypeIds)`

Queries records by record type id

#### Parameters

|Param|Description|
|---|---|
|`recordTypeIds`|Set of record type ids to filter on|

#### Returns

|Type|Description|
|---|---|
|`List<SObject>`|Records resulting from the query|

### `public List<SObject> getByRecordType(Set<String> recordTypeDeveloperNames)`

Queries records by record type developer name

#### Parameters

|Param|Description|
|---|---|
|`recordTypeDeveloperNames`|Set of record type developer names to filter on|

#### Returns

|Type|Description|
|---|---|
|`List<SObject>`|Records resulting from the query|

### `public List<SObject> getByIdAndRecordType(Set<Id> recordIds, Set<Id> recordTypeIds)`

Queries record by record id and record type id

#### Parameters

|Param|Description|
|---|---|
|`recordIds`|Set of record ids to filter on|
|`recordTypeIds`|Set of record type ids to filter on|

#### Returns

|Type|Description|
|---|---|
|`List<SObject>`|Records resulting from the query|

### `public List<SObject> getByIdAndRecordType(Set<Id> recordIds, Set<String> recordTypeDeveloperNames)`

Queries record by record id and record type id

#### Parameters

|Param|Description|
|---|---|
|`recordIds`|Set of record ids to filter on|
|`recordTypeIds`|Set of record type ids to filter on|

#### Returns

|Type|Description|
|---|---|
|`List<SObject>`|Records resulting from the query|

### `public List<SObject> getByDeveloperName(Set<String> developerNames)`

Queries record by record type developer names

### `public List<SObject> getByName(Set<String> names)`

Queries records by name

#### Parameters

|Param|Description|
|---|---|
|`names`|Set of name values to filter on|

#### Returns

|Type|Description|
|---|---|
|`List<SObject>`|Records resulting from the query|

### `public List<SObject> getByFilters(List<String> filters)`

Returns records that statisfy all fitlers

#### Parameters

|Param|Description|
|---|---|
|`filters`|String filters e.g. MyField__c = \'123\'|

#### Returns

|Type|Description|
|---|---|
|`List<SObject>`|Records resulting from the query|

### `public virtual List<SObject> getAll()`

WARNING USE WITH CAUTION. SHOULD ONLY BE USED WITH TABLES THAT ARE GUARANTEED TO BE LOW VOLUME. Queries all data for a table. Virtual so that child selectors that are for custom metadata can override with custom metadata specific features, which is hard to do dynamically.

#### Returns

|Type|Description|
|---|---|
|`List<SObject>`|all records for a table|

### `public String buildQuery(List<String> fields, String filter)`

Standalone dynamic query builder -- this should used sparingly but can definitely be in situations where a query being executed is very dynamic

#### Parameters

|Param|Description|
|---|---|
|`fields`|Fields to query for|
|`sObjType`|SObject type to query against|
|`filter`|Filter string to use|

---
