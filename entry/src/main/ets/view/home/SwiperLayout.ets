/**
 * 轮播组件
 * @author yongoe
 * @since 2024/8/31
 */
import { rvp } from '../../common/utils/DeviceScreen'
import BannerListDataSource from '../../viewmodel/datasource/BannerListDataSource'
import { BannerItem } from '../../viewmodel/HomeModel'

@Component
export struct SwiperLayout {
  @ObjectLink
  bannerListDataSource: BannerListDataSource
  @StorageProp('topRectHeight')
  topRectHeight: number = 0

  build() {
    Swiper() {
      LazyForEach(this.bannerListDataSource, (item: BannerItem) => {
        Image(item.imageURL)
          .objectFit(ImageFit.Fill)
      }, (item: BannerItem) => item.id + '')
    }
    .width('100%')
    .height(rvp(200) + this.topRectHeight)
    .autoPlay(true)

  }
}

