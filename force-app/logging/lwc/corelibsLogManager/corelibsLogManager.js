import { LightningElement } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import hasManageLogPermissions from '@salesforce/customPermission/CoreLibs_ManageLogs';
import getLogs from '@salesforce/apex/CoreLibs_LogController.getLogs';

const LOAD_LOGS_ERROR =
  'There was an error loading logs. Please refresth the page. If the error persists, contact your Salesforce Administrator';

export default class CorelibsLogManager extends LightningElement {
  _logs;
  _retrievingLogs;

  get logs() {
    return this._logs ?? [];
  }

  get loading() {
    return this._retrievingLogs;
  }

  get showApp() {
    return hasManageLogPermissions;
  }

  connectedCallback() {
    this.loadLogs();
  }

  async onApplyFilter(event) {
    this.loadLogs(event.detail);
  }

  async loadLogs(filter) {
    try {
      this._retrievingLogs = true;
      this._logs = await getLogs({ filters: filter ?? {} });
      this._retrievingLogs = false;
    } catch (e) {
      console.error(e);
      this.dispatchEvent(new ShowToastEvent({ variant: 'error', message: LOAD_LOGS_ERROR }));
    }
  }
}
