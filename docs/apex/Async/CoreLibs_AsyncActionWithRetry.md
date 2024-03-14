---
layout: default
---
# CoreLibs_AsyncActionWithRetry

Wrapper queable which allows an async action to execute and retry under injected error
circumstances


**Implemented types**

[Queueable](Queueable)
, 
[Database.AllowsCallouts](Database.AllowsCallouts)


**Author** Tom Wilkins


**Group** Async

## Constructors
### `public CoreLibs_AsyncActionWithRetry(CoreLibs_IAsyncAction toExecute, CoreLibs_IAsyncRetryStrategy retryStrategy)`

Cosntructor - specifiy exception types that an async action should retry on

#### Parameters

|Param|Description|
|---|---|
|`toExecute`|The async action to execute|
|`retryStrategy`|Retry strategy|

---
## Methods
### `public void execute(QueueableContext context)`

Either executes the action, or executes the delay. Both events may result in a requeue.


**See** [[Queuable](https://developer.salesforce.com/docs/atlas.en-us.apexcode.meta/apexcode/apex_queueing_jobs.htm)]([Queuable](https://developer.salesforce.com/docs/atlas.en-us.apexcode.meta/apexcode/apex_queueing_jobs.htm))

---
