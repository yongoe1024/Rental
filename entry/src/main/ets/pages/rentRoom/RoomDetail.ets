/**
 * 房源详情
 * @author yongoe
 * @since 2024/8/23
 */
import { BarData } from '../../component/ScrollContainer'
import { HousePictureItem, RentTermItem, RoomDetailModel } from '../../viewmodel/RoomDetailModel'
import { router } from '@kit.ArkUI'
import { getRoomDetailApi } from '../../api/roomDetail'
import { HousePictureList } from '../../view/roomDetail/HousePictureList'
import { rvp } from '../../common/utils/DeviceScreen'
import { RentPrice } from '../../view/roomDetail/RentPrice'
import { DiscountsList } from '../../view/roomDetail/DiscountsList'
import { MetaInfo } from '../../view/roomDetail/MetaInfo'
import { TagList } from '../../view/roomDetail/TagList'
import { RentTerm } from '../../view/roomDetail/RentTerm'
import { RentInfo } from '../../view/roomDetail/RentInfo'
import { Household } from '../../view/roomDetail/Household'
import { SupportList } from '../../view/roomDetail/SupportList'
import { Book } from '../../view/roomDetail/Book'
import { BottomSafeArea } from '../../component/BottomSafeArea'
import { NavBar } from '../../view/roomDetail/NavBar'


@Entry
@Component
struct RoomDetail {
  @State barData: BarData = new BarData()
  @State room: Partial<RoomDetailModel> = {}
  @State title: string = ''
  @State housePictureList: HousePictureItem[] = []
  @State rentTerm: RentTermItem = {} as RentTermItem
  @State houseId: string = ''

  aboutToAppear(): void {
    const params = router.getParams() as Record<string, string>
    getRoomDetailApi(params.id).then((data: RoomDetailModel) => {
      this.room = data
      this.houseId = data.id
      this.title = data.houseTitle
      this.housePictureList = data.housePicture
      this.rentTerm = data.rentTerm
    })
  }

  build() {
    Column() {
      NavBar({ title: this.title })
      Scroll() {
        Column() {
          HousePictureList({ housePictureList: this.housePictureList })
          Column({ space: rvp(8) }) {
            RentPrice({ rentPriceListing: this.room.rentPriceUnitListing, rentPriceUnit: this.room.rentPriceUnit })
            DiscountsList({ discountsList: this.room.discounts })
            MetaInfo({ metaInfoList: this.room.metaInfo })
            TagList({ tagList: this.room.tags })
          }.margin({ top: rvp(16) })
          .padding({ left: rvp(16), right: rvp(16) })

          Column({ space: rvp(16) }) {
            RentTerm({ rentTerm: this.rentTerm! })
            RentInfo({ rentInfoList: this.room.rentInfo })
            Household({ householdList: this.room.householdItem })
            SupportList({ supportList: this.room.support })
            Button('查看全部内容')
              .type(ButtonType.Normal)
              .width('100%')
              .height(rvp(44))
              .fontSize(12)
              .fontColor('#ABA9AC')
              .backgroundColor('#eee')
              .border({ width: 1, color: '#F5F5F5', radius: rvp(8) })

          }
          .padding({ left: rvp(16), right: rvp(16) })
        }
      }.width('100%')
      .layoutWeight(1)
      .align(Alignment.TopStart)
      .scrollBar(BarState.Off)

      Book({ houseId: this.room.id })
    }
    .height('100%')
    .width('100%')
  }
}