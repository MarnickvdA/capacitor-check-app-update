declare module "@capacitor/core" {
  interface PluginRegistry {
    CheckAppUpdatePlugin: CheckAppUpdateInterface;
  }
}

export interface CheckAppUpdateInterface {
  canUpdate(options: { locale: string }): Promise<{value: boolean}>;
}
