@IsTest
private inherited sharing class CoreLibs_HttpStatusCodeTest {
	@IsTest
	private static void getFor_OK_return200() {
		System.Test.startTest();
		Integer result = CoreLibs_HttpStatusCode.getFor(CoreLibs_HttpStatusCode.SUCCESS.OK);
		System.Test.stopTest();
		Assert.areEqual(200, result, 'Should return 200');
	}

	@IsTest
	private static void getFor_NOT_FOUND_return404() {
		System.Test.startTest();
		Integer result = CoreLibs_HttpStatusCode.getFor(CoreLibs_HttpStatusCode.ERROR.NOT_FOUND);
		System.Test.stopTest();
		Assert.areEqual(404, result, 'Should return 404');
	}
}