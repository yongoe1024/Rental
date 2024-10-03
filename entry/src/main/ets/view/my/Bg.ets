/**
 * @author yongoe
 * @since 2024/9/4
 */
import { rvp } from '../../common/utils/DeviceScreen'

@Component
export struct Bg {
  @StorageProp('topRectHeight')
  topRectHeight: number = 0

  build() {
    Column()
      .width('100%')
      .height(rvp(175) + this.topRectHeight)
      .linearGradient({
        angle: 180,
        colors: [
          ['#6DC782', 0],
          ['#8FE1A2', 0.43],
          ['#8FE1A2', 1],
        ]
      })
  }
}