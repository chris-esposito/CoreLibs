---
layout: default
---
# CoreLibs_TeamViewerController

Controller for leverage with team viewer components

## Methods
### `public static List<GetTeamViewerColumn> getTeamViewerColumns(String sObjType, String fieldSetName)`

`AURAENABLED`
### `public static GetTeamMemberResult getTeamMembers(Id recordId, String sObjType, String fieldSetName)`

`AURAENABLED`
---
## Classes
### GetTeamMemberResult
#### Constructors
##### `public GetTeamMemberResult(Id recordId, String sObjType, List&lt;SObject&gt; records)`
---
#### Properties

##### `public recordId` → `Id`

`AURAENABLED` 

##### `public records` → `List&lt;SObject&gt;`

`AURAENABLED` 

##### `public sObjType` → `String`

`AURAENABLED` 

---

### GetTeamViewerColumn
#### Constructors
##### `public GetTeamViewerColumn(String label, String apiName, Schema type)`
---
#### Properties

##### `public apiName` → `String`

`AURAENABLED` 

##### `public label` → `String`

`AURAENABLED` 

##### `public type` → `String`

`AURAENABLED` 

---

---
