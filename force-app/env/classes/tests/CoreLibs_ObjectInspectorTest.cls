@IsTest
private inherited sharing class CoreLibs_ObjectInspectorTest {
  @IsTest
  private static void getClassName_returnClassName() {
    TestClass tc = new TestClass();
    CoreLibs_ObjectInspector oi = new CoreLibs_ObjectInspector(tc);
    System.Test.startTest();
    String className = oi.getClassName();
    System.Test.stopTest();
    Assert.areEqual('TestClass', className, 'Should return the correct class name');
  }

  @IsTest
  private static void getClassType_returnClassType() {
    CoreLibs_Environment env = new CoreLibs_Environment();
    CoreLibs_ObjectInspector oi = new CoreLibs_ObjectInspector(env);
    System.Test.startTest();
    System.Type classType = oi.getClassType();
    System.Test.stopTest();
    Assert.areEqual(CoreLibs_Environment.class, classType, 'Should return the correct class type');
  }

  private inherited sharing class TestClass {
  }
}
