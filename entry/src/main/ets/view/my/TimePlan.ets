/**
 * @author yongoe
 * @since 2024/9/8
 */
import { rvp } from '../../common/utils/DeviceScreen'

@Component
export struct TimePlan {
  build() {
    Column({ space: rvp(11) }) {
      Row() {
        Text('小谷粒时光计划').fontColor('#2C5B37').fontSize(rvp(16)).fontWeight(700)
        Image($r('app.media.arrow_right')).width(rvp(6)).height(rvp(12)).fillColor('#FF2C5B37').objectFit(ImageFit.Fill)
      }.width('100%').justifyContent(FlexAlign.SpaceBetween)

      Text('签约后可解锁会员权益').fontColor('#2C5B37').fontSize(rvp(12))
    }
    .width('100%')
    .height(rvp(80))
    .margin({ top: rvp(15) })
    .borderRadius(rvp(8))
    .padding({
      left: rvp(22),
      right: rvp(22),
      top: rvp(18),
      bottom: rvp(18)
    })
    .alignItems(HorizontalAlign.Start)
    .linearGradient({
      angle: 116,
      colors: [
        ['#FFF1CD', 0],
        ['#FFEBB5', 1],
      ]
    })
  }
}