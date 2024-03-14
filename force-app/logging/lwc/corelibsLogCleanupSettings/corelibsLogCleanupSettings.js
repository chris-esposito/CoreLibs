import { LightningElement } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import { executeApex } from 'c/corelibsApexApi';
import getLogCleanupSettings from '@salesforce/apex/CoreLibs_LogController.getLogCleanupSettings';
import saveRetainLogsForSetting from '@salesforce/apex/CoreLibs_LogController.saveRetainLogsForSetting';
import scheduleLogCleanupJob from '@salesforce/apex/CoreLibs_LogController.scheduleLogCleanupJob';

const SAVE_SETTINGS_ERROR =
  'There was an error saving settings. Please Try again. If the error persists, contact your Salesforce Administrator.';
const LOAD_SETTINGS_ERROR =
  'There was an error loading settings. Please refresth the page. If the error persists, contact your Salesforce Administrator';
const SAVE_SETTINGS_SUCCESS = 'Settings successfully saved.';

export default class CorelibsLogCleanupSettings extends LightningElement {
  _settings = {};
  _retrievingSettings;
  _savingSettings;

  get loading() {
    return this._retrievingSettings || this._savingSettings;
  }

  get currentSchedule() {
    return `Current Daily Schedule: ${this._settings?.scheduledTime ?? 'Not Scheduled'}`;
  }

  get lastRun() {
    return `Last Run: ${
      this._settings?.lastRun
        ? new Date(this._settings.lastRun).toLocaleString() + ' (' + this._settings.lastRunStatus + ')'
        : 'Never'
    }`;
  }

  get currentRetainForValue() {
    return this._settings?.retainLogsFor;
  }

  connectedCallback() {
    this.loadCleanupSettings();
  }

  async loadCleanupSettings() {
    this._retrievingSettings = true;
    this._settings = await executeApex(this, getLogCleanupSettings, {}, LOAD_SETTINGS_ERROR);
    this._retrievingSettings = false;
  }

  async saveRetainLogsFor() {
    this._savingSettings = true;
    await executeApex(this, saveRetainLogsForSetting, { numOfDays: this._settings.retainLogsFor }, SAVE_SETTINGS_ERROR);
    this._savingSettings = false;
    this.showSuccessToastMessage(SAVE_SETTINGS_SUCCESS);
  }

  async scheduleCleanupJob() {
    this._savingSettings = true;
    await executeApex(
      this,
      scheduleLogCleanupJob,
      { scheduledTime: this._settings.scheduledTime },
      SAVE_SETTINGS_ERROR
    );
    this._savingSettings = false;
    this.showSuccessToastMessage(SAVE_SETTINGS_SUCCESS);
  }

  onRetainLogsForChange(event) {
    this._settings.retainLogsFor = event.detail.value;
  }

  onSetScheduleTime(event) {
    this._settings.scheduledTime = event.detail.value;
  }

  showSuccessToastMessage(message) {
    this.dispatchEvent(
      new ShowToastEvent({
        message: message,
        variant: 'success'
      })
    );
  }
}
