/**
 * @author yongoe
 * @since 2024/9/5
 */
import { rvp } from '../../common/utils/DeviceScreen'
import { BarData } from '../../component/ScrollContainer'
import { VipServiceItem } from '../../viewmodel/ServiceModel'

@Component
export struct VIP {
  @Prop vipServiceList: VipServiceItem[]
  @Prop barData: BarData

  build() {
    Stack() {
      Image($r('app.media.vip_bg'))
        .width(rvp(328))
        .height(rvp(99))
        .objectFit(ImageFit.Fill)
      Column({ space: rvp(14) }) {
        Row() {
          Image($r('app.media.crown'))
            .width(rvp(18))
            .height(rvp(18))
            .objectFit(ImageFit.Fill)
          Text('开通鼓励卡享特权')
            .fontSize(rvp(16))
            .fontColor(Color.White)
            .margin({ left: rvp(8), right: rvp(52) })
          Image($r('app.media.vip'))
            .width(rvp(42))
            .height(rvp(19))
            .objectFit(ImageFit.Fill)

        }

        Row({ space: rvp(32) }) {
          ForEach(this.vipServiceList, (item: VipServiceItem) => {
            Column({ space: rvp(6) }) {
              Text(item.name).fontColor(Color.White).fontSize(rvp(12))
              Text() {
                Span(item.content + '').fontSize(rvp(16)).fontWeight(700)
              }.fontColor($r('app.color.white'))
            }
          })
        }
      }
      .height('100%')
      .justifyContent(FlexAlign.Center)

    }
    .width('100%')
    .height(rvp(99))
    .margin({ top: this.barData.navBarHeight })

  }
}

