/**
 * @description Invocable action for creating error logs
 * @author Tom Wilkins
 * @group Logging
 */
public with sharing class CoreLibs_CreateWarnLog {
  @InvocableMethod(label='Create Warn Log' description='Creates a warn log from a flow')
  public static void execute(List<CoreLibs_CreateErrorLog.Request> requests) {
    for (CoreLibs_CreateErrorLog.Request req : requests) {
      // we can revisit this to bulkify (would need to extend logger) if we ever
      // need to do bulk flow logging
      CoreLibs_Services.logger.warn(req.label, req.details);
    }
  }

  public inherited sharing class Request {
    @InvocableVariable(label='Log Label' description='Label attached to log to support searching' required=true)
    public String label;
    @InvocableVariable(label='Log Details' description='Details to be logged' required=true)
    public String details;
  }
}
