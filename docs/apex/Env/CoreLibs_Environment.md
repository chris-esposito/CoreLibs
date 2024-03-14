---
layout: default
---
# virtual CoreLibs_Environment

Envirnment singleton used for various environment related functionas


**Author** Tom Wilkins


**Group** Env

## Methods
### `public static CoreLibs_Environment getInstance()`

Singleton accessor

#### Returns

|Type|Description|
|---|---|
|`CoreLibs_Environment`|Reference to the singleton instance of the env object|

### `public void enqueue(Queueable q)`

Enqueues a queuable, will use future methods to work around limitations to chain queueables

#### Parameters

|Param|Description|
|---|---|
|`q`|The queueable to enqueue|

### `public void sleep(Integer duration)`

Imitates thread.sleep by waiting for some defined duration Use with caution to not exceed CPU limits

#### Parameters

|Param|Description|
|---|---|
|`duration`|Duration to wait in milliseconds|

### `public Boolean isFeatureOn(String featureName)`

Returns whether or not a feature flag is flipped on

#### Parameters

|Param|Description|
|---|---|
|`featureName`|The name of the feature to check|

#### Returns

|Type|Description|
|---|---|
|`Boolean`|True if the feature is on, false otherwise|

### `public Boolean isFeatureOff(String featureName)`
### `public void setFeatureFlag(String featureName, Boolean isOn)`

Sets a feature flag in tests

#### Parameters

|Param|Description|
|---|---|
|`featureName`|The name of the feature to set|
|`isOn`|Whether the feature is on or off|

---
