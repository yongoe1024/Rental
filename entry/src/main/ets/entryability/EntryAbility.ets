import { AbilityConstant, UIAbility, Want } from '@kit.AbilityKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { display, window } from '@kit.ArkUI';
import { GlobalContext } from '../common/utils/GlobalContext';

export default class EntryAbility extends UIAbility {
  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam): void {
    GlobalContext.getContext().setObject('abilityWant', want);
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onCreate');
  }

  onDestroy(): void {
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onDestroy');
  }

  onWindowStageCreate(windowStage: window.WindowStage): void {
    // Main window is created, set main page for this ability
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onWindowStageCreate');

    windowStage.loadContent('pages/Index', (err) => {
      if (err.code) {
        hilog.error(0x0000, 'testTag', 'Failed to load the content. Cause: %{public}s', JSON.stringify(err) ?? '');
        return;
      }
      hilog.info(0x0000, 'testTag', 'Succeeded in loading the content.');
    });
    const context = GlobalContext.getContext()
    context.setObject('display', display.getDefaultDisplaySync());
    context.setObject('windowClass', windowStage.getMainWindowSync());

    //窗口对象
    const windowClass = windowStage.getMainWindowSync()
    // 1. 设置窗口全屏
    windowClass.setWindowLayoutFullScreen(true)
    // 2. 注册监听函数，动态获取避让区域数据
    const statusBar = windowClass.getWindowAvoidArea(window.AvoidAreaType.TYPE_SYSTEM)
    const navigationArea = windowClass.getWindowAvoidArea(window.AvoidAreaType.TYPE_NAVIGATION_INDICATOR);
    const bottomRectHeight = navigationArea.bottomRect.height; // 获取到导航条区域的高度
    // 获取状态栏高度
    AppStorage.setOrCreate('topRectHeight', px2vp(statusBar.topRect.height))
    // 获取导航条高度
    AppStorage.setOrCreate('bottomRectHeight', px2vp(bottomRectHeight))
    // 获取窗口宽高
    const props = windowClass.getWindowProperties()
    AppStorage.setOrCreate('windowWidth', px2vp(props.windowRect.width))
    AppStorage.setOrCreate('windowHeight', px2vp(props.windowRect.height))
    try {
      windowClass.on('avoidAreaChange', (data) => {
        if (data.type === window.AvoidAreaType.TYPE_SYSTEM) {
          const topRectHeight = data.area.topRect.height;
          AppStorage.setOrCreate('topRectHeight', px2vp(topRectHeight));
        } else if (data.type == window.AvoidAreaType.TYPE_NAVIGATION_INDICATOR) {
          const bottomRectHeight = data.area.bottomRect.height;
          AppStorage.setOrCreate('bottomRectHeight', px2vp(bottomRectHeight));
        }
      })
    } catch (exception) {
      console.error(`Failed to enable the listener for system avoid area changes. Cause code: ${exception.code}, message: ${exception.message}`);
    }
    // 3. 注册监听函数，监听窗口大小变化
    try {
      windowClass.on('windowSizeChange', (data) => {
        AppStorage.setOrCreate('windowWidth', px2vp(data.width))
        AppStorage.setOrCreate('windowHeight', px2vp(data.height))
      });
    } catch (exception) {
      console.error(`Failed to enable the listener for window size changes. Cause code: ${exception.code}, message: ${exception.message}`);
    }
  }

  onWindowStageDestroy(): void {
    // Main window is destroyed, release UI related resources
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onWindowStageDestroy');
  }

  onForeground(): void {
    // Ability has brought to foreground
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onForeground');
  }

  onBackground(): void {
    // Ability has back to background
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onBackground');
  }
}
