/**
 * 首页
 * @author yongoe
 * @since 2024/8/23
 */
import { getHomeDataApi } from '../../api/home'
import { rvp } from '../../common/utils/DeviceScreen'
import { BarData, ScrollContainer } from '../../component/ScrollContainer'
import BannerListDataSource from '../../viewmodel/datasource/BannerListDataSource'
import { NavItem, PlanItem, TileItem } from '../../viewmodel/HomeModel'
import { Ad } from '../home/Ad'
import { NavList } from '../home/NavList'
import { PlanList } from '../home/PlanList'
import { RoomRecommend } from '../home/RoomRecommend'
import { SearchBar } from '../home/SearchBar'
import { SwiperLayout } from '../home/SwiperLayout'
import { TileList } from '../home/TileList'

@Preview
@Component
export struct Home {
  @State barData: BarData = new BarData()
  @State bannerListDataSource: BannerListDataSource = new BannerListDataSource()
  @State adPicture: string = ''
  @State navList: NavItem[] = []
  @State planList: PlanItem[] = []
  @State tileList: TileItem[] = []

  aboutToAppear(): void {
    getHomeDataApi()
      .then((data) => {
        this.bannerListDataSource.setList(data.bannerList)
        this.adPicture = data.adPicture
        this.navList = data.navList
        this.planList = data.planList
        this.tileList = data.tileList
      })

  }

  @Builder
  navBar() {
    SearchBar({ barData: this.barData })
  }

  @Builder
  content() {
    Column() {
      SwiperLayout({ bannerListDataSource: this.bannerListDataSource })
      Column({ space: rvp(8) }) {
        NavList({ navList: this.navList })
        TileList({ tileList: this.tileList })
        PlanList({ planList: this.planList })
        Ad({ adPicture: this.adPicture })
        RoomRecommend()
      }.padding(rvp(16))
    }
  }

  build() {
    ScrollContainer({
      barData: this.barData,
      navBar: () => {
        this.navBar()
      },
      content: () => {
        this.content()
      }
    })

  }
}


