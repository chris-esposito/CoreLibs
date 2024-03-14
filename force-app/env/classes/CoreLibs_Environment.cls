/**
 * @description Envirnment singleton used for various environment related functionas
 * @author Tom Wilkins
 * @group Env
 */
public inherited sharing virtual class CoreLibs_Environment {
  @TestVisible
  private static final String CANT_SET_FLAG_OUTSIDE_OF_TEST = 'Cannot set feature flag outside of a test.';

  @TestVisible
  private static CoreLibs_Environment instance;

  /**
   * @description Singleton accessor
   * @return Reference to the singleton instance of the env object
   */
  public static CoreLibs_Environment getInstance() {
    if (instance == null) {
      instance = new CoreLibs_Environment();
    }
    return instance;
  }

  /**
   * @description Enqueues a queuable, will use future methods to work around limitations to chain queueables
   * @param q The queueable to enqueue
   */
  public void enqueue(Queueable q) {
    if (
      (System.Limits.getQueueableJobs() >= System.Limits.getLimitQueueableJobs() &&
      !System.isBatch() &&
      !System.isFuture())
    ) {
      enqueueFromFuture(JSON.serialize(q), new CoreLibs_ObjectInspector(q).getClassName());
    } else {
      System.enqueueJob(q);
    }
  }

  /**
   * @description Imitates thread.sleep by waiting for some defined duration
   * Use with caution to not exceed CPU limits
   * @param duration Duration to wait in milliseconds
   */
  public void sleep(Integer duration) {
    Long startTime = DateTime.now().getTime();
    Long finishTime = DateTime.now().getTime();
    while ((finishTime - startTime) < duration) {
      finishTime = DateTime.now().getTime();
    }
  }

  /**
   * @description Returns whether or not a feature flag is flipped on
   * @param featureName The name of the feature to check
   * @return True if the feature is on, false otherwise
   */
  public Boolean isFeatureOn(String featureName) {
    CoreLibs_FeatureFlags__c flags = CoreLibs_FeatureFlags__c.getOrgDefaults();
    if (flags == null) {
      return false;
    }
    Boolean value = (boolean) flags.get(featureName);
    return value == null ? false : value;
  }

  /**
   * @description Returns whether or not the feature flag is flipped on
   * @param
   */
  public Boolean isFeatureOff(String featureName) {
    return !this.isFeatureOn(featureName);
  }

  /**
   * @description Sets a feature flag in tests
   * @param featureName The name of the feature to set
   * @param isOn Whether the feature is on or off
   */
  public void setFeatureFlag(String featureName, Boolean isOn) {
    if (!Test.isRunningTest()) {
      throw new CoreLibs_EnvExceptions.SetupException(CANT_SET_FLAG_OUTSIDE_OF_TEST);
    }
    CoreLibs_FeatureFlags__c flags = CoreLibs_FeatureFlags__c.getOrgDefaults();
    if (flags == null) {
      flags = new CoreLibs_FeatureFlags__c();
    }
    flags.put(featureName, isOn);
    upsert flags;
  }

  /**
   * @description Protected constructor to impose singleton while affording mocking
   */
  @TestVisible
  protected CoreLibs_Environment() {
    return;
  }

  /**
   * @description Future method that can be used to wrap firing off queueables
   * @param serializedQueueable The serialized queueable to be ran
   * @param queueableClassName Name of the realizaion class that implements the Queueuable Interface
   */
  @TestVisible
  @Future
  private static void enqueueFromFuture(String serializedQueueable, String queueableClassName) {
    System.Type queueableType = System.Type.forName(queueableClassName);
    System.enqueueJob((Queueable) JSON.deserialize(serializedQueueable, queueableType));
  }
}
