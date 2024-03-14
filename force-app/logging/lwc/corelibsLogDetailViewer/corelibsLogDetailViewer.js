import { api, LightningElement, wire } from 'lwc';

import getLogDetails from '@salesforce/apex/CoreLibs_LogController.getLogDetails';
export default class CorelibsLogDetailViewer extends LightningElement {
  @api
  recordId = '';

  _details = {};

  get details() {
    return JSON.stringify(this._details, null, 2);
  }

  @wire(getLogDetails, { recordId: '$recordId' })
  loadDetails({ error, data }) {
    if (error) {
      console.error(error);
    } else if (data) {
      this._details = JSON.parse(data);
    }
  }
}
