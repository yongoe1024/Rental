/**
 * @author yongoe
 * @since 2024/9/1
 */
import { rvp } from '../../common/utils/DeviceScreen'

@Component
export struct Ad {
  @Prop adPicture: string

  build() {
    Row() {
      Image(this.adPicture)
        .width('100%')
        .height(rvp(60))
        .objectFit(ImageFit.Fill)
        .shadow({
          radius: rvp(8),
          color: $r('app.color.gray')
        })

    }
    .width('100%')
  }
}

