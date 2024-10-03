/**
 * 全局上下文工具类
 * @author yongoe
 * @since 2024/9/11
 */
import { display, window } from '@kit.ArkUI';
import { Want } from '@kit.AbilityKit';

export class GlobalContext {
  private constructor() {
  }

  private static instance: GlobalContext;
  private _objects = new Map<string, Object>();

  public static getContext(): GlobalContext {
    if (!GlobalContext.instance) {
      GlobalContext.instance = new GlobalContext();
    }
    return GlobalContext.instance;
  }

  getObject(value: string): Object | undefined {
    return this._objects.get(value);
  }

  setObject(key: string, objectClass: Object): void {
    this._objects.set(key, objectClass);
  }

  /**
   * 预置方法abilityWant
   */
  getAbilityWant(): Want | undefined {
    const abilityWant = this._objects.get('abilityWant')
    return abilityWant ? abilityWant as Want : undefined
  }

  /**
   * 预置方法display
   */
  getDisplay(): display.Display | undefined {
    const display = this._objects.get('display')
    return display ? display as display.Display : undefined
  }

  /**
   * 预置方法windowClass
   */
  getWindowClass(): window.Window | undefined {
    const windowClass = this._objects.get('windowClass')
    return windowClass ? windowClass as window.Window : undefined
  }
}