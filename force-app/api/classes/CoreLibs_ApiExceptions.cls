/**
 * @description Exceptions to be used within the API framework for easy response/error handling
 * @author Tom Wilkins
 * @group Api
 */
public inherited sharing class CoreLibs_ApiExceptions {
  /**
   * @description Base class since for Api exceptions to extend
   */
  public inherited sharing abstract class ApiException extends Exception {
    /**
     * Returns the status code attached to the error
     * @return  http status code enum
     */
    public abstract CoreLibs_HttpStatusCode.ERROR getStatus();
  }

  public inherited sharing class BadRequestException extends ApiException {
    public override CoreLibs_HttpStatusCode.ERROR getStatus() {
      return CoreLibs_HttpStatusCode.ERROR.BAD_REQUEST;
    }
  }

  public inherited sharing class UnauthorizedException extends ApiException {
    public override CoreLibs_HttpStatusCode.ERROR getStatus() {
      return CoreLibs_HttpStatusCode.ERROR.UNAUTHORIZED;
    }
  }

  public inherited sharing class ForbiddenException extends ApiException {
    public override CoreLibs_HttpStatusCode.ERROR getStatus() {
      return CoreLibs_HttpStatusCode.ERROR.FORBIDDEN;
    }
  }

  public inherited sharing class NotFoundException extends ApiException {
    public override CoreLibs_HttpStatusCode.ERROR getStatus() {
      return CoreLibs_HttpStatusCode.ERROR.NOT_FOUND;
    }
  }

  public inherited sharing class MethodNotAllowedException extends ApiException {
    public override CoreLibs_HttpStatusCode.ERROR getStatus() {
      return CoreLibs_HttpStatusCode.ERROR.METHOD_NOT_ALLOWED;
    }
  }

  public inherited sharing class NotAcceptableException extends ApiException {
    public override CoreLibs_HttpStatusCode.ERROR getStatus() {
      return CoreLibs_HttpStatusCode.ERROR.NOT_ACCEPTABLE;
    }
  }

  public inherited sharing class InternalServerErrorException extends ApiException {
    public override CoreLibs_HttpStatusCode.ERROR getStatus() {
      return CoreLibs_HttpStatusCode.ERROR.INTERNAL_SERVER_ERROR;
    }
  }

  public inherited sharing class NotImplementedException extends ApiException {
    public override CoreLibs_HttpStatusCode.ERROR getStatus() {
      return CoreLibs_HttpStatusCode.ERROR.NOT_IMPLEMENTED;
    }
  }

  public inherited sharing class BadGatewayException extends ApiException {
    public override CoreLibs_HttpStatusCode.ERROR getStatus() {
      return CoreLibs_HttpStatusCode.ERROR.BAD_GATEWAY;
    }
  }

  public inherited sharing class ServiceUnavailableException extends ApiException {
    public override CoreLibs_HttpStatusCode.ERROR getStatus() {
      return CoreLibs_HttpStatusCode.ERROR.SERVICE_UNAVAILABLE;
    }
  }

  public inherited sharing class GatewayTimeoutException extends ApiException {
    public override CoreLibs_HttpStatusCode.ERROR getStatus() {
      return CoreLibs_HttpStatusCode.ERROR.GATEWAY_TIMEOUT;
    }
  }
}
