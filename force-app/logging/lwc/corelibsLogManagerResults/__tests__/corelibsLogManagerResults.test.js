import { createElement } from 'lwc';
import CorelibsLogManagerResults from 'c/corelibsLogManagerResults';

import * as WorkspaceAPI from 'lightning/platformWorkspaceApi';

const openTabSpy = jest.spyOn(WorkspaceAPI, 'openTab');

describe('c-corelibs-log-manager-results', () => {
  afterEach(() => {
    // The jsdom instance is shared across test cases in a single file so reset the DOM
    while (document.body.firstChild) {
      document.body.removeChild(document.body.firstChild);
    }
  });

  it('should set log records in the datatable', async () => {
    const element = createElement('c-corelibs-log-manager-results', {
      is: CorelibsLogManagerResults
    });
    element.logs = [
      {
        Type__c: 'ERROR',
        TransactionId__c: '123',
        TransactionType__c: 'ANONYMOUS',
        RunningUserName__c: 'Test User',
        LogCreationTimestamp__c: '2024-01-01'
      },
      {
        Type__c: 'ERROR',
        TransactionId__c: 'abc',
        TransactionType__c: 'ANONYMOUS',
        RunningUserName__c: 'Test User',
        LogCreationTimestamp__c: '2024-01-01'
      }
    ];
    document.body.appendChild(element);

    await Promise.resolve();
    const datatable = element.shadowRoot.querySelector('lightning-datatable');
    const rows = datatable.data.length;
    expect(rows).toBe(2);
  });

  it('should open a new tab when a row is selected to view', async () => {
    const element = createElement('c-corelibs-log-manager-results', {
      is: CorelibsLogManagerResults
    });
    element.logs = [
      {
        Type__c: 'ERROR',
        TransactionId__c: '123',
        TransactionType__c: 'ANONYMOUS',
        RunningUserName__c: 'Test User',
        LogCreationTimestamp__c: '2024-01-01'
      }
    ];
    document.body.appendChild(element);

    const rowActionEvent = new CustomEvent('rowaction', {
      detail: {
        action: { name: 'viewLog' },
        row: { id: '123' }
      }
    });

    const dataTable = element.shadowRoot.querySelector('lightning-datatable');
    dataTable.dispatchEvent(rowActionEvent);

    await Promise.resolve();

    // verify we successfully execute
    expect(openTabSpy).toHaveBeenCalledTimes(1);
  });
});
