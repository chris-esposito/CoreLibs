/**
 * @description Static accessor for various email related functions
 * @author Tom Wilkins
 * @group Email
 */
public inherited sharing class CoreLibs_Email {
  @TestVisible
  public static CoreLibs_DevTeamEmail devTeam {
    get {
      if (devTeam == null) {
        devTeam = new CoreLibs_DevTeamEmail();
      }
      return devTeam;
    }
    private set;
  }
}
