declare global {
  interface PluginRegistry {
    CheckAppUpdatePlugin?: CheckAppUpdate;
  }
}

export interface CheckAppUpdate {
  canUpdate(): Promise<{value: boolean}>;
}
