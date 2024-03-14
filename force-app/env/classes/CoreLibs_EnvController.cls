/**
 * @description Aura controller for environment related functions
 * @author Tom Wilkins
 * @group Env
 */
public with sharing class CoreLibs_EnvController {
  /**
   * @description Returns whether a feature is on
   * @param featureName Name of the feature flag to check
   * @return True if feature is on, false otherwise
   */
  @AuraEnabled
  public static Boolean isFeatureOn(String featureName) {
    try {
      return CoreLibs_Environment.getInstance().isFeatureOn(featureName);
    } catch (Exception e) {
      CoreLibs_Services.logger.error('CoreLibs_EnvController.isFeatureOn', e);
      throw CoreLibs_Services.errors.buildUIException(e);
    }
  }

  /**
   * @description Returns whether a feature is off
   * @param featureName Name of the feature flag to check
   * @return True if feature is off, false otherwise
   */
  @AuraEnabled
  public static Boolean isFeatureOff(String featureName) {
    try {
      return CoreLibs_Environment.getInstance().isFeatureOff(featureName);
    } catch (Exception e) {
      CoreLibs_Services.logger.error('CoreLibs_EnvController.isFeatureOff', e);
      throw CoreLibs_Services.errors.buildUIException(e);
    }
  }
}
