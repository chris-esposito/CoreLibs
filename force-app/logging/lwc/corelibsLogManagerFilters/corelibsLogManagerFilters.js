import { LightningElement } from 'lwc';

const TYPE_OPTIONS = [
  { label: '', value: '' },
  { label: 'INFO', value: 'INFO' },
  { label: 'WARN', value: 'WARN' },
  { label: 'ERROR', value: 'ERROR' }
];

export default class CorelibsLogManagerFilters extends LightningElement {
  get options() {
    return TYPE_OPTIONS ?? [];
  }

  applyFilters() {
    const filters = {};
    const inputs = this.template.querySelectorAll('lightning-input');
    inputs.forEach((input) => {
      if (input.value) {
        filters[input.name] = input.value;
      }
    });
    const dropdowns = this.template.querySelectorAll('lightning-combobox');
    dropdowns.forEach((dropdown) => {
      if (dropdown.value) {
        filters[dropdown.name] = dropdown.value;
      }
    });
    this.dispatchEvent(new CustomEvent('applyfilter', { detail: filters }));
  }

  clearFilters() {
    const inputs = this.template.querySelectorAll('lightning-input');
    inputs.forEach((input) => {
      input.value = null;
    });
    const dropdowns = this.template.querySelectorAll('lightning-combobox');
    dropdowns.forEach((dropdown) => {
      dropdown.value = '';
    });
    this.applyFilters();
  }
}
