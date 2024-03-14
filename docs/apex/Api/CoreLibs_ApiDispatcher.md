---
layout: default
---
# CoreLibs_ApiDispatcher

Centralized dispatcher for managing api resolver logic


**Author** Tom Wilkins


**Group** Api

## Constructors
### `public CoreLibs_ApiDispatcher(CoreLibs_HttpMethod method, CoreLibs_ApiUrlResolver urlResolver)`

Constructor

#### Parameters

|Param|Description|
|---|---|
|`method`|Http method marking the context of the current API transaction|
|`urlResolver`|Url resolver used to generate endpoint resolver|

---
## Methods
### `public void dispatch()`

Gets, executes, and handles an endpoint resolver. Sets the rest response.

---
