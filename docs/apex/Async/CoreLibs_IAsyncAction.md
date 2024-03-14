---
layout: default
---
# CoreLibs_IAsyncAction

Refined async action interface that executes business logic. This can be repurposed in other areas
but is generally used within the AsyncActionWithBackoff class.


**Author** Tom Wilkins


**Group** Async

## Methods
### `public void execute()`

Business logic to execute

### `public void handleError(Exception e)`

logic for handling errors or any compensating actions in the async action

#### Parameters

|Param|Description|
|---|---|
|`e`|Exception that was generated|

---
