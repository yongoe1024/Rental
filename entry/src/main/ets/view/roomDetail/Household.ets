/**
 * @author yongoe
 * @since 2024/9/10
 */
import { rvp } from '../../common/utils/DeviceScreen'
import { HouseholdItem, InfoItem } from '../../viewmodel/RoomDetailModel'

@Component
export struct Household {
  @Prop householdList: HouseholdItem[]

  build() {
    Column({ space: rvp(16) }) {
      Text('物品配置').fontSize(16).fontWeight(700)
      ForEach(this.householdList, (household: HouseholdItem) => {
        Column({ space: rvp(16) }) {
          Row({ space: rvp(10) }) {
            Text(household.name).fontSize(14).fontWeight(700)
            Text(`${household.itemList.length}件物品`).grayText(10)
          }

          Grid() {
            ForEach(household.itemList, (item: InfoItem) => {
              GridItem() {
                Row({ space: rvp(4) }) {
                  Image(item.icon).width(rvp(16))
                  Text(item.value).grayText(14)
                }.justifyContent(FlexAlign.Start).width('100%')
              }
            })
          }
          .columnsTemplate('1fr 1fr 1fr')
          .rowsGap(rvp(16))
          .width('100%')
        }
        .alignItems(HorizontalAlign.Start)
      })
    }.alignItems(HorizontalAlign.Start)
    .margin({ top: rvp(20) })
  }
}

@Extend(Text)
function grayText(size: number) {
  .fontColor($r('app.color.gray')).fontSize(rvp(size))
}