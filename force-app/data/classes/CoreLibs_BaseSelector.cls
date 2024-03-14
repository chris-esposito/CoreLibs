/**
 * @description Base CoreLibs_BaseSelector for query classes to implement which effectively combines
 * two aspects of data frameworks for cohesiveness and simplicity: the CoreLibs_BaseSelector and the query builder.
 * Respects security settings established in {@link CoreLibs_DataSettings}.
 * @author Tom Wilkins
 * @group Data
 */
public inherited sharing abstract class CoreLibs_BaseSelector {
  @TestVisible
  private Integer recordOffset;
  @TestVisible
  private Integer recordLimit;
  @TestVisible
  private String orderBy;
  @TestVisible
  protected List<Schema.SObjectField> fields {
    get {
      if (this.fields == null) {
        this.fields = new List<Schema.SObjectField>();
      }
      return this.fields;
    }
    set;
  }
  @TestVisible
  protected Map<String, List<Schema.SObjectField>> crossObjectQueries {
    get {
      if (this.crossObjectQueries == null) {
        this.crossObjectQueries = new Map<String, List<Schema.SObjectField>>();
      }
      return this.crossObjectQueries;
    }
    set;
  }
  @TestVisible
  protected Map<String, List<Schema.SObjectField>> relatedListQueries {
    get {
      if (this.relatedListQueries == null) {
        this.relatedListQueries = new Map<String, List<Schema.SObjectField>>();
      }
      return this.relatedListQueries;
    }
    set;
  }

  /**
   * @description Should return the type of SObject that the CoreLibs_BaseSelector is for
   * @return Schema.SObjectTyp such as Account.getSObjectType() or Case.getSObjectType()
   */
  public abstract Schema.SObjectType getSObjectType();

  /**
   * @description Sets the fields to be queried -- must be set prior to invoking inherited
   * CoreLibs_BaseSelector methods or invoking the buildQueryString helper.
   * @param fields Fields on the object (provided by getSObjectType override) to query for
   * @return Reference to the invoking object
   */
  public CoreLibs_BaseSelector setFields(List<Schema.SObjectField> fields) {
    this.fields = fields;
    return this;
  }

  /**
   * @description Sets a related list to be queried -- must be set prior to invoking inherited
   * CoreLibs_BaseSelector methods or invoking the buildQueryString helper. Multiple related lists
   * (assuming different relation names) can be set in a single query
   * @param relationName String representation of a relation e.g. MyRelatedObjects__r
   * @param fields Fields on the related object to query
   * @return Reference to the invoking object
   */
  public CoreLibs_BaseSelector addRelatedListQuery(String relationName, List<Schema.SObjectField> fields) {
    this.relatedListQueries.put(relationName, fields);
    return this;
  }

  /**
   * @description Sets a parent object to be queried -- must be set prior to invoking inherited
   * CoreLibs_BaseSelector methods or invoking the buildQueryString helper. Multiple parent objects
   * (assuming different relation names) can be set in a single query
   * @param relationName String representation of a relation e.g. MyParentObject__r
   * @param fields Fields on the related object to query
   * @return Reference to the invoking object
   */
  public CoreLibs_BaseSelector addCrossObjectQuery(String relationName, List<Schema.SObjectField> fields) {
    this.crossObjectQueries.put(relationName, fields);
    return this;
  }

  /**
   * @description Clears the related list queries -- useful if reusing the same CoreLibs_BaseSelector
   * @return Reference to the invoking object
   */
  public CoreLibs_BaseSelector clearRelatedListQueries() {
    this.relatedListQueries.clear();
    return this;
  }

  /**
   * @description Clears the cross object queries -- useful if reusing the same CoreLibs_BaseSelector
   * @return Reference to the invoking object
   */
  public CoreLibs_BaseSelector clearCrossObjectQueries() {
    this.crossObjectQueries.clear();
    return this;
  }

  /**
   * @description Sets the limit for the query
   * @param recordLimit LIMIT value to apply
   * @return Reference to the invoking object
   */
  public CoreLibs_BaseSelector setLimit(Integer recordLimit) {
    this.recordLimit = recordLimit;
    return this;
  }

  /**
   * @description Sets the offset for the query
   * @param recordOffset OFFSET value to aplly
   * @return Reference to the invoking object
   */
  public CoreLibs_BaseSelector setOffset(Integer recordOffset) {
    this.recordOffset = recordOffset;
    return this;
  }

  /**
   * @description Sets the ordering for the query
   * @param orderBy Ordering to orderby
   * @return Reference to the invoking object
   */
  public CoreLibs_BaseSelector setOrderBy(String orderBy) {
    this.orderBy = orderBy;
    return this;
  }

  /**
   * @description Queries records by Id
   * @param recordIds Set of record ids to filter on
   * @return Records resulting from the query
   */
  public List<SObject> getById(Set<Id> recordIds) {
    return Database.query(this.buildQueryString('Id IN :recordIds'));
  }

  /**
   * @description Queries records by record type id
   * @param recordTypeIds Set of record type ids to filter on
   * @return Records resulting from the query
   */
  public List<SObject> getByRecordType(Set<Id> recordTypeIds) {
    return Database.query(this.buildQueryString('RecordTypeId IN :recordTypeIds'));
  }

  /**
   * @description Queries records by record type developer name
   * @param recordTypeDeveloperNames Set of record type developer names to filter on
   * @return Records resulting from the query
   */
  public List<SObject> getByRecordType(Set<String> recordTypeDeveloperNames) {
    return Database.query(this.buildQueryString('RecordType.DeveloperName IN :recordTypeDeveloperNames'));
  }

  /**
   * @description Queries record by record id and record type id
   * @param recordIds Set of record ids to filter on
   * @param recordTypeIds Set of record type ids to filter on
   * @return Records resulting from the query
   */
  public List<SObject> getByIdAndRecordType(Set<Id> recordIds, Set<Id> recordTypeIds) {
    return Database.query(this.buildQueryString('Id IN :recordIds AND RecordTypeId IN :recordTypeIds'));
  }

  /**
   * @description Queries record by record id and record type id
   * @param recordIds Set of record ids to filter on
   * @param recordTypeIds Set of record type ids to filter on
   * @return Records resulting from the query
   */
  public List<SObject> getByIdAndRecordType(Set<Id> recordIds, Set<String> recordTypeDeveloperNames) {
    return Database.query(
      this.buildQueryString('Id IN :recordIds AND RecordType.DeveloperName IN :recordTypeDeveloperNames')
    );
  }

  /**
   * @description Queries record by record type developer names
   */
  public List<SObject> getByDeveloperName(Set<String> developerNames) {
    return Database.query(this.buildQueryString('DeveloperName IN :developerNames'));
  }

  /**
   * @description Queries records by name
   * @param names Set of name values to filter on
   * @return Records resulting from the query
   */
  public List<SObject> getByName(Set<String> names) {
    return Database.query(this.buildQueryString('Name IN :names'));
  }

  /**
   * @description Returns records that statisfy all fitlers
   * @param filters String filters e.g. MyField__c = \'123\'
   * @return Records resulting from the query
   */
  public List<SObject> getByFilters(List<String> filters) {
    return Database.query(this.buildQueryString(String.join(filters, ' AND ')));
  }

  /**
   * @description WARNING USE WITH CAUTION. SHOULD ONLY BE USED WITH TABLES THAT ARE GUARANTEED TO
   * BE LOW VOLUME. Queries all data for a table. Virtual so that child selectors that are for custom
   * metadata can override with custom metadata specific features, which is hard to do dynamically.
   * @return all records for a table
   */
  public virtual List<SObject> getAll() {
    return Database.query(this.buildQueryString(''));
  }

  /**
   * @description Standalone dynamic query builder -- this should used sparingly but can definitely be
   * in situations where a query being executed is very dynamic
   * @param fields Fields to query for
   * @param sObjType SObject type to query against
   * @param filter Filter string to use
   */
  public String buildQuery(List<String> fields, String filter) {
    String query =
      'SELECT ' +
      String.join(fields, ',') +
      ' FROM ' +
      String.valueOf(this.getSObjectType()) +
      ' WHERE ' +
      filter;
    if (CoreLibs_DataSettings.getInstance().isFlsEnforced()) {
      query += ' WITH SECURITY_ENFORCED';
    }
    return query;
  }

  /**
   * @description Helper for building a query string based on a filter, ordering and limit
   * Note that this may be changed in the future if we decided to move Ordering/Limit/Offset/etc.
   * to be settable by invoking client code
   * @param filter WHERE clause value without the WHERE e.g. Id IN :myIds. Supports variable binding so
   * long as the query is executed in the scope where the binding exists (see getById as an example)
   * @param orderBy ORDER BY clause value without the ORDER BY e.g. MyCustomField__c ASC, MyOtherCustomField__c ASC
   * @return Valid string that can be used as a query
   */
  @TestVisible
  protected String buildQueryString(String filter) {
    String queryString = 'SELECT ';
    List<String> fields = this.fields.isEmpty() ? new List<String>{ 'Id' } : this.processFields('', this.fields);
    for (String relation : this.crossObjectQueries.keySet()) {
      fields.addAll(this.processFields(relation, this.crossObjectQueries.get(relation)));
    }
    for (String relation : this.relatedListQueries.keySet()) {
      fields.add(
        '(SELECT ' +
          String.join(this.processFields('', this.relatedListQueries.get(relation)), ',') +
          ' FROM ' +
          relation +
          ')'
      );
    }
    queryString += String.join(fields, ',') + ' FROM ' + String.valueOf(this.getSObjectType());
    if (String.isNotBlank(filter)) {
      queryString += ' WHERE ' + filter;
    }
    if (CoreLibs_DataSettings.getInstance().isFlsEnforced()) {
      queryString += ' WITH SECURITY_ENFORCED';
    }
    if (String.isNotBlank(this.orderBy)) {
      queryString += ' ORDER BY ' + this.orderBy;
    }
    if (this.recordLimit != null) {
      queryString += ' LIMIT ' + String.valueOf(recordLimit);
    }
    if (this.recordOffset != null) {
      queryString += ' OFFSET ' + String.valueOf(this.recordOffset);
    }
    return queryString;
  }

  /**
   * @description Helper for processing fields and converting them to valid strings to be used in a query
   * @param prefix Prefix to apply to the field, usually a relation name e.g. MyCustomRelation__r
   * @param fields Fields to convert to strings
   * @return List of converted strings to process
   */
  @TestVisible
  protected List<String> processFields(String prefix, List<Schema.SObjectField> fields) {
    List<String> fieldStrings = new List<String>();
    for (Schema.SObjectField field : fields) {
      fieldStrings.add(String.isBlank(prefix) ? String.valueOf(field) : prefix + '.' + String.valueOf(field));
    }
    return fieldStrings;
  }
}
