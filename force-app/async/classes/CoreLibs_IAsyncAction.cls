/**
 * @description Refined async action interface that executes business logic. This can be repurposed in other areas
 * but is generally used within the AsyncActionWithBackoff class.
 * @author Tom Wilkins
 * @group Async
 */
public interface CoreLibs_IAsyncAction {
  /**
   * @description Business logic to execute
   */
  void execute();
  /**
   * @description logic for handling errors or any compensating actions in the async action
   * @param e Exception that was generated
   */
  void handleError(Exception e);
}
