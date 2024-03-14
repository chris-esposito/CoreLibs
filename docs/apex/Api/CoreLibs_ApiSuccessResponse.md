---
layout: default
---
# CoreLibs_ApiSuccessResponse

Simple api success response


**Implemented types**

[CoreLibs_IApiResponse](./CoreLibs_IApiResponse.md)


**Author** Tom Wilkins


**Group** Api

## Constructors
### `public CoreLibs_ApiSuccessResponse(CoreLibs_HttpStatusCode status)`

Constructor

#### Parameters

|Param|Description|
|---|---|
|`status`|Http success status to set|

### `public CoreLibs_ApiSuccessResponse(CoreLibs_HttpStatusCode status, Object body)`

Constructor

#### Parameters

|Param|Description|
|---|---|
|`status`|Http success status to set|
|`body`|body of the response -- must be null orserializable|

---
## Methods
### `public RestResponse toResponse()`

**See** [[IApiResponse](IApiResponse)]([IApiResponse](IApiResponse))

---
