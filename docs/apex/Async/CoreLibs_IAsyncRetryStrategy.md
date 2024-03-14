---
layout: default
---
# CoreLibs_IAsyncRetryStrategy

Base interface for async retry strategies


**Author** Tom Wilkins


**Group** Async

## Methods
### `public Boolean shouldRetry(Integer retryCount)`

Returns whether or not another retry should occur

#### Parameters

|Param|Description|
|---|---|
|`retryCount`|the current retry attempt|

#### Returns

|Type|Description|
|---|---|
|`Boolean`|True if retry should occur, false otherwise|

### `public Integer getDelay(Integer retryCount)`

Returns the delay based on the current retry attempt

#### Parameters

|Param|Description|
|---|---|
|`retryCount`|the current retry attempt The number of seconds that the delay should be|

---
