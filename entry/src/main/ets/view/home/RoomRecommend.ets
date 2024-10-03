/**
 * 房源推荐组件
 * @author yongoe
 * @since 2024/9/1
 */
import { getRoomRecommendApi } from '../../api/home'
import RoomRecommendDataSource from '../../viewmodel/datasource/RoomRecommendDataSource'
import { RoomRecommendItem, TagItem } from '../../viewmodel/HomeModel'
import { router } from '@kit.ArkUI'
import { rvp } from '../../common/utils/DeviceScreen'

@Component
export struct RoomRecommend {
  @State roomRecommendDataSource: RoomRecommendDataSource = new RoomRecommendDataSource()

  aboutToAppear(): void {
    getRoomRecommendApi().then((data) => {
      this.roomRecommendDataSource.setList(data)
    })
  }

  // 头部导航
  @Builder
  RoomNav() {
    Row() {
      Text() {
        Span('周边房源')
          .fontWeight(700)
        Span('推荐')
          .fontColor($r('app.color.primary'))
      }.fontSize(rvp(18))

      Row({ space: 6 }) {
        Text('更多推荐').fontColor($r('app.color.gray_second'))
          .fontSize(rvp(12))
        Image($r('app.media.arrow_right'))
          .width(rvp(4))
          .height(rvp(8))
      }
      .onClick(() => {
        router.pushUrl({
          url: 'pages/rentRoom/RoomList'
        })
      })
    }
    .width('100%')
    .height(rvp(50))
    .justifyContent(FlexAlign.SpaceBetween)
  }

  /**
   * 底部房间详情
   * @param item
   */
  @Builder
  roomInfo(item: RoomRecommendItem) {
    Column() {
      Row() {
        Text() {
          Span(item.rentPriceListing)
            .fontSize(rvp(16))
            .fontColor('#E03810')
          Span(item.rentPriceUnit)
            .fontSize(rvp(14))
            .fontColor('#E03810')
        }
        .height(rvp(22))

        Text(item.rentArea + '㎡')
          .fontSize(rvp(12))
          .fontColor($r('app.color.gray'))
      }
      .width('100%')
      .justifyContent(FlexAlign.SpaceBetween)

      Text(item.houseTitle)
        .fontSize(rvp(14))
        .margin({ top: rvp(2) })
        .height(rvp(19))
        .maxLines(1)
        .textOverflow({ overflow: TextOverflow.Ellipsis })
      Row({ space: rvp(6) }) {
        ForEach(item.tags.slice(0, 2), (tag: TagItem, index) => {
          Text(tag.name)
            .padding({
              top: rvp(1),
              bottom: rvp(1),
              left: rvp(4),
              right: rvp(4)
            })
            .fontColor(index === 0 ? $r('app.color.white') : $r('app.color.text_gray'))
            .backgroundColor(index === 0 ? $r('app.color.primary') : $r('app.color.bg_gray'))
            .fontSize(rvp(12))
        })
      }
      .width('100%')
      .margin({ top: rvp(9) })
    }
    .padding(rvp(12))
    .alignItems(HorizontalAlign.Start)
    .height(rvp(91))
  }

  @Builder
  address(room: RoomRecommendItem) {
    Image($r('app.media.room_text_bg'))
      .width('100%')
      .height(rvp(120))
    Row({ space: rvp(6) }) {
      Image($r('app.media.location'))
        .width(rvp(12))
        .height(rvp(14))
      Text(room.address)
        .fontSize(rvp(12))
        .fontColor($r('app.color.white'))
    }
    .margin({ left: rvp(8), top: rvp(99) })
  }

  @Builder
  roomItem(room: RoomRecommendItem) {
    Stack() {
      Column() {
        Image(room.housePicture)
          .width('100%')
          .height(rvp(120))
          .objectFit(ImageFit.Fill)
        this.roomInfo(room)
      }
      .width('100%')
      .height('100%')
      .borderRadius(rvp(8))
      .clip(true)
      .borderWidth(1)
      .borderColor('#e1e1e1')

      this.address(room)

    }
    .width('100%')
    .height('100%')
    .alignContent(Alignment.TopStart)
  }

  // 房源列表
  @Builder
  RoomList() {
    if (this.roomRecommendDataSource.roomRecommendList.length) {
      Grid() {
        LazyForEach(this.roomRecommendDataSource, (room: RoomRecommendItem) => {
          GridItem() {
            this.roomItem(room)
          }
          .width('100%')
          .height(rvp(210))
        }, (room: RoomRecommendItem) => room.id)
      }
      .columnsTemplate('1fr 1fr')
      .columnsGap(rvp(8))
      .rowsGap(rvp(8))
      .width('100%')
    }
  }

  build() {
    Column() {
      this.RoomNav()
      this.RoomList()
    }.width('100%')
  }
}

