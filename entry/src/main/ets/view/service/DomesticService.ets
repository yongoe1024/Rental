/**
 * @author yongoe
 * @since 2024/9/5
 */
import { rvp } from '../../common/utils/DeviceScreen'
import { Card } from '../../component/Card'
import { HomeServiceItem } from '../../viewmodel/ServiceModel'

@Component
export struct DomesticService {
  @Prop homeServiceList: HomeServiceItem[]

  build() {
    Column() {
      Card({ cardPadding: rvp(10) }) {
        Row() {
          Text('家庭服务')
            .fontSize(16)
            .fontColor(Color.Black)
            .fontWeight(700)
          Row({ space: rvp(10) }) {
            Text('全部服务')
              .fontSize(12)
              .fontColor(Color.Gray)
            Image($r('app.media.arrow_right'))
              .height(rvp(9))
              .fillColor($r('app.color.gray'))
          }
        }
        .width('100%')
        .justifyContent(FlexAlign.SpaceBetween)

        Grid() {
          ForEach(this.homeServiceList, (item: HomeServiceItem) => {
            GridItem() {
              Column({ space: rvp(9) }) {
                Image(item.icon)
                  .width(rvp(24))
                  .height(rvp(24))
                  .objectFit(ImageFit.Fill)
                Text(item.title)
                  .fontSize(rvp(12))
                  .fontColor(Color.Black)
                  .fontWeight(500)
              }
            }
          })
        }
        .margin({ top: rvp(20), bottom: rvp(10) })
        .width('100%')
        .columnsTemplate('1fr 1fr 1fr 1fr 1fr')
        .rowsGap(rvp(23))
      }
    }
    .width('100%')
  }
}

