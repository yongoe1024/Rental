/**
 * 导航网格组件
 * @author yongoe
 * @since 2024/8/31
 */
import { rvp } from '../../common/utils/DeviceScreen'
import { NavItem } from '../../viewmodel/HomeModel'

@Component
export struct NavList {
  @Prop navList: NavItem[]

  build() {
    Grid() {
      ForEach(this.navList, (nav: NavItem) => {
        GridItem() {
          Column({ space: rvp(8) }) {
            Image(nav.imageURL)
              .width(rvp(60))
              .height(rvp(60))
              .objectFit(ImageFit.Fill)
              .borderRadius(rvp(8))
            Text(nav.title)
              .fontSize(rvp(12))
              .fontColor($r('app.color.black'))
              .fontWeight(500)
          }
        }
      })
    }
    .width('100%')
    .columnsTemplate('1fr 1fr 1fr 1fr')
    .rowsGap(rvp(8))
  }
}

