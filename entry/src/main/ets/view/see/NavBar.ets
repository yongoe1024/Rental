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
      Row({ space: rvp(16) }) {
        Image($r('app.media.bag'))
          .width(rvp(20))
          .height(rvp(20))
        Text('填写通勤地址')
          .fontSize(rvp(12))
          .fontWeight(500)
          .fontColor($r('app.color.black'))
      }

      Row({ space: rvp(28) }) {
        Column({ space: 1 }) {
          Image($r('app.media.message'))
            .width(rvp(20))
            .height(rvp(20))
            .fillColor($r('app.color.black'))
          Text('消息')
            .fontSize(rvp(10))
            .fontColor($r('app.color.black'))
        }

        Column({ space: 1 }) {
          Image($r('app.media.journey'))
            .width(rvp(20))
            .height(rvp(20))
            .fillColor($r('app.color.black'))
          Text('消息')
            .fontSize(10)
            .fontColor($r('app.color.black'))
        }
      }

    }
    .width('100%')
    .justifyContent(FlexAlign.SpaceBetween)
    .backgroundColor(this.barData.bgColor)
    .padding({
      left: 8,
      right: 8,
      top: 8 + this.topRectHeight,
      bottom: 8
    })

  }
}

