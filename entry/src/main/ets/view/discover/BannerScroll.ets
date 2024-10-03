/**
 * @author yongoe
 * @since 2024/9/8
 */
import { rvp } from '../../common/utils/DeviceScreen';
import { DanMuItem } from '../../viewmodel/DiscoverModel';

@Component
export struct BannerScroll {
  @Prop bannerList: DanMuItem[];

  build() {
    List() {
      ForEach(this.bannerList, (banner: DanMuItem) => {
        ListItem() {
          Row({ space: rvp(6) }) {
            Image(banner.avatar).width(rvp(24)).height(rvp(24)).objectFit(ImageFit.Fill).borderRadius(rvp(24))
            Text(banner.content).fontSize(14).fontWeight(500)
          }
          .padding({
            top: rvp(6),
            left: rvp(6),
            bottom: rvp(6),
            right: rvp(10)
          })
          .borderRadius(rvp(42))
          .backgroundColor('#CDFFD9')
          .margin({ left: rvp(10) })
        }
      }, (banner: DanMuItem, index) => JSON.stringify(banner) + index)
    }
    .listDirection(Axis.Horizontal) // 排列方向
    .edgeEffect(EdgeEffect.None) // 滑动到边缘无效果
    .width('100%')
    .scrollBar(BarState.Off)
  }
}