---
layout: default
---
# CoreLibs_ApiExceptions

Exceptions to be used within the API framework for easy response/error handling


**Author** Tom Wilkins


**Group** Api

## Classes
### ApiException

Base class since for Api exceptions to extend


**Inheritance**

ApiException

#### Methods
##### `public CoreLibs_HttpStatusCode getStatus()`

Returns the status code attached to the error

###### Returns

|Type|Description|
|---|---|
|`CoreLibs_HttpStatusCode`|http status code enum|

---

### BadGatewayException

**Inheritance**

BadGatewayException

#### Methods
##### `public override CoreLibs_HttpStatusCode getStatus()`
---

### BadRequestException

**Inheritance**

BadRequestException

#### Methods
##### `public override CoreLibs_HttpStatusCode getStatus()`
---

### ForbiddenException

**Inheritance**

ForbiddenException

#### Methods
##### `public override CoreLibs_HttpStatusCode getStatus()`
---

### GatewayTimeoutException

**Inheritance**

GatewayTimeoutException

#### Methods
##### `public override CoreLibs_HttpStatusCode getStatus()`
---

### InternalServerErrorException

**Inheritance**

InternalServerErrorException

#### Methods
##### `public override CoreLibs_HttpStatusCode getStatus()`
---

### MethodNotAllowedException

**Inheritance**

MethodNotAllowedException

#### Methods
##### `public override CoreLibs_HttpStatusCode getStatus()`
---

### NotAcceptableException

**Inheritance**

NotAcceptableException

#### Methods
##### `public override CoreLibs_HttpStatusCode getStatus()`
---

### NotFoundException

**Inheritance**

NotFoundException

#### Methods
##### `public override CoreLibs_HttpStatusCode getStatus()`
---

### NotImplementedException

**Inheritance**

NotImplementedException

#### Methods
##### `public override CoreLibs_HttpStatusCode getStatus()`
---

### ServiceUnavailableException

**Inheritance**

ServiceUnavailableException

#### Methods
##### `public override CoreLibs_HttpStatusCode getStatus()`
---

### UnauthorizedException

**Inheritance**

UnauthorizedException

#### Methods
##### `public override CoreLibs_HttpStatusCode getStatus()`
---

---
