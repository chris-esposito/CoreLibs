@IsTest
private inherited sharing class CoreLibs_ErrorCodeToUIMappingSelectorTst {
  @IsTest
  private static void getSObjectType_returnMDT() {
    CoreLibs_ErrorCodeToUIMappingSelector selector = new CoreLibs_ErrorCodeToUIMappingSelector();
    System.Test.startTest();
    Schema.SObjectType result = selector.getSObjectType();
    System.Test.stopTest();
    Assert.areEqual(
      CoreLibs_ErrorCodeToUIMessageMapping__mdt.getSObjectType(),
      result,
      'Should return the correct metadata type'
    );
  }

  @IsTest
  private static void getByErrorCodes_executeSuccessfully() {
    CoreLibs_ErrorCodeToUIMappingSelector selector = new CoreLibs_ErrorCodeToUIMappingSelector();
    System.Test.startTest();
    List<CoreLibs_ErrorCodeToUIMessageMapping__mdt> results = selector.getByErrorCodes(new Set<String>{ 'test' });
    System.Test.stopTest();
    Assert.isNotNull(results, 'Should return an array');
  }
}
