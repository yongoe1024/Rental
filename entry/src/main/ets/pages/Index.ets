import { setSystemBar } from '../common/utils/DeviceScreen'
import { Discover } from '../view/index/Discover'
import { Home } from '../view/index/Home'
import { My } from '../view/index/My'
import { See } from '../view/index/See'
import { Service } from '../view/index/Service'

PersistentStorage.persistProp('token', '')

@Entry
@Component
struct Index {
  @State index: number = 0
  @StorageProp('bottomRectHeight')
  bottomRectHeight: number = 0

  aboutToAppear(): void {
    this.changeBar()
  }

  /**
   * 切换菜单改变状态栏
   */
  changeBar() {
    if (this.index == 0) {
      setSystemBar({
        statusBarContentColor: '#ffffff'
      })
    } else if (this.index == 1) {
      setSystemBar({
        statusBarContentColor: '#000000'
      })
    } else if (this.index == 2) {
      setSystemBar({
        statusBarContentColor: '#ffffff'
      })
    } else if (this.index == 3) {
      setSystemBar({
        statusBarContentColor: '#000000'
      })
    } else if (this.index == 4) {
      setSystemBar({
        statusBarContentColor: '#ffffff'
      })
    }
  }

  @Builder
  tabBar(image: Resource, activeImage: Resource, text: string, index: number) {
    Column() {
      Image(this.index == index ? activeImage : image)
        .width(28)
        .height(28)
      Text(text)
        .fontSize(10)
        .fontColor(this.index == index ? '#000' : '#a0a0a0')
    }
  }

  build() {
    Tabs({ barPosition: BarPosition.End, index: this.index }) {
      TabContent() {
        Home()
      }.tabBar(this.tabBar($r('app.media.tabbar_home'), $r('app.media.tabbar_home_active'), '首页', 0))

      TabContent() {
        See()
      }.tabBar(this.tabBar($r('app.media.tabbar_see'), $r('app.media.tabbar_see_active'), '想看', 1))

      TabContent() {
        Service()
      }.tabBar(this.tabBar($r('app.media.tabbar_service'), $r('app.media.tabbar_service_active'), '服务', 2))

      TabContent() {
        Discover()
      }.tabBar(this.tabBar($r('app.media.tabbar_discover'), $r('app.media.tabbar_discover_active'), '发现', 3))

      TabContent() {
        My()
      }.tabBar(this.tabBar($r('app.media.tabbar_my'), $r('app.media.tabbar_my_active'), '我的', 4))
    }
    .width('100%')
    .barHeight(50 + this.bottomRectHeight) // 禁止滚动切换tab
    .scrollable(false)
    .onChange((index: number) => {
      this.index = index
      this.changeBar()
    })
  }
}
