/**
 * @author yongoe
 * @since 2024/9/3
 */
import { rvp } from '../../common/utils/DeviceScreen'
import { BarData } from '../../component/ScrollContainer'

@Component
export struct NavBar {
  @StorageProp('topRectHeight')
  topRectHeight: number = 0
  @Prop barData: BarData

  build() {
    Row() {
      Row({ space: rvp(6) }) {
        Text('请选择地址')
          .fontSize(12)
          .fontColor(this.barData.fontColor)
          .fontWeight(500)
        Image($r('app.media.arrow_down'))
          .width(rvp(6))
          .height(rvp(6))
          .fillColor(this.barData.fontColor)
          .margin({ bottom: rvp(3) })
      }

      Row({ space: rvp(28) }) {
        Column({ space: rvp(1) }) {
          Image($r('app.media.message'))
            .width(rvp(20))
            .height(rvp(20))
            .fillColor(this.barData.fontColor)
          Text('消息')
            .fontSize(10)
            .fontColor(this.barData.fontColor)
        }

        Column({ space: rvp(1) }) {
          Image($r('app.media.customer'))
            .width(rvp(20))
            .height(rvp(20))
            .fillColor(this.barData.fontColor)
          Text('客服')
            .fontSize(10)
            .fontColor(this.barData.fontColor)
        }
      }

    }
    .width('100%')
    .justifyContent(FlexAlign.SpaceBetween)
    .padding({
      left: rvp(8),
      right: rvp(8),
      top: rvp(8) + this.topRectHeight,
      bottom: rvp(8)
    })
    .backgroundColor(this.barData.bgColor)
  }
}

