/**
 * @author yongoe
 * @since 2024/9/9
 */
import { rvp } from '../../common/utils/DeviceScreen'

@Component
export struct RentPrice {
  @Prop rentPriceListing: string = ''
  @Prop rentPriceUnit: string = ''

  build() {
    Row() {
      Row({ space: rvp(2) }) {
        Text('￥').fontSize(14).fontWeight(700)
        Text(this.rentPriceListing).fontSize(rvp(26)).fontWeight(700).height(rvp(26))
        Text(this.rentPriceUnit).fontSize(12)
      }.alignItems(VerticalAlign.Bottom)

      Row({ space: rvp(8) }) {
        Text('租金试算').fontSize(14).fontColor($r('app.color.gray'))
        Image($r('app.media.arrow_right')).width(rvp(4)).fillColor($r('app.color.gray'))
      }
    }.justifyContent(FlexAlign.SpaceBetween).width('100%')
  }
}