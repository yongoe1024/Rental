/**
 * @author yongoe
 * @since 2024/9/9
 */
import { rvp } from '../../common/utils/DeviceScreen'
import { Discount } from '../../viewmodel/RoomDetailModel'

@Component
export struct DiscountsList {
  @Prop discountsList: Discount[]

  build() {
    Column({ space: rvp(16) }) {
      ForEach(this.discountsList, (item: Discount) => {
        Row({ space: 8 }) {
          Image(item.image).height(rvp(20))
          Text(item.txt).fontSize(12).fontColor($r('app.color.gray'))
          Blank()
          Image($r('app.media.arrow_right')).width(rvp(4)).fillColor($r('app.color.primary'))
        }.width('100%')
      })
    }.margin({ top: rvp(13) })
  }
}