/**
 * @author yongoe
 * @since 2024/9/9
 */
import { rvp } from '../../common/utils/DeviceScreen'
import { RentTermItem } from '../../viewmodel/RoomDetailModel'

@Component
export struct RentTerm {
  @Prop rentTerm: RentTermItem

  build() {
    Column({ space: rvp(16) }) {
      Row({ space: rvp(16) }) {
        Text('入住').grayText(14)
        Text(this.rentTerm.term)
      }

      Row({ space: rvp(16) }) {
        Text('租期').grayText(14)
        Text(this.rentTerm.checkInTime)
      }

      Row() {
        Row({ space: rvp(16) }) {
          Text('厨房').grayText(14)
          Text(this.rentTerm.kitchen)
        }.width('50%')

        Row({ space: rvp(16) }) {
          Text('电梯').grayText(14)
          Text(this.rentTerm.lift)
        }.width('50%')
      }.width('100%')

      Row() {
        Row({ space: rvp(16) }) {
          Text('年代').grayText(14)
          Text(this.rentTerm.year).fontSize(14)
        }.width('50%')

        Row({ space: rvp(16) }) {
          Text('装修').grayText(14)
          Text(this.rentTerm.renovation).fontSize(14)
        }.width('50%')
      }.width('100%')

      Row() {
        Row({ space: rvp(16) }) {
          Text('上架').grayText(14)
          Text(this.rentTerm.grounding).fontSize(14)
        }.width('50%')

        Row({ space: rvp(16) }) {
          Text('供暖').grayText(14)
          Text(this.rentTerm.heating).fontSize(14)
        }.width('50%')
      }.width('100%')

      Row({ space: rvp(16) }) {
        Text('绿化').grayText(14)
        Text(this.rentTerm.green).fontSize(14)
      }

      Row({ space: rvp(16) }) {
        Text('环保').grayText(14)
        Text(this.rentTerm.protection).fontSize(14)
        Row({ space: rvp(5) }) {
          Text('查看报告').grayText(12)
          Image($r('app.media.arrow_right')).width(rvp(4)).fillColor($r('app.color.gray'))
        }
      }

      Row({ space: 16 }) {
        Text('小区').grayText(14)
        Row() {
          Text(this.rentTerm.house).fontSize(14).fontColor('#FF4141')
          Image($r('app.media.arrow_right')).width(rvp(4)).fillColor('#FF4141').margin({ left: rvp(5) })
        }
      }

      Row() {
        Text('*部分房源信息详见底部详解').grayText(10)
        Blank()
        Text('房屋状况说明书').grayText(10)
        Image($r('app.media.arrow_right')).width(rvp(4)).fillColor($r('app.color.gray')).margin({ left: rvp(5) })
      }.width('100%')
    }.alignItems(HorizontalAlign.Start).width('100%').margin({ top: rvp(16) })
  }
}


@Extend(Text)
function grayText(size: number) {
  .fontColor($r('app.color.gray')).fontSize(rvp(size))
}