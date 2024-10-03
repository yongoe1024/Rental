/**
 * @author yongoe
 * @since 2024/9/5
 */
import { rvp } from '../../common/utils/DeviceScreen'
import { Card } from '../../component/Card'
import { CalendarList } from '../../utils/Calendar'
import { ServiceActivityItem } from '../../viewmodel/ServiceModel'

@Component
export struct ServiceCalendar {
  @Prop serviceActivity: ServiceActivityItem
  @State calendarList: string[] = CalendarList

  /**
   * 标题
   */
  @Builder
  title() {
    Row() {
      Text('服务日历')
        .fontSize(16)
        .fontColor(Color.Black)
        .fontWeight(700)
      Row({ space: rvp(10) }) {
        Text('全部服务')
          .fontSize(rvp(12))
          .fontColor(Color.Gray)
        Image($r('app.media.arrow_right'))
          .height(rvp(9))
          .fillColor($r('app.color.gray'))
      }
    }
    .width('100%')
    .padding(rvp(8))
    .justifyContent(FlexAlign.SpaceBetween)
  }

  /**
   * 日期
   */
  @Builder
  monthList() {
    Row() {
      ForEach(this.calendarList, (item: string, index: number) => {
        Text() {
          Span(item)
            .fontSize(16)
            .fontColor(Color.Black)
            .fontWeight(700)
          Span('月').fontSize(12).fontColor($r('app.color.gray_second'))
        }
        .padding(rvp(6))
        .borderRadius(rvp(4))
        .backgroundColor(index == 2 ? '#CDFFD9' : '')
      })
    }.justifyContent(FlexAlign.SpaceBetween)
    .width('100%')
    .padding(rvp(8))
  }

  /**
   * 内容
   */
  @Builder
  content() {
    Column({ space: rvp(8) }) {
      Text(this.serviceActivity.name)
        .fontSize(14)
        .fontWeight(700)
      Row({ space: rvp(8) }) {
        Image(this.serviceActivity.img)
          .width(rvp(100))
          .height(rvp(100))
          .borderRadius(rvp(4))
        Column({ space: rvp(8) }) {
          Text(this.serviceActivity.title)
            .fontSize(14)
            .fontWeight(500)
          Text(this.serviceActivity.subTitle)
            .fontSize(12)
            .fontWeight(500)
        }
        .alignSelf(ItemAlign.Start)
        .alignItems(HorizontalAlign.Start)
      }

      Text('立即参与')
        .borderRadius(rvp(8))
        .fontSize(12)
        .fontWeight(500)
        .padding({
          left: rvp(11),
          right: rvp(11),
          top: rvp(5),
          bottom: rvp(5)
        })
        .backgroundColor('#CDFFD9')
        .position({ right: rvp(16), bottom: rvp(8) })
    }
    .width('100%')
    .padding({ left: rvp(8), top: rvp(8), bottom: rvp(8) })
    .height(rvp(140))
    .alignItems(HorizontalAlign.Start)
    .linearGradient({
      angle: 205,
      colors: [
        ['#ddffdb', 0],
        ['#ffffff', 0.3]
      ]
    })
  }

  build() {
    Column() {
      Card({ cardPadding: 0 }) {
        this.title()

        this.monthList()

        this.content()
      }
    }
    .width('100%')
  }
}

