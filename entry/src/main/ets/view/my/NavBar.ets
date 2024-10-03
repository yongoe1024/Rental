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
      Row({ space: rvp(2) }) {
        Image($r('app.media.switch')).width(rvp(16)).fillColor(Color.Black)
        Text('业主版').fontSize(rvp(12))
      }
      .borderRadius(rvp(31))
      .backgroundColor('#ffeeeeee')
      .width(rvp(79))
      .height(rvp(26))
      .justifyContent(FlexAlign.Center)

      Row({ space: rvp(16) }) {
        Image($r('app.media.customer')).width(rvp(20)).height(rvp(20)).fillColor(this.barData.fontColor)
        Image($r('app.media.message')).width(rvp(20)).height(rvp(20)).fillColor(this.barData.fontColor)
        Image($r('app.media.setting')).width(rvp(20)).height(rvp(20)).fillColor(this.barData.fontColor)
      }
    }
    .width('100%')
    .justifyContent(FlexAlign.SpaceBetween)
    .padding({
      left: rvp(8),
      right: (8),
      top: this.topRectHeight + rvp(8),
      bottom: rvp(8)
    })
    .backgroundColor(this.barData.bgColor)
  }
}