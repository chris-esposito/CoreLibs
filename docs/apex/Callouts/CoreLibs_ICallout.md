---
layout: default
---
# CoreLibs_ICallout

Base interface for any external callouts. This is used with the CoreLibs_HttpClient
rather than building req/res handling on every callout. Currently only supports string bodies, will
extend later for blob bodies if necessary


**Author** Tom Wilkins


**Group** Callouts

## Methods
### `public string getCalloutLabel()`

Returns the label of the callout, this is used to identify the callout in logs among other future uses

#### Returns

|Type|Description|
|---|---|
|`string`|Label to be used in logging etc.|

### `public string getEndpoint()`

Returns the endpoint for the request -- could be an endpoint or named credential

#### Returns

|Type|Description|
|---|---|
|`string`|Endpoint string value|

### `public Map<String,String> getHeaders()`

Returns the headers for the request. Return an empty map for no headers

#### Returns

|Type|Description|
|---|---|
|`Map<String,String>`|Header map|

### `public CoreLibs_HttpMethod getMethod()`

Returns the http method of the request

#### Returns

|Type|Description|
|---|---|
|`CoreLibs_HttpMethod`|Http method|

### `public String getBody()`

Returns the body of the request

#### Returns

|Type|Description|
|---|---|
|`String`|String body of the request|

---
