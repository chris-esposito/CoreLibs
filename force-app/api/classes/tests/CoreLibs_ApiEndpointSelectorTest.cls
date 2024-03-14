@IsTest
private inherited sharing class CoreLibs_ApiEndpointSelectorTest {
  @IsTest
  private static void getSObjectType_returnApiEndpoint() {
    CoreLibs_ApiEndpointSelector selector = new CoreLibs_ApiEndpointSelector();
    System.Test.startTest();
    Schema.SObjectType result = selector.getSObjectType();
    System.Test.stopTest();
    Assert.areEqual(CoreLibs_ApiEndpoint__mdt.getSObjectType(), result, 'Should return the Api_Endpoint__mdt type');
  }
}
