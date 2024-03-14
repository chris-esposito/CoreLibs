/**
 * @description Aura controller for working with the apex api utility LWC
 * @author Tom Wilkins
 */
public with sharing class CoreLibs_ApexApiController {
  /**
   * @description Returns the appropriate UI message for the error code
   * @param errorCode Error code to retrieve UI message for
   * @return UI message if the mapping exists, an empty string otherwise
   */
  @AuraEnabled
  public static String getUIMessageFromErrorCode(String errorCode) {
    try {
      if (String.isBlank(errorCode)) {
        return '';
      }
      return CoreLibs_Services.errors.getUIErrorFromCode(errorCode);
    } catch (Exception e) {
      CoreLibs_Services.logger.error('CoreLibs_ApexApiController.getErrorCodeUIMessage', e);
      throw CoreLibs_Services.errors.buildUIException(e);
    }
  }
}
