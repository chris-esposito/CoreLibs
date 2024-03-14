---
layout: default
---
# CoreLibs_QueryRuleProcessor

Rule for using queries to trigger alerts


**Inheritance**

[CoreLibs_MonitoringRuleProcessor](./CoreLibs_MonitoringRuleProcessor.md)
 &gt; 
CoreLibs_QueryRuleProcessor


**Author** Tom Wilkins


**Group** Logging

## Methods
### `public override void execute()`

Executes the query and will fire a pager duty email if the query count threshold is exceeded

### `public CoreLibs_MonitoringRuleProcessor setRule(CoreLibs_MonitoringRule__c rule)`

*Inherited*


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

*Inherited*


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
