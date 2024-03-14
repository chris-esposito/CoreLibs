---
layout: default
---
# CoreLibs_TeamMemberService

Service layer for managing team members


**Author** Tom Wilkins


**Group** Core

## Methods
### `public List<SObject> getTeamMembers(Id recordId, Schema sObjType, String fieldSetName)`

Returns the team members for the provided parent record id/team sobject type (e.g. AccountTeamMember)

#### Parameters

|Param|Description|
|---|---|
|`recordId`|Record Id for the parent object the team is for|
|`sObjType`|The team sobject type e.g. AccountTeamMember, CaseTeamMember|
|`fieldSetName`|The name of the field set that should be used to query fields|

---
