/**
 * 计划组件
 * @author yongoe
 * @since 2024/8/31
 */
import { rvp } from '../../common/utils/DeviceScreen'
import { PlanItem } from '../../viewmodel/HomeModel'

@Component
export struct PlanList {
  @Prop planList: PlanItem[]

  build() {
    Grid() {
      ForEach(this.planList, (item: PlanItem) => {
        GridItem() {
          Image(item.imageURL)
            .objectFit(ImageFit.Fill)
        }
      })
    }
    .width('100%')
    .height(rvp(60))
    .rowsTemplate('1fr')
    .columnsTemplate('1fr 1fr 1fr 1fr')
    .columnsGap(rvp(8))
  }
}

