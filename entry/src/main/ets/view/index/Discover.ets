/**
 * 发现
 * @author yongoe
 * @since 2024/8/23
 */
import { getDiscoverDataApi } from '../../api/discover'
import { rvp } from '../../common/utils/DeviceScreen'
import { BarData, ScrollContainer } from '../../component/ScrollContainer'
import { BenefitsItem, DanMuItem, PostZone } from '../../viewmodel/DiscoverModel'
import Ad from '../discover/Ad'
import { BannerScroll } from '../discover/BannerScroll'
import Bg from '../discover/Bg'
import NavBar from '../discover/NavBar'
import Welfare from '../discover/Welfare'

@Component
export struct Discover {
  @State barData: BarData = new BarData()
  @State danMuList1: DanMuItem[] = []
  @State danMuList2: DanMuItem[] = []
  @State benefits: BenefitsItem[] = []
  @State postZone: PostZone = {
    "mainPost": {
      "followerNum": 0,
      "title": '',
      "userAvatar": '',
      "userName": '',
      "postContent": '',
    },
    "contentBlockList": []
  }

  async getDiscoverData() {
    const discoverData = await getDiscoverDataApi()
    this.danMuList1 = discoverData.danMuList1
    this.danMuList2 = discoverData.danMuList2
    this.postZone = discoverData.postZone
    this.benefits = discoverData.benefits
  }

  aboutToAppear(): void {
    this.getDiscoverData()
  }

  @Builder
  navBuilder() {
    NavBar({ barData: this.barData })
  }

  @Builder
  contentBuilder() {
    Stack() {
      Bg()
      Column() {
        Text('与100万用户发现生活').margin({ left: rvp(16) }).fontSize(14).fontWeight(500)
        Column({ space: rvp(16) }) {
          BannerScroll({ bannerList: this.danMuList1 })
          BannerScroll({ bannerList: this.danMuList2 })
        }.width('100%').margin({ top: rvp(20) })

        Ad({ postZone: this.postZone })
        Welfare({ benefits: this.benefits })
      }
      .alignItems(HorizontalAlign.Start)
      .padding({ top: this.barData.navBarHeight })
    }.alignContent(Alignment.TopStart)
  }

  build() {
    Column() {
      ScrollContainer({
        barData: this.barData,
        barColorStart: '#000000',
        barColorEnd: '#000000',
        content: () => {
          this.contentBuilder()
        },
        navBar: () => {
          this.navBuilder()
        }
      })
    }

  }
}

