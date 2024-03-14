/**
 * @description Service class for functionality around errors
 * @author Tom Wilkins
 */
public inherited sharing class CoreLibs_ErrorService {
  /**
   * @description Builds an aura handled exception for use in UI apex calls
   * @param e Exception to be processed
   * @return formatted UI Exception
   */
  public AuraHandledException buildUIException(Exception e) {
    Map<String, Object> message = new Map<String, Object>{
      'errorCode' => e instanceof CoreLibs_IErrorCodeProvider ? ((CoreLibs_IErrorCodeProvider) e).getErrorCode() : '',
      'transactionId' => CoreLibs_LoggerContext.getInstance().getTransactionId(),
      'message' => e.getMessage()
    };
    String serializedMessage = JSON.serialize(message);
    AuraHandledException ex = new AuraHandledException(JSON.serialize(message));
    ex.setMessage(serializedMessage);
    return ex;
  }

  /**
   * @description Retrieves the UI error message to present based on error code
   * @param errorCode Error code to find messages for
   * @return The ui message if found, an empty string otherwise
   */
  public String getUIErrorFromCode(string errorCode) {
    CoreLibs_ErrorCodeToUIMappingSelector selector = (CoreLibs_ErrorCodeToUIMappingSelector) CoreLibs_Factories.selector.create(
        CoreLibs_ErrorCodeToUIMappingSelector.class
      )
      .setFields(new List<Schema.SObjectField>{ CoreLibs_ErrorCodeToUIMessageMapping__mdt.UIMessage__c });
    List<CoreLibs_ErrorCodeToUIMessageMapping__mdt> mapping = selector.getByErrorCodes(new Set<String>{ errorCode });
    return mapping.isEmpty() ? '' : mapping[0].UIMessage__c;
  }
}
