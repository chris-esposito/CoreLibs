---
layout: default
---
# CoreLibs_DataExceptions

Exceptions class for grouping data related exceptions


**Author** Tom Wilkins


**Group** Data

## Classes
### FlsException

**Inheritance**

FlsException

#### Constructors
##### `public FlsException(System access, List&lt;String&gt; violations)`

Constructor

###### Parameters

|Param|Description|
|---|---|
|`access`|System access type to get operation from|
|`violations`|List of Fls violation strings|

##### `public FlsException(CoreLibs_DatabaseOperation operation, List&lt;String&gt; violations)`

Constructor

###### Parameters

|Param|Description|
|---|---|
|`operation`|Databse operaiton to get op string from|
|`violations`|List of Fls violation strings|

---
#### Methods
##### `public override String getMessage()`
###### Returns

|Type|Description|
|---|---|
|`String`|Custom error message|


**Descriptions** Returns the FLS error message based on state

---

### MockDatabaseException

**Inheritance**

MockDatabaseException


### SettingsException

**Inheritance**

SettingsException


---
