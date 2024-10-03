/**
 * @author yongoe
 * @since 2024/9/9
 */
import { rvp } from '../../common/utils/DeviceScreen'
import { TagItem } from '../../viewmodel/HomeModel'

@Component
export struct TagList {
  @Prop tagList: TagItem[]

  build() {
    Row({ space: rvp(14) }) {
      ForEach(this.tagList, (item: TagItem) => {
        Text(item.name)
          .fontSize(12)
          .backgroundColor('#F7F7F7')
          .padding({
            top: rvp(4),
            bottom: rvp(4),
            left: rvp(8),
            right: rvp(8)
          })
      })
    }.width('100%').margin({ top: rvp(8) })
  }
}