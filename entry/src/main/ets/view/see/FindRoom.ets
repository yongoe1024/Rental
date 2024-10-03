/**
 * @author yongoe
 * @since 2024/9/3
 */
import { rvp } from '../../common/utils/DeviceScreen'

@Preview
@Component
export struct FindRoom {
  build() {
    Column() {
      Image($r('app.media.find_room'))
        .width(rvp(60))
        .height(rvp(23))
        .margin({ top: rvp(60) })

      Text('发现你想看的房子')
        .margin({
          top: rvp(20)
        })
        .fontSize(rvp(12))
        .fontColor($r('app.color.black'))

      Image($r('app.media.blank'))
        .width(rvp(234))
        .height(rvp(221))
        .margin({ top: rvp(7) })
        .alignSelf(ItemAlign.Center)

      Text('暂无想看房源，试试如下找房方式')
        .fontSize(rvp(16))
        .fontColor($r('app.color.black'))
        .alignSelf(ItemAlign.Center)
        .fontWeight(600)
        .margin({ top: rvp(10) })

      Image($r('app.media.see_room'))
        .width(rvp(328))
        .height(rvp(80))
        .margin({ top: rvp(20) })
        .alignSelf(ItemAlign.Center)
    }
    .width('100%')
    .padding({ left: rvp(16), right: rvp(16) })
    .alignItems(HorizontalAlign.Start)
  }
}

