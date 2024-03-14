---
layout: default
---
# CoreLibs_ErrorService

Service class for functionality around errors


**Author** Tom Wilkins

## Methods
### `public AuraHandledException buildUIException(Exception e)`

Builds an aura handled exception for use in UI apex calls

#### Parameters

|Param|Description|
|---|---|
|`e`|Exception to be processed|

#### Returns

|Type|Description|
|---|---|
|`AuraHandledException`|formatted UI Exception|

### `public String getUIErrorFromCode(string errorCode)`

Retrieves the UI error message to present based on error code

#### Parameters

|Param|Description|
|---|---|
|`errorCode`|Error code to find messages for|

#### Returns

|Type|Description|
|---|---|
|`String`|The ui message if found, an empty string otherwise|

---
