/**
 * 顶部搜索组件
 * @author yongoe
 * @since 2024/8/31
 */
import { BarData } from '../../component/ScrollContainer';
import { router } from '@kit.ArkUI';
import { rvp } from '../../common/utils/DeviceScreen';

@Component
export struct SearchBar {
  @StorageProp('topRectHeight')
  topRectHeight: number = 0
  @Prop barData: BarData

  build() {
    Row({ space: rvp(16) }) {
      Text('北京')
        .fontSize(14)
        .fontColor(this.barData.fontColor)
      Stack() {
        TextInput()
          .placeholderFont({ size: 12 })
          .width('100%')
          .height(rvp(30))
          .backgroundColor(Color.White)
          .borderColor($r('app.color.gray'))
          .borderWidth(1)
        Row() {
          Image($r('app.media.search'))
            .width(rvp(18))
            .height(rvp(18))
          Text('公园/地铁')
            .fontSize(10)
            .fontColor($r('app.color.text_gray'))
            .layoutWeight(1)
          Column()
            .width(1)
            .height(rvp(18))
            .backgroundColor('#ffababab')
            .margin({ left: rvp(10), right: rvp(10) })
          Image($r('app.media.position'))
            .width(rvp(18))
            .height(rvp(18))
        }
        .width('100%')
        .padding({ left: rvp(16), right: rvp(16) })
      }
      .layoutWeight(1)
      .onClick(() => {
        router.pushUrl({
          url: 'pages/rentRoom/RoomList'
        })
      })

      Image($r('app.media.message'))
        .width(rvp(24))
        .height(rvp(24))
        .fillColor(this.barData.fontColor)
    }
    .width('100%')
    .backgroundColor(this.barData.bgColor)
    .padding({
      left: rvp(16),
      right: rvp(16),
      top: rvp(4) + this.topRectHeight,
      bottom: rvp(6)
    })

  }
}

