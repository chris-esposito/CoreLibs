/**
 * @description Invocable action for creating info logs
 * @author Tom Wilkins
 * @group Logging
 */
public with sharing class CoreLibs_CreateInfoLog {
  @InvocableMethod(label='Create Info Log' description='Creates an info log from a flow')
  public static void execute(List<CoreLibs_CreateErrorLog.Request> requests) {
    for (CoreLibs_CreateErrorLog.Request req : requests) {
      // we can revisit this to bulkify (would need to extend logger) if we ever
      // need to do bulk flow logging
      CoreLibs_Services.logger.info(req.label, req.details);
    }
  }

  public inherited sharing class Request {
    @InvocableVariable(label='Log Label' description='Label attached to log to support searching' required=true)
    public String label;
    @InvocableVariable(label='Log Details' description='Details to be logged' required=true)
    public String details;
  }
}
