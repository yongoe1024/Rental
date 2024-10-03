/**
 * @author yongoe
 * @since 2024/9/8
 */
import { rvp } from '../../common/utils/DeviceScreen'
import { Card } from '../../component/Card'

@Component
export struct PlanList {
  build() {
    Column() {
      Card({ cardPadding: rvp(8) }) {
        Stack() {
          Column() {
            Row() {
              Text('我的家').fontSize(rvp(16)).fontWeight(700)
              Row() {
              }
              .width(rvp(1))
              .height(rvp(12))
              .backgroundColor($r('app.color.gray'))
              .margin({ left: rvp(14), right: rvp(12) })

              Text('感谢你选择谷粒').fontSize(rvp(12)).fontColor($r('app.color.gray'))
            }

            Text('选择谷粒，我们能为你提供').fontSize(rvp(14)).margin({ top: rvp(30) })
            Row() {
              Row({ space: rvp(16) }) {
                Image($r('app.media.my_shenfen')).width(rvp(38))
                Column({ space: rvp(2) }) {
                  Text('代办').fontSize(rvp(14))
                  Text('你还未进行实名认证').fontSize(rvp(12)).fontColor($r('app.color.gray'))
                }.alignItems(HorizontalAlign.Start)
              }

              Image($r('app.media.arrow_right')).width(rvp(8)).fillColor('#AEAEAE')
            }
            .padding(rvp(18))
            .margin({ top: rvp(10) })
            .backgroundColor($r('app.color.bg_gray'))
            .borderRadius(rvp(8))
            .width('100%')
            .justifyContent(FlexAlign.SpaceBetween)

            Column() {
              Row({ space: rvp(10) }) {
                Text('专属谷粒计划').fontSize(rvp(14))
                Text('你在谷粒的每一天都很珍贵').fontSize(rvp(10)).fontColor($r('app.color.gray'))
              }

              Column({ space: rvp(8) }) {
                Text('服务折扣').fontSize(rvp(12))
                Text('每住100天，折扣多一点').fontSize(rvp(10)).fontColor($r('app.color.gray'))
              }.margin({ top: rvp(30) }).alignItems(HorizontalAlign.Start)

              Column({ space: rvp(8) }) {
                Text('免费换租').fontSize(rvp(12))
                Text('城市那么大，你不必讲究').fontSize(rvp(10)).fontColor($r('app.color.gray'))
              }.margin({ top: rvp(16) }).alignItems(HorizontalAlign.Start)
            }
            .width('100%')
            .margin({ top: rvp(10) })
            .alignItems(HorizontalAlign.Start)
            .backgroundColor('#FFF8E4')
            .borderRadius(rvp(8))
            .padding(rvp(16))

            Column() {
              Row({ space: rvp(10) }) {
                Text('专属谷粒计划').fontSize(rvp(14))
                Text('你在谷粒的每一天都很珍贵').fontSize(rvp(10)).fontColor($r('app.color.gray'))
              }

              Column({ space: rvp(8) }) {
                Text('服务折扣').fontSize(rvp(12))
                Text('每住100天，折扣多一点').fontSize(rvp(10)).fontColor($r('app.color.gray'))
              }.margin({ top: 30 }).alignItems(HorizontalAlign.Start)

              Column({ space: rvp(8) }) {
                Text('免费换租').fontSize(rvp(12))
                Text('城市那么大，你不必讲究').fontSize(rvp(10)).fontColor($r('app.color.gray'))
              }.margin({ top: rvp(16) }).alignItems(HorizontalAlign.Start)
            }
            .width('100%')
            .margin({ top: rvp(10) })
            .alignItems(HorizontalAlign.Start)
            .backgroundColor('#DBFFF0')
            .borderRadius(rvp(8))
            .padding(rvp(16))

          }.alignItems(HorizontalAlign.Start)

          Image($r('app.media.my_people'))
            .width(rvp(45))
            .height(rvp(82))
            .objectFit(ImageFit.Fill)
            .margin({ top: rvp(8), right: rvp(18) })
        }.alignContent(Alignment.TopEnd)
      }
    }.margin({ top: rvp(10) })
  }
}