---
layout: default
---
# CoreLibs_ExponentialBackoffRetry

Expoenential backoff, capped at 5 retries due to CPU limitation concerns


**Implemented types**

[CoreLibs_IAsyncRetryStrategy](./CoreLibs_IAsyncRetryStrategy.md)


**Author** Tom Wilkins


**Group** Async

## Methods
### `public Boolean shouldRetry(Integer retryCount)`
### `public Integer getDelay(Integer retryCount)`
---
