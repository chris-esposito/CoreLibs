---
layout: default
---
# virtual CoreLibs_DataSettings

Settings singleton for data interactions


**Author** Tom Wilkins


**Group** Data

## Methods
### `public static CoreLibs_DataSettings getInstance()`

Singleton access for data settings class

#### Returns

|Type|Description|
|---|---|
|`CoreLibs_DataSettings`|Reference to the data settings singleton|

### `public Boolean isFlsEnforced()`

Returns whether or not FLS is enforced for data transactions This will always return false if the user has the BypassFls custom permission

#### Returns

|Type|Description|
|---|---|
|`Boolean`|True if FLS should be enforced, false otherwise|

### `public void enableFls()`

Enables FLS for subsequent data actions

### `public void disableFls()`

Disables FLS for subsequent data actions

### `public Boolean shouldUseMockDatabase()`

Returns whether or not a mock database connection should be used in data operations

#### Returns

|Type|Description|
|---|---|
|`Boolean`|True if a mock db should be used, false otherwise|

### `public void enableMockDatabase()`

**Descriptions** Enables the mock database for use in data operations

### `public void disableMockDatabase()`

**Descriptions** Disables the mock database for use in data operations

---
