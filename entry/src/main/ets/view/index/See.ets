/**
 * 想看
 * @author yongoe
 * @since 2024/8/23
 */
import { BarData, ScrollContainer } from '../../component/ScrollContainer'
import { FindRoom } from '../see/FindRoom'
import { NavBar } from '../see/NavBar'

@Preview
@Component
export struct See {
  @State barData: BarData = new BarData()

  @Builder
  navBar() {
    NavBar({ barData: this.barData })
  }

  @Builder
  content() {
    Column() {
      FindRoom()
    }
    .padding({ top: this.barData.navBarHeight })
    .linearGradient({
      angle: 180,
      direction: GradientDirection.Top,
      colors: [
        ['#DEFBE5', 0],
        ['#ffffff', 0.3],
        ['#ffffff', 1],
      ],
      repeating: false,
    })
  }

  build() {
    ScrollContainer({
      barData: this.barData,
      barColorStart: '#000000',
      barColorEnd: '#000000',
      navBar: () => {
        this.navBar()
      },
      content: () => {
        this.content()
      }
    })
  }
}

