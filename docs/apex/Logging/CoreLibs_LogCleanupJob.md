---
layout: default
---
# CoreLibs_LogCleanupJob

Cleanup jobs for logs in Salesforce


**Implemented types**

[Database.Batchable&lt;SObject&gt;](Database.Batchable&lt;SObject&gt;)
, 
[System.Schedulable](System.Schedulable)


**Author** Tom Wilkins


**Group** Logging

## Methods
### `public static void schedule(Integer hour)`

Schedules the job to operate daily at the provided hour

#### Parameters

|Param|Description|
|---|---|
|`hour`|The hour to execute at|

### `public static void cancel()`

Cancels an existing log cleanup job

### `public Database start(Database ctx)`
### `public void execute(Database ctx, List<SObject> records)`
### `public void finish(Database ctx)`
### `public void execute(System ctx)`
---
