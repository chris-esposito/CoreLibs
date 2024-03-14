import { createElement } from 'lwc';
import CorelibsTeamViewer from 'c/corelibsTeamViewer';
import { ShowToastEventName } from 'lightning/platformShowToastEvent';

import getTeamViewerColumns from '@salesforce/apex/CoreLibs_TeamViewerController.getTeamViewerColumns';
import getTeamMembers from '@salesforce/apex/CoreLibs_TeamViewerController.getTeamMembers';

jest.mock(
  '@salesforce/apex/CoreLibs_TeamViewerController.getTeamViewerColumns',
  () => {
    return {
      default: jest.fn()
    };
  },
  { virtual: true }
);

jest.mock(
  '@salesforce/apex/CoreLibs_TeamViewerController.getTeamMembers',
  () => {
    return {
      default: jest.fn()
    };
  },
  { virtual: true }
);

describe('c-corelibs-team-viewer', () => {
  afterEach(() => {
    // The jsdom instance is shared across test cases in a single file so reset the DOM
    while (document.body.firstChild) {
      document.body.removeChild(document.body.firstChild);
    }
  });

  it('Should dispatch an error toast when a record id is not provided', async () => {
    const element = createElement('c-corelibs-team-viewer', {
      is: CorelibsTeamViewer
    });
    element.sObjectType = 'AccountTeamMember';
    const handler = jest.fn();
    element.addEventListener(ShowToastEventName, handler);

    document.body.appendChild(element);

    await Promise.resolve();

    expect(handler).toHaveBeenCalled();
    expect(handler.mock.calls[0][0].detail.title).toBe('Configuration Error');
    expect(handler.mock.calls[0][0].detail.message).toBe('Invalid Record Id: No Id provided.');
    expect(handler.mock.calls[0][0].detail.variant).toBe('error');
  });

  it('Should dispatch an error toast when an SObject type is not provided', async () => {
    const element = createElement('c-corelibs-team-viewer', {
      is: CorelibsTeamViewer
    });
    element.recordId = '123';
    const handler = jest.fn();
    element.addEventListener(ShowToastEventName, handler);

    document.body.appendChild(element);

    await Promise.resolve();

    expect(handler).toHaveBeenCalled();
    expect(handler.mock.calls[0][0].detail.title).toBe('Configuration Error');
    expect(handler.mock.calls[0][0].detail.message).toBe('Invalid SObject Type: No SObject type provided.');
    expect(handler.mock.calls[0][0].detail.variant).toBe('error');
  });

  it('Should dispatch an error toast when an invalid SObject type is provided', async () => {
    const element = createElement('c-corelibs-team-viewer', {
      is: CorelibsTeamViewer
    });
    element.recordId = '123';
    element.sObjectType = 'Contact';
    const handler = jest.fn();
    element.addEventListener(ShowToastEventName, handler);

    document.body.appendChild(element);

    await Promise.resolve();

    expect(handler).toHaveBeenCalled();
    expect(handler.mock.calls[0][0].detail.title).toBe('Configuration Error');
    expect(handler.mock.calls[0][0].detail.message).toBe('Invalid SObject Type: SObject must be AccountTeamMember.');
    expect(handler.mock.calls[0][0].detail.variant).toBe('error');
  });

  it('Should dispatch an error toast when a generic error occurs', async () => {
    getTeamViewerColumns.mockRejectedValue({
      message: 'Mocker error'
    });
    getTeamMembers.mockRejectedValue({
      message: 'Mocker error'
    });

    const element = createElement('c-corelibs-team-viewer', {
      is: CorelibsTeamViewer
    });
    element.recordId = '123';
    element.sObjectType = 'AccountTeamMember';
    const handler = jest.fn();
    element.addEventListener(ShowToastEventName, handler);

    document.body.appendChild(element);

    await new Promise(process.nextTick);

    expect(handler).toHaveBeenCalled();
    expect(handler.mock.calls[0][0].detail.title).toBe('Error');
    expect(handler.mock.calls[0][0].detail.message).toBe('There was an issue loading team members.');
    expect(handler.mock.calls[0][0].detail.variant).toBe('error');
  });

  it('Should render a datatable with team members', async () => {
    getTeamViewerColumns.mockReturnValue([
      {
        label: 'User Name',
        apiName: 'User.Name',
        type: 'STRING'
      }
    ]);
    getTeamMembers.mockReturnValue({
      recordId: '123',
      sObjType: 'AccountTeamMember',
      records: [
        {
          Id: 'abc',
          User: {
            Name: 'Test Tester'
          }
        }
      ]
    });

    const element = createElement('c-corelibs-team-viewer', {
      is: CorelibsTeamViewer
    });

    element.recordId = '123';
    element.sObjectType = 'AccountTeamMember';

    document.body.appendChild(element);

    await new Promise(process.nextTick);

    const dataTable = element.shadowRoot.querySelector('lightning-datatable');
    expect(dataTable.data.length).toBe(1);
  });
});
