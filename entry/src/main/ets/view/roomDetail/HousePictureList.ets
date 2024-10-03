/**
 * @author yongoe
 * @since 2024/9/8
 */
import { rvp } from '../../common/utils/DeviceScreen'
import { HousePictureItem } from '../../viewmodel/RoomDetailModel'

@Component
export struct HousePictureList {
  @State index: number = 0
  @Prop housePictureList: HousePictureItem[]
  titleScroller: Scroller = new Scroller()
  imageScroller: Scroller = new Scroller()

  build() {
    Column({ space: rvp(16) }) {
      List({ initialIndex: this.index, space: rvp(16), scroller: this.titleScroller }) {
        ListItem().width(1)
        ForEach(this.housePictureList, (item: HousePictureItem, index: number) => {
          ListItem() {
            Text(item.spaceName + `(${item.picList.length})`)
              .fontSize(14)
              .fontWeight(500)
              .fontColor(this.index == index ? '#262626' : '#666666')
          }
          .onClick(() => {
            this.index = index
            this.imageScroller.scrollToIndex(index)
          })
        })
        ListItem().width(1)
      }
      .width('100%')
      .height(rvp(20))
      .listDirection(Axis.Horizontal)
      .scrollBar(BarState.Off)

      List({ scroller: this.imageScroller }) {
        ListItem().width(rvp(16))
        ForEach(this.housePictureList, (item: HousePictureItem, index: number) => {
          ListItemGroup({}) {
            ForEach(item.picList, (pic: string, indexPic: number) => {
              ListItem() {
                Image(pic)
                  .width(rvp(318))
                  .height('100%')
                  .objectFit(ImageFit.Fill)
              }
              .margin({ right: rvp(10) })
            })
          }
        })
        ListItem().width(16)
      }
      .width('100%')
      .height(rvp(200))
      .listDirection(Axis.Horizontal)
      .scrollBar(BarState.Off)
      .friction(2)
      .onScrollIndex((index: number) => {
        this.index = index
        this.titleScroller.scrollToIndex(index)
      })
    }
    .width('100%')

  }
}

