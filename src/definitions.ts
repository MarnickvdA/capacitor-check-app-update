declare module "@capacitor/core" {
  interface PluginRegistry {
    CheckAppUpdate: CheckAppUpdatePlugin;
  }
}

export interface CheckAppUpdatePlugin {
  canUpdate(): Promise<{value: boolean}>;
}
