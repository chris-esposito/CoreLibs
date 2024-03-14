---
layout: default
---
# CoreLibs_Logger

Logging interface for creating Salesforce logs


**Author** Tom Wilkins


**Group** Logging

## Methods
### `public void info(String label, Object details)`

Creates an info log

#### Parameters

|Param|Description|
|---|---|
|`label`|The label of the log|
|`details`|The details to log|

### `public void warn(String label, Object details)`

Creates a warn log

#### Parameters

|Param|Description|
|---|---|
|`label`|The label of the log|
|`details`|The details to log|

### `public void error(String label, Object details)`

Creates an error log

#### Parameters

|Param|Description|
|---|---|
|`label`|The label of the log|
|`details`|The details to log|

### `public void error(String label, Exception e)`

Creates an error log

#### Parameters

|Param|Description|
|---|---|
|`label`|The label of the log|
|`e`|The exception to log details around|

### `public void error(String label, Exception e, Object additionalDetails)`

Creates an error log

#### Parameters

|Param|Description|
|---|---|
|`label`|The label of the log|
|`e`|The exception to log details around|
|`additionalDetails`|Additional details to log with the exception|

### `public void setLogRetention(Integer numOfdays)`

Sets how long to retain logs for when a cleanup job is scheduled

#### Parameters

|Param|Description|
|---|---|
|`numOfdays`|The number of days to retain a log for|

### `public void scheduleDailyCleanup(Integer scheduledTime)`

Schedules a job to run daily at the time provided Note this will run in the timezone of the person who schedules the job

#### Parameters

|Param|Description|
|---|---|
|`scheduledTime`|Time to run job daily|

---
