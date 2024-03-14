import { createElement } from 'lwc';
import CorelibsLogDetailViewer from 'c/corelibsLogDetailViewer';

import getLogDetails from '@salesforce/apex/CoreLibs_LogController.getLogDetails';

jest.mock(
  '@salesforce/apex/CoreLibs_LogController.getLogDetails',
  () => {
    const { createApexTestWireAdapter } = require('@salesforce/sfdx-lwc-jest');
    return {
      default: createApexTestWireAdapter(jest.fn())
    };
  },
  { virtual: true }
);

describe('c-corelibs-log-detail-viewer', () => {
  afterEach(() => {
    // The jsdom instance is shared across test cases in a single file so reset the DOM
    while (document.body.firstChild) {
      document.body.removeChild(document.body.firstChild);
    }
  });

  it('should render the json contained in log details', async () => {
    const element = createElement('c-corelibs-log-detail-viewer', {
      is: CorelibsLogDetailViewer
    });
    document.body.appendChild(element);
    getLogDetails.emit('{"abc":"123"}');

    await Promise.resolve();

    const content = element.shadowRoot.querySelector('.log-details');
    expect(content.textContent).toContain('abc');
  });
});
