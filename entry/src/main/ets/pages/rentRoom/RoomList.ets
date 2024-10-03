/**
 * 房源推荐页面
 * @author yongoe
 * @since 2024/8/23
 */
import { NavBar } from '../../component/NavBar'
import { ListContent } from '../../view/roomList/ListContent'
import { SearchFilter } from '../../view/roomList/SearchFilter'
import { SearchParams } from '../../viewmodel/RoomListModel'

@Entry
@Component
struct RoomList {
  @Provide searchParams: SearchParams = {
    page: 1,
    limit: 10
  }

  build() {
    Column() {
      NavBar({ title: '房源列表' })
      Stack({ alignContent: Alignment.TopStart }) {
        ListContent()
        // 放后面可以覆盖
        SearchFilter()
      }
      .layoutWeight(1)
    }
    .height('100%')
    .width('100%')
    .linearGradient({
      colors: [
        ['#ddffdb', 0],
        ['#ffffff', 0.1]
      ]
    })
  }
}