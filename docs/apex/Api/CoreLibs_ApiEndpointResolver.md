---
layout: default
---
# virtual CoreLibs_ApiEndpointResolver

Base resolver class for endpoints to implement. By default, methods will throw a method not supported exception.
Override only the methods which make sense for the endpoint


**Author** Tom Wilkins


**Group** Api

## Methods
### `public CoreLibs_ApiEndpointResolver setRequest(RestRequest req)`

sets the request to be used by the resolver

#### Parameters

|Param|Description|
|---|---|
|`req`|The incoming rest to process|

#### Returns

|Type|Description|
|---|---|
|`CoreLibs_ApiEndpointResolver`|Reference to the invoking object|

### `public virtual String getLabel()`

Returnsthe label for the class -- defaults to class name override the method to provide custom label

### `public virtual CoreLibs_IApiResponse doGet()`

Get handler, override if this resolver should support get requests

#### Returns

|Type|Description|
|---|---|
|`CoreLibs_IApiResponse`|A valid API response that will be mapped to Salesforce System RestResponse|

### `public virtual CoreLibs_IApiResponse doPost()`

Get handler, override if this resolver should support post requests

#### Returns

|Type|Description|
|---|---|
|`CoreLibs_IApiResponse`|A valid API response that will be mapped to Salesforce System RestResponse|

### `public virtual CoreLibs_IApiResponse doPut()`

Get handler, override if this resolver should support put requests

#### Returns

|Type|Description|
|---|---|
|`CoreLibs_IApiResponse`|A valid API response that will be mapped to Salesforce System RestResponse|

### `public virtual CoreLibs_IApiResponse doPatch()`

Get handler, override if this resolver should support patch requests

#### Returns

|Type|Description|
|---|---|
|`CoreLibs_IApiResponse`|A valid API response that will be mapped to Salesforce System RestResponse|

### `public virtual CoreLibs_IApiResponse doDelete()`

Get handler, override if this resolver should support delete requests

#### Returns

|Type|Description|
|---|---|
|`CoreLibs_IApiResponse`|A valid API response that will be mapped to Salesforce System RestResponse|

### `public virtual Boolean shouldBeIdempotent()`

Return whether or not the endpoint should be idempotent. False by default

#### Returns

|Type|Description|
|---|---|
|`Boolean`|True if should be idempotent, false otherwise|

---
