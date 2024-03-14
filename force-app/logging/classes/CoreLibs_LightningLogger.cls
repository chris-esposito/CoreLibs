/**
 * @description Logging class for exposure to Aura/LWC components
 * @author Tom Wilkins
 * @group Logging
 */
public with sharing class CoreLibs_LightningLogger {
  /**
   * @description Creates an info log
   * @param label The label of the log
   * @param details The details to log
   */
  @AuraEnabled
  public static void info(String label, Map<String, Object> details) {
    try {
      CoreLibs_Services.logger.info(label, details);
    } catch (Exception e) {
      throw CoreLibs_Services.errors.buildUIException(e);
    }
  }

  /**
   * @description Creates a Warn log
   * @param label The label of the log
   * @param details The details to log
   */
  @AuraEnabled
  public static void warn(String label, Map<String, Object> details) {
    try {
      CoreLibs_Services.logger.warn(label, details);
    } catch (Exception e) {
      throw CoreLibs_Services.errors.buildUIException(e);
    }
  }

  /**
   * @description Creates a Error log
   * @param label The label of the log
   * @param details The details to log
   */
  @AuraEnabled
  public static void error(String label, Map<String, Object> details) {
    try {
      CoreLibs_Services.logger.error(label, details);
    } catch (Exception e) {
      throw CoreLibs_Services.errors.buildUIException(e);
    }
  }
}
