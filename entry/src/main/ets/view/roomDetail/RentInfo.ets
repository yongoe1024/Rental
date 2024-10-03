/**
 * @author yongoe
 * @since 2024/9/9
 */
import { rvp } from '../../common/utils/DeviceScreen'
import { RentInfoItem } from '../../viewmodel/RoomDetailModel'

@Component
export struct RentInfo {
  @Prop rentInfoList: RentInfoItem[]

  build() {
    Column({ space: rvp(8) }) {
      Text('租客信息').fontSize(18).fontWeight(700)
      ForEach(this.rentInfoList, (rentInfo: RentInfoItem) => {
        Row({ space: rvp(8) }) {
          Image(rentInfo.image).width(rvp(34))
          Text(rentInfo.title).fontSize(12)
          Blank()
          Text(rentInfo.userTag).fontColor($r('app.color.gray')).fontSize(12)
        }
        .backgroundColor('#FAF8FB')
        .padding({
          top: rvp(4),
          bottom: rvp(4),
          left: rvp(8),
          right: rvp(8)
        })
        .width('100%')
        .height(rvp(42))
        .margin({ top: rvp(8) })
      })
      Text('*已出租房屋为您展示房屋签约人信息').fontColor($r('app.color.gray')).fontSize(16)
    }.alignItems(HorizontalAlign.Start).margin({ top: rvp(20) })
  }
}