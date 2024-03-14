---
layout: default
---
# CoreLibs_StandardRetry

Standard retry mechanism for static retry intervals


**Implemented types**

[CoreLibs_IAsyncRetryStrategy](./CoreLibs_IAsyncRetryStrategy.md)


**Author** Tom Wilkins


**Group** Async

## Constructors
### `public CoreLibs_StandardRetry(Integer numberOfRetries, Integer delayInSeconds)`

Constructor

#### Parameters

|Param|Description|
|---|---|
|`numberOfRetries`|The number of times to attempt a retry|
|`delayInSecond`|The delay (in seconds) between each retry|

---
## Methods
### `public Boolean shouldRetry(Integer retryCount)`
### `public Integer getDelay(Integer retryCount)`
---
