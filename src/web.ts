import { WebPlugin } from '@capacitor/core';
import { CheckAppUpdatePlugin } from './definitions';

export class CheckAppUpdateWeb extends WebPlugin implements CheckAppUpdatePlugin {
  constructor() {
    super({
      name: 'CheckAppUpdate',
      platforms: ['web']
    });
  }

  async canUpdate(): Promise<{ value: boolean }> {
    return Promise.reject('Web implementation not supported for AppUpdatePlugin');
  }
}

const CheckAppUpdate = new CheckAppUpdateWeb();

export { CheckAppUpdate };

import { registerWebPlugin } from '@capacitor/core';
registerWebPlugin(CheckAppUpdate);
