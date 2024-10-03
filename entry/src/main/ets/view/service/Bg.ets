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
    Stack({ alignContent: Alignment.Bottom }) {
      Image($r('app.media.service_bg'))
        .width('100%')
        .height(this.topRectHeight + 180)
        .objectFit(ImageFit.Fill)
      Image($r('app.media.arrow_down_2'))
        .width(rvp(15))
        .height(rvp(5))
        .objectFit(ImageFit.Fill)
        .margin({ bottom: rvp(10) })
    }
    .width('100%')

  }
}

