/**
 * 房源推荐内容瀑布流
 * @author yongoe
 * @since 2024/9/6
 */
import { getRoomListApi } from '../../api/room'
import { rvp } from '../../common/utils/DeviceScreen'
import { Empty } from '../../component/Empty'
import RoomListDataSource from '../../viewmodel/datasource/RoomListDataSource'
import { TagItem } from '../../viewmodel/HomeModel'
import { RoomItem, SearchParams } from '../../viewmodel/RoomListModel'
import { router } from '@kit.ArkUI'

@Component
export struct ListContent {
  @State total: number = -1
  @State currentTotal: number = 0 // 因为DataSource的长度不是响应式
  @State roomListDataSource: RoomListDataSource = new RoomListDataSource()
  @State waterFlowHeight: number = 780 - 44 - 44
  @Consume @Watch('loading') searchParams: SearchParams
  loadState: boolean = false

  aboutToAppear(): void {
    this.loading()
  }

  /**
   * 查询参数改变，加载数据
   */
  async loading() {
    if (this.loadState) {
      return
    }
    this.loadState = true
    const data = await getRoomListApi(this.searchParams)
    if (this.searchParams.page === 1) {
      this.roomListDataSource.setList(data.records)
      this.currentTotal = data.records.length
    } else {
      this.roomListDataSource.pushList(data.records)
      this.currentTotal += data.records.length
    }
    this.total = Number(data.total)
    this.searchParams.page++
    this.loadState = false
  }

  /**
   * 页面底部
   */
  @Builder
  footer() {
    Row() {
      if (this.total !== this.currentTotal) {
        Refresh({ refreshing: true })
      }
      Text(this.total === this.currentTotal ? '已经到底了' : '加载数据中')
        .fontSize(12)
        .fontColor(Color.Gray)
    }
    .width('100%')
    .margin({ top: rvp(8) })
    .justifyContent(FlexAlign.Center)
  }

  /**
   * 活动房间上方内容
   */
  @Builder
  activity(item: RoomItem) {
    if (item.activity) {
      Column({ space: rvp(4) }) {
        Row({ space: rvp(4) }) {
          Image(item.activity.icon)
            .width(rvp(26))
            .height(rvp(26))
            .objectFit(ImageFit.Fill)
          Text(item.activity.title)
            .fontSize(14)
            .fontWeight(700)
        }

        Text(item.activity.title)
          .fontSize(10)
          .fontWeight(700)
          .fontColor(item.activity.textColor)
          .backgroundColor(item.activity.textBackGroundColor)
          .borderRadius(rvp(21))
          .padding({
            left: rvp(8),
            right: rvp(8),
            top: rvp(4),
            bottom: rvp(4)
          })
      }
      .width('100%')
      .height(rvp(70))
      .alignItems(HorizontalAlign.Start)
      .padding({ top: rvp(15) })
    }
  }

  /**
   * 图片底部房间详情
   */
  @Builder
  roomInfo(item: RoomItem) {
    Column() {
      Row() {
        Text() {
          Span(item.rentPriceListing)
            .fontSize(16)
            .fontColor('#E03810')
          Span(item.rentPriceUnit)
            .fontSize(14)
            .fontColor('#E03810')
        }
        .height(rvp(22))

        Text(item.rentArea + '㎡')
          .fontSize(12)
          .fontColor($r('app.color.gray'))
      }
      .width('100%')
      .justifyContent(FlexAlign.SpaceBetween)

      Text(item.houseTitle)
        .fontSize(14)
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
            .fontColor(index === 0 ? $r('app.color.white') : '#B3B3B3')
            .backgroundColor(index === 0 ? $r('app.color.primary') : $r('app.color.bg_gray'))
            .fontSize(12)
        })
      }
      .width('100%')
      .margin({ top: 9 })
    }
    .padding(rvp(12))
    .alignItems(HorizontalAlign.Start)
    .height(rvp(91))
  }

  /**
   * 房间组件
   */
  @Builder
  roomItem(item: RoomItem) {
    Column() {
      this.activity(item)
      Stack() {
        Column() {
          Image(item.housePicture)
            .width('100%')
            .height(item.activity ? rvp(160) : rvp(120))
            .objectFit(ImageFit.Fill)
            .borderRadius({ topLeft: rvp(8), topRight: rvp(8) })
          this.roomInfo(item)
        }
        .width('100%')
        .height('100%')
        .borderRadius(rvp(8))
        .borderWidth(1)
        .borderColor('#e1e1e1')

        if (!item.activity) {
          Image($r('app.media.room_text_bg'))
            .width('100%')
            .height(rvp(120))
          Row({ space: 6 }) {
            Image($r('app.media.location'))
              .width(rvp(12))
              .height(rvp(14))
            Text(item.address)
              .fontSize(12)
              .fontColor(Color.White)
          }
          .margin({ left: rvp(8), top: rvp(99) })
        }

      }
      .width('100%')
      .layoutWeight(1)
      .alignContent(Alignment.TopStart)
    }
  }

  build() {
    Column() {
      if (this.total == 0) {
        Column() {
          Empty({
            title: '抱歉，没有搜索到你想要的房子。',
            image: $r('app.media.blank')
          })
        }
        .margin({ top: rvp(128) })
      } else {
        WaterFlow({ footer: this.footer() }) {
          LazyForEach(this.roomListDataSource, (item: RoomItem) => {
            FlowItem() {
              this.roomItem(item)
            }
            .width('100%')
            .height(item.activity ? rvp(320) : rvp(210))
            .onClick(() => {
              const params: Record<string, string> = { 'id': item.id }
              router.pushUrl({
                url: 'pages/rentRoom/RoomDetail',
                params: params
              })
            })
          }, (item: RoomItem, index: number) => item.id)
        }
        .width('100%')
        .height('100%')
        .columnsTemplate('1fr 1fr')
        .columnsGap(rvp(8))
        .rowsGap(rvp(8))
        .padding({
          left: rvp(16),
          right: rvp(16),
          top: rvp(8),
        })
        .onReachEnd(() => {
          this.loading()
        })
      }
    }
    .width('100%')
    .height(this.waterFlowHeight)
    .margin({ top: rvp(44) })
    .onSizeChange((oldValue: SizeOptions, newValue: SizeOptions) => {
      this.waterFlowHeight = Number(newValue.height)
    })
  }
}

