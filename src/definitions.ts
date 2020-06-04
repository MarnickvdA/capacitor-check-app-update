declare global {
  interface PluginRegistry {
    CheckAppUpdatePlugin?: CheckAppUpdateInterface;
  }
}

export interface CheckAppUpdateInterface {
  canUpdate(): Promise<{value: boolean}>;
}
