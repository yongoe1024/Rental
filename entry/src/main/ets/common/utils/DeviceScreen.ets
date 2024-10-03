/**
 * 屏幕设备工具类
 * @author yongoe
 * @since 2024/9/2
 */
import { GlobalContext } from './GlobalContext'
import { window } from '@kit.ArkUI'

/**
 * 获取状态栏高度
 */
export const getTopRectHeight = (): number => {
  return AppStorage.get<number>('topRectHeight') || 0
}

/**
 * 获取底部高度(实时)
 */
export const getBottomRectHeight = (): number => {
  return AppStorage.get<number>('bottomRectHeight') || 0
}

/**
 * 获取窗口宽度(实时)
 */
export function getWindowWidth() {
  return AppStorage.get<number>('windowWidth') || 360
}

/**
 * 获取窗口高度(实时)
 */
export function getWindowHeight() {
  return AppStorage.get<number>('windowHeight') || 780
}

/**
 * 将元素按照原来比例进行转化
 */
export function rvp(val: number): number {
  // 设计稿与模拟器的固定值360
  return val / 360 * getWindowWidth()
}

/**
 * 设置系统状态栏
 */
export function setSystemBar(prop: window.SystemBarProperties) {
  const windowClass = GlobalContext.getContext().getWindowClass()
  if (windowClass) {
    windowClass.setWindowSystemBarProperties(prop)
  }
}