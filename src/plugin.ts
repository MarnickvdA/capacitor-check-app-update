import { Plugins } from '@capacitor/core';
import {CheckAppUpdateInterface} from "./definitions";

const {CheckAppUpdatePlugin} = Plugins;

export class CheckAppUpdate implements CheckAppUpdateInterface {
    canUpdate(options: { locale: string }): Promise<{value: boolean}> {
        return CheckAppUpdatePlugin.canUpdate(options);
    }
}
