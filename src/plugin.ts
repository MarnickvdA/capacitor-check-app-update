import { Plugins } from '@capacitor/core';
import {CheckAppUpdateInterface} from "./definitions";

const { CheckAppUpdatePlugin } = Plugins;

export class CheckAppUpdate implements CheckAppUpdateInterface {
    canUpdate(): Promise<{ value: boolean }> {
        return CheckAppUpdatePlugin.canUpdate();
    }
}
