/**
 * @description Data access layer for the AsyncApexJob object
 * @author Tom Wilkins
 * @group Core
 */
public inherited sharing class CoreLibs_AsyncApexJobSelector extends CoreLibs_BaseSelector {
  public override Schema.SObjectType getSObjectType() {
    return AsyncApexJob.getSObjectType();
  }

  /**
   * @description Returns a list of async apex jobs based on cron job detail name
   * @param jobNames Names of jobs to query for
   * @return List of async apex jobs
   */
  public List<AsyncApexJob> getByCronJobDetailName(Set<String> jobNames) {
    return (List<AsyncApexJob>) Database.query(this.buildQueryString('CronTrigger.CronJobDetail.Name IN :jobNames'));
  }

  /**
   * @description Returns a list of scheduled jobs with a specific prefix
   * @param prefix Prefix to use when searching for jobs
   * @return List of async apex jobs
   */
  public List<AsyncApexJob> getAllScheduledJobs(String prefix) {
    String searchText = prefix + '%';
    return (List<AsyncApexJob>) Database.query(
      this.buildQueryString('CronTrigger.CronJobDetail.Name LIKE :searchText')
    );
  }

  /**
   * @description Returns the last completed job for the provided class
   * @param className name of the class for which the job was executed
   * @return The job if found, null otherwise
   */
  public AsyncApexJob getLastCompletedJob(String className) {
    this.setOrderBy('CompletedDate DESC');
    List<AsyncApexJob> jobs = (List<AsyncApexJob>) Database.query(
      this.buildQueryString('ApexClass.Name = :className AND CompletedDate != null')
    );
    return jobs.isEmpty() ? null : jobs[0];
  }
}
