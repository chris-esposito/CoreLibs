---
layout: default
---
# CoreLibs_LogController

Lightning controller for various log UI functionality


**Author** Tom Wilkins


**Group** Logging

## Methods
### `public static String getLogDetails(Id recordId)`

`AURAENABLED`

Gets the log details for the provided log record Id

#### Returns

|Type|Description|
|---|---|
|`String`|Log Details as a JSON string|


**RecordId** Salesforce CoreLibs_Log__c record Id

### `public static List<CoreLibs_Log__c> getLogs(CoreLibs_LogController filters)`

`AURAENABLED`

Returns logs based on provided filters

#### Parameters

|Param|Description|
|---|---|
|`filters`|Filters to limit what logs are returned|

#### Returns

|Type|Description|
|---|---|
|`List<CoreLibs_Log__c>`|List of logs (up to 1000, by most recent that match criteria)|

### `public static GetLogCleanupSettingsOutput getLogCleanupSettings()`

`AURAENABLED`

Returns the log cleanup settings

#### Returns

|Type|Description|
|---|---|
|`GetLogCleanupSettingsOutput`|Cleanup Settings|

### `public static void saveRetainLogsForSetting(Integer numOfDays)`

`AURAENABLED`

Sets the duration (days) to retain logs for when a cleanup job is scheduled

#### Parameters

|Param|Description|
|---|---|
|`numOfDays`|The number of days to retain lgos for|

### `public static void scheduleLogCleanupJob(Integer scheduledTime)`

`AURAENABLED`

Schedules a job to run daily at the time provided Note this will run in the timezone of the person who schedules the job

#### Parameters

|Param|Description|
|---|---|
|`scheduledTime`|Time to run job daily (0-23)|

---
## Classes
### GetLogCleanupSettingsOutput

Inner class to capture method output

#### Constructors
##### `public GetLogCleanupSettingsOutput(CoreLibs_LogCleanupSettings__c settings, AsyncApexJob lastRunJob)`
---
#### Properties

##### `public lastRun` → `Datetime`

`AURAENABLED` 

##### `public lastRunStatus` → `String`

`AURAENABLED` 

##### `public retainLogsFor` → `Integer`

`AURAENABLED` 

##### `public scheduledTime` → `Integer`

`AURAENABLED` 

---

### GetLogsInput

Inner class to capture complex method input -- transform before
passing to service/domain/data classes

#### Properties

##### `public endTime` → `String`

`AURAENABLED` 

##### `public runningUserId` → `String`

`AURAENABLED` 

##### `public runningUserSessionId` → `String`

`AURAENABLED` 

##### `public startTime` → `String`

`AURAENABLED` 

##### `public transactionId` → `String`

`AURAENABLED` 

##### `public type` → `String`

`AURAENABLED` 

---

---
