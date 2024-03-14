import { LightningElement, api } from 'lwc';
import { openTab } from 'lightning/platformWorkspaceApi';

const ACTIONS = [{ label: 'View', name: 'viewLog' }];

const COLUMNS = [
  { label: 'Log Type', fieldName: 'Type__c' },
  { label: 'Transaction Id', fieldName: 'TransactionId__c' },
  { label: 'Transaction Type', fieldName: 'TransactionType__c' },
  { label: 'Running User', fieldName: 'RunningUserName__c' },
  { label: 'Log Created On', fieldName: 'LogCreationTimestamp__c', type: 'date' },
  {
    type: 'action',
    typeAttributes: { rowActions: ACTIONS }
  }
];

export default class CorelibsLogManagerResults extends LightningElement {
  @api
  logs;

  get tableColumns() {
    return COLUMNS || [];
  }

  async handleRowAction(event) {
    switch (event.detail.action.name) {
      case 'viewLog':
        openTab({ recordId: event.detail.row.Id, focus: false });
        break;
      default:
    }
  }
}
