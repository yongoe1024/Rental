/**
 * 2个平铺组件
 * @author yongoe
 * @since 2024/8/31
 */
import { rvp } from '../../common/utils/DeviceScreen'
import { TileItem } from '../../viewmodel/HomeModel'

@Component
export struct TileList {
  @Prop tileList: TileItem[]

  build() {
    Row({ space: rvp(16) }) {
      ForEach(this.tileList, (item: TileItem) => {
        Column({ space: rvp(8) }) {
          Image(item.imageURL)
            .width('100%')
            .height(rvp(58))
          Row({ space: rvp(8) }) {
            Text(item.title)
              .fontSize(rvp(12))
              .fontColor($r('app.color.black'))
            Text(item.sub_title)
              .fontSize(10)
              .fontColor($r('app.color.text_gray'))
          }
          .width('100%')
        }
        .width('50%')
      })
    }
    .width('100%')
  }
}

