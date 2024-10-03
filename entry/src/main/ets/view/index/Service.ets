/**
 * 服务
 * @author yongoe
 * @since 2024/8/23
 */
import { getServiceDataApi } from '../../api/service'
import { BarData, ScrollContainer } from '../../component/ScrollContainer'
import {
  CleaningServiceInfoItem,
  HomeServiceItem,
  NewcomerZoneItem,
  ServiceActivityItem,
  VipServiceItem
} from '../../viewmodel/ServiceModel'
import { Bg } from '../service/Bg'
import { DomesticService } from '../service/DomesticService'
import { NavBar } from '../service/NavBar'
import { ServiceCalendar } from '../service/ServiceCalendar'
import { ServiceClean } from '../service/ServiceClean'
import { VIP } from '../service/VIP'

@Component
export struct Service {
  @State barData: BarData = new BarData()
  @State cleaningServiceInfo: CleaningServiceInfoItem[] = []
  @State homeServiceList: HomeServiceItem[] = []
  @State newcomerZone: NewcomerZoneItem = { img: '' }
  @State serviceActivity: ServiceActivityItem = {} as ServiceActivityItem
  @State vipServiceList: VipServiceItem[] = []

  aboutToAppear(): void {
    getServiceDataApi()
      .then((data) => {
        this.cleaningServiceInfo = data.cleaningServiceInfo
        this.homeServiceList = data.homeServiceList
        this.newcomerZone = data.newcomerZone
        this.serviceActivity = data.serviceActivity
        this.vipServiceList = data.vipServiceList
      })
  }

  @Builder
  navBar() {
    NavBar({ barData: this.barData })
  }

  @Builder
  content() {
    Column() {
      Stack({ alignContent: Alignment.Top }) {
        Bg()
        VIP({ vipServiceList: this.vipServiceList, barData: this.barData })
      }
      .width('100%')

      Column({ space: 8 }) {
        DomesticService({ homeServiceList: this.homeServiceList })
        ServiceCalendar({ serviceActivity: this.serviceActivity })
        ServiceClean({ newcomerZone: this.newcomerZone, cleaningServiceInfo: this.cleaningServiceInfo })
      }
      .padding({
        left: 16,
        right: 16,
        top: 8,
        bottom: 16
      })
    }
    .backgroundColor($r('app.color.bg_gray'))
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

