import { ShowToastEvent } from 'lightning/platformShowToastEvent';

import getUIMessageFromErrorCode from '@salesforce/apex/CoreLibs_ApexApiController.getUIMessageFromErrorCode';

const showErrorToast = (cmp, message) => {
  cmp.dispatchEvent(
    new ShowToastEvent({
      title: 'Error',
      message: message,
      variant: 'error'
    })
  );
};

/**
 * Wraps and executes apex. If an error code is provided, it will post a toast with that UI message
 * if it exists for the error code
 * @param {LightningComponent} cmp Component used for dispatching toasts (used in lieu of binding)
 * @param {Function} fn Apex aura enabled function to execute
 * @param {Any} args Arguments to be passed into the apex function
 * @param {String} unhandledErrorMessage Optional message that can generate a toast if no UI message is found
 * @returns Promise<any>
 */
export const executeApex = (cmp, fn, args, unhandledErrorMessage) => {
  return fn(args).catch((error) => {
    console.error(error);
    let canHandle = false;
    if (error.body?.message) {
      const message = JSON.parse(error.body.message);
      const uiMessage = getUIMessageFromErrorCode({ errorCode: message.errorCode });
      if (uiMessage) {
        canHandle = true;
        showErrorToast(cmp, uiMessage);
      }
    }
    if (!canHandle && unhandledErrorMessage) {
      showErrorToast(cmp, unhandledErrorMessage);
    }
    throw error;
  });
};
