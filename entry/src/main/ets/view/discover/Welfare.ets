/**
 * @author yongoe
 * @since 2024/9/8
 */
import { rvp } from '../../common/utils/DeviceScreen'
import { Card } from '../../component/Card'
import { BenefitsItem } from '../../viewmodel/DiscoverModel'

@Component
export default struct Welfare {
  @Prop benefits: BenefitsItem[]

  build() {
    Column({ space: rvp(10) }) {
      ForEach(this.benefits, (item: BenefitsItem) => {
        Card({ cardPadding: rvp(12) }) {
          Text("小谷粒福利")
            .width(rvp(80))
            .height(rvp(24))
            .borderRadius(rvp(23))
            .backgroundColor('#CDFFD9')
            .fontSize(rvp(12))
            .fontColor('#1F632F')
            .textAlign(TextAlign.Center)
          Text(item.title)
            .fontSize(26)
            .fontColor('#FF000000')
            .fontWeight(700)
            .margin({ top: rvp(18), left: rvp(4) })
          Image(item.img)
            .width('100%')
            .height(rvp(143))
            .objectFit(ImageFit.Fill)
            .margin({ top: rvp(9), left: rvp(4), bottom: rvp(6) })
        }
      })
    }.margin({ top: rvp(10) })
  }
}