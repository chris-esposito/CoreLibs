import { LightningElement, api } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';

import getTeamViewerColumns from '@salesforce/apex/CoreLibs_TeamViewerController.getTeamViewerColumns';
import getTeamMembers from '@salesforce/apex/CoreLibs_TeamViewerController.getTeamMembers';

const DEFAULT_FIELD_SETS = {
  accountteammember: 'CoreLibs_AccountTeamViewerDefaultFields'
};
const TYPE_MAPPING = {
  STRING: 'text',
  PHONE: 'phone',
  EMAIL: 'email'
};
const NO_ID_ERROR = 'Invalid Record Id: No Id provided.';
const NO_SOBJECT_TYPE_ERROR = 'Invalid SObject Type: No SObject type provided.';
const INVALID_SOBJECT_TYPE = 'Invalid SObject Type: SObject must be AccountTeamMember.';
const GENERAL_ERROR = 'There was an issue loading team members.';

export default class CorelibsTeamViewer extends LightningElement {
  @api
  recordId = '';
  @api
  sObjectType = '';
  @api
  fieldSet = '';

  get isLoading() {
    return this._makingApexCall;
  }

  get columns() {
    return this._columns || [];
  }

  get rows() {
    return this._teamMembers || [];
  }

  _makingApexCall;
  _teamMembers;
  _columns;

  connectedCallback() {
    if (this.validateProps()) {
      this.loadComponentDetails();
    }
  }

  validateProps() {
    const errors = [];
    if (!this.recordId) {
      errors.push(NO_ID_ERROR);
    }
    if (!this.sObjectType) {
      errors.push(NO_SOBJECT_TYPE_ERROR);
    } else if (!Object.hasOwn(DEFAULT_FIELD_SETS, this.sObjectType.toLowerCase())) {
      errors.push(INVALID_SOBJECT_TYPE);
    }
    if (errors.length) {
      this.showErrorToast('Configuration Error', errors.join('\n'));
    }
    return errors.length === 0;
  }

  async loadComponentDetails() {
    try {
      this._makingApexCall = true;
      const results = await Promise.all([
        getTeamViewerColumns({
          sObjType: this.sObjectType,
          fieldSetName: this.getFieldSetName()
        }),
        getTeamMembers({
          recordId: this.recordId,
          sObjType: this.sObjectType,
          fieldSetName: this.getFieldSetName()
        })
      ]);
      this._columns = results[0].map((columnData) => ({
        label: columnData.label,
        fieldName: columnData.apiName,
        type: TYPE_MAPPING[columnData.type]
      }));
      this._teamMembers = results[1].records.map((record) => {
        const processedRecord = {};
        // its a join e.g. cross object query, check 1 level deep
        Object.entries(record).forEach(([field, fieldValue]) => {
          if (typeof fieldValue === 'object' && fieldValue !== null) {
            Object.entries(fieldValue).forEach(([crossObjectField, crossObjectFieldValue]) => {
              processedRecord[`${field}.${crossObjectField}`] = crossObjectFieldValue;
            });
          } else {
            processedRecord[field] = fieldValue;
          }
        });
        return processedRecord;
      });
      this._makingApexCall = false;
    } catch (e) {
      this.showErrorToast('Error', GENERAL_ERROR);
    }
  }

  getFieldSetName() {
    return this.fieldSet ? this.fieldSet : DEFAULT_FIELD_SETS[this.sObjectType.toLowerCase()];
  }

  showErrorToast(title, message) {
    this.dispatchEvent(
      new ShowToastEvent({
        title: title,
        message: message,
        variant: 'error'
      })
    );
  }
}
