/**
 * @description Services class for exposing stateless classes to clients
 * @author Tom Wilkins
 * @group Core
 */
public inherited sharing class CoreLibs_Services {
  @TestVisible
  public static CoreLibs_Logger logger {
    get {
      if (logger == null) {
        logger = new CoreLibs_Logger();
      }
      return logger;
    }
    private set;
  }
  @TestVisible
  public static CoreLibs_Dml dml {
    get {
      if (dml == null) {
        if (CoreLibs_DataSettings.getInstance().shouldUseMockDatabase()) {
          dml = new CoreLibs_Dml(new CoreLibs_MockDatabaseConnection());
        } else {
          dml = new CoreLibs_Dml(new CoreLibs_DatabaseConnection());
        }
      }
      return dml;
    }
    private set;
  }
  @TestVisible
  public static CoreLibs_TeamMemberService teamMembers {
    get {
      if (teamMembers == null) {
        teamMembers = new CoreLibs_TeamMemberService();
      }
      return teamMembers;
    }
    private set;
  }
  @TestVisible
  public static CoreLibs_ErrorService errors {
    get {
      if (errors == null) {
        errors = new CoreLibs_ErrorService();
      }
      return errors;
    }
    private set;
  }
}
