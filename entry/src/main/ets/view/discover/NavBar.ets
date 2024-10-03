import { rvp } from '../../common/utils/DeviceScreen'
import { BarData } from '../../component/ScrollContainer'

@Component
export default struct NavBar {
  @Prop barData: BarData
  @StorageProp('topRectHeight')
  topRectHeight: number = 0

  build() {
    Row() {
      Text('家庭服务').fontSize(18).fontWeight(700).fontColor($r('app.color.black'))
      Image($r('app.media.message')).width(rvp(20)).height(rvp(20)).fillColor($r('app.color.black'))
    }
    .width('100%')
    .justifyContent(FlexAlign.SpaceBetween)
    .padding({
      left: rvp(18),
      right: rvp(8),
      top: rvp(12) + this.topRectHeight,
      bottom: rvp(12)
    })
    .backgroundColor(this.barData.bgColor)
  }
}