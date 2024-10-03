/**
 * 通用导航栏组件
 * @author yongoe
 * @since 2024/9/6
 */
import { router } from '@kit.ArkUI'
import { rvp } from '../../common/utils/DeviceScreen'
import { BarData } from '../../component/ScrollContainer'

@Component
export struct NavBar {
  //导航标题
  @Prop title: string
  @StorageProp('topRectHeight')
  topRectHeight: number = 0

  build() {
    Row() {
      Image($r('app.media.back'))
        .width(rvp(20))
        .height(rvp(20))
        .onClick(() => {
          router.back()
        })
      Text(this.title)
        .fontWeight(500)
        .fontSize(14)
        .textAlign(TextAlign.Center)
      Blank()
      Image($r('app.media.share'))
        .width(rvp(20))
        .height(rvp(20))
        .onClick(() => {
        })

    }
    .width('100%')
    .backgroundColor(Color.White)
    .padding({
      left: rvp(16),
      right: rvp(16),
      top: rvp(16) + this.topRectHeight,
      bottom: rvp(16)
    })
  }
}

