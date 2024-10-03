/**
 * 我的
 * @author yongoe
 * @since 2024/8/23
 */
import { rvp } from '../../common/utils/DeviceScreen'
import { BarData, ScrollContainer } from '../../component/ScrollContainer'
import { Bg } from '../my/Bg'
import { NavBar } from '../my/NavBar'
import { Order } from '../my/Order'
import { PlanList } from '../my/PlanList'
import { TimePlan } from '../my/TimePlan'
import { UserInfo } from '../my/UserInfo'

@Preview
@Component
export struct My {
  @State barData: BarData = new BarData()
  token: string = ''

  @Builder
  navBar() {
    NavBar({ barData: this.barData })
  }

  @Builder
  content() {
    Stack({ alignContent: Alignment.TopStart }) {
      Bg()
      Column() {
        UserInfo()
        TimePlan()
        Order()
        PlanList()
      }
      .padding({ left: rvp(8), right: rvp(8), top: this.barData.navBarHeight })
    }
    .width('100%').align(Alignment.TopStart)
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

