---
layout: default
---
# CoreLibs_ApiUrlResolver

Resolves a given Url to the appropriate API service resolver


**Author** Tom Wilkins


**Group** API

## Constructors
### `public CoreLibs_ApiUrlResolver(RestRequest req)`

Constructor

#### Parameters

|Param|Description|
|---|---|
|`req`|The RestRequest to process|

---
## Methods
### `public CoreLibs_ApiEndpointResolver resolve()`

Evalutes the url against configured resolvers and returns the resolver if found

#### Returns

|Type|Description|
|---|---|
|`CoreLibs_ApiEndpointResolver`|ApiEndpointResolver|


**Throw** [CoreLibs_ApiExceptions.NotFoundException](CoreLibs_ApiExceptions.NotFoundException) if the resolver does not exist

---
