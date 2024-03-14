---
layout: default
---
# abstract CoreLibs_MonitoringRuleProcessor

Base class for monitoring rule processesors. Note that when creating new
processor types, there may be additional configuration in the ClassName__c field on
the CoreLibs_MonitoringRule__c object


**Author** Tom Wilkins


**Group** Logging

## Methods
### `public void execute()`

Monitor logic method

### `public CoreLibs_MonitoringRuleProcessor setRule(CoreLibs_MonitoringRule__c rule)`

Rule setter

#### Parameters

|Param|Description|
|---|---|
|`rule`|Rule to set|

#### Returns

|Type|Description|
|---|---|
|`CoreLibs_MonitoringRuleProcessor`|Reference to the invoking object|

### `public CoreLibs_MonitoringRuleProcessor setLastRun(Datetime lastRun)`

Sets the last time the job was run

#### Parameters

|Param|Description|
|---|---|
|`lastRun`|Last time job was run|

#### Returns

|Type|Description|
|---|---|
|`CoreLibs_MonitoringRuleProcessor`|Reference to the invoking object|

---
