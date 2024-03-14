---
layout: default
---
# virtual CoreLibs_LoggerContext

Context singleton class used by logging functionality around logging events


**Author** Tom Wilkins


**Group** Logging

## Methods
### `public static CoreLibs_LoggerContext getInstance()`

Singleton getter

#### Returns

|Type|Description|
|---|---|
|`CoreLibs_LoggerContext`|Singleton instance of the logger context for the transaction|

### `public String getTransactionId()`

Transaction Id (UUID) getter

#### Returns

|Type|Description|
|---|---|
|`String`|UUID for the transaction|

### `public String getTransactionType()`

Transaction Type getter

#### Returns

|Type|Description|
|---|---|
|`String`|Type of transaction as string|

### `public String getRunningUserSessionId()`

Session Id getter

#### Returns

|Type|Description|
|---|---|
|`String`|The current user's session Id|

### `public Id getRunningUserId()`

User ID getter

#### Returns

|Type|Description|
|---|---|
|`Id`|The Id of the current user|

---
