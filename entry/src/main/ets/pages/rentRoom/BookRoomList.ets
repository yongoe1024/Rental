/**
 * 预约看房列表
 * @author yongoe
 * @since 2024/8/23
 */
import { getBookRentRoomListApi } from '../../api/book'
import { rvp } from '../../common/utils/DeviceScreen'
import { NavBar } from '../../component/NavBar'
import { ScrollContainer } from '../../component/ScrollContainer'
import { BookRoomItem } from '../../viewmodel/BookRoomModel'

@Entry
@Component
struct BookRoomList {
  @State bookList: BookRoomItem[] = []

  aboutToAppear() {
    this.getBookRentRoomList()
  }

  async getBookRentRoomList() {
    this.bookList = await getBookRentRoomListApi()
  }

  build() {
    Column() {
      NavBar({ title: '预约看房' })
      Column() {
        List({ space: rvp(16) }) {
          ForEach(this.bookList, (book: BookRoomItem) => {
            ListItem() {
              Column({ space: rvp(4) }) {
                Text(book.date + '全天 随时可看').fontSize(18).fontColor($r('app.color.gray'))
                Row({ space: rvp(8) }) {
                  Image(book.img).width(rvp(120)).height(rvp(120)).objectFit(ImageFit.Fill).borderRadius(rvp(12))
                  Column() {
                    Column({ space: rvp(8) }) {
                      Text(book.title).maxLines(2).textOverflow({ overflow: TextOverflow.Ellipsis })
                      Text(book.subTitle).fontSize(18).fontColor($r('app.color.gray'))
                      Text(book.distanceInfo).fontSize(18).fontColor($r('app.color.gray'))
                    }.alignItems(HorizontalAlign.Start).width('100%')

                    Row() {
                      Text(book.rentPrice).fontColor('#E03810')
                      Text('去咨询').fontColor($r('app.color.primary')).fontSize(12)
                    }.justifyContent(FlexAlign.SpaceBetween).width('100%')
                  }
                  .width(rvp(200))
                  .height(rvp(120))
                  .padding({ top: rvp(10), bottom: rvp(10) })
                  .justifyContent(FlexAlign.SpaceBetween)
                  .alignItems(HorizontalAlign.Start)
                }
              }.alignItems(HorizontalAlign.Start).width('100%')
            }.width('100%')
          })
        }
        .padding(rvp(8))
        .width('100%')
        .height('100%')
      }
      .width('100%')
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