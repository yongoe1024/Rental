/**
 * @author yongoe
 * @since 2024/9/10
 */
import { rvp } from '../../common/utils/DeviceScreen'
import { SupportItem } from '../../viewmodel/RoomDetailModel'

@Component
export struct SupportList {
  @Prop supportList: SupportItem[]

  build() {
    Column({ space: rvp(8) }) {
      Text('租住服务与保障').fontSize(16).fontWeight(700)
      Text('谷粒专享').grayText(12)
      Grid() {
        ForEach(this.supportList, (support: SupportItem) => {
          GridItem() {
            Row({ space: rvp(10) }) {
              Image(support.image).width(rvp(28))
              Column() {
                Text(support.title).fontSize(14)
                Text(support.subTitle).grayText(10)
              }.alignItems(HorizontalAlign.Start)
            }.width('100%')
          }
        })
      }
      .columnsTemplate('1fr 1fr')
      .rowsGap(rvp(16))
      .margin({ top: rvp(5) })
    }.alignItems(HorizontalAlign.Start)
    .margin({ top: rvp(20) })
  }
}


@Extend(Text)
function grayText(size: number) {
  .fontColor($r('app.color.gray')).fontSize(rvp(size))
}