/**
 * 房源推荐搜索框
 * @author yongoe
 * @since 2024/9/6
 */
import { getAreaApi, getCityApi, getProvinceApi } from '../../api/room'
import { rvp } from '../../common/utils/DeviceScreen'
import {
  CityItem,
  DistrictItem,
  ProvinceItem,
  RentPriceItem,
  RentPriceList,
  SearchParams,
  SortItem,
  SortList
} from '../../viewmodel/RoomListModel'

@Component
export struct SearchFilter {
  @Consume searchParams: SearchParams //查询参数
  @State openIndex: number = -1 //当前搜索
  @State open: boolean = false
  defaultTextList: string[] = ['位置', '支付方式', '租金', '排序'] //默认menu
  @State searchTextList: string[] = ['位置', '支付方式', '租金', '排序'] // 实际menu
  @State provinceList: ProvinceItem[] = [] // 省份
  @State cityList: CityItem[] = [] // 城市
  @State districtList: DistrictItem[] = [] // 区域
  @Watch('handleProvinceChange') @State provinceCode: string = '' // 点击省份
  @Watch('handleCityChange') @State cityCode: string = '' // 点击城市
  @State districtCode: string = '' // 点击区域
  payWayList: string[] = ['月付', '季付', '半年付', '年付'] // 支付方式
  @State payWay: string = '' // 支付方式
  priceList: RentPriceItem[] = RentPriceList // 租金
  @State price: RentPriceItem = RentPriceList[0] //  租金
  sortList: SortItem[] = SortList // 排序
  @State sort: SortItem = SortList[0] //  排序

  aboutToAppear(): void {
    getProvinceApi().then((data: ProvinceItem[]) => {
      this.provinceList = data
    })
  }

  /**
   * 省份改变
   */
  handleProvinceChange() {
    if (!this.provinceCode) {
      return
    }
    getCityApi({ provinceCode: this.provinceCode }).then((data: CityItem[]) => {
      this.cityList = data
      this.cityCode = this.cityList[0].code
    })
  }

  /**
   * 城市改变
   */
  handleCityChange() {
    if (!this.cityCode) {
      return
    }
    getAreaApi({ cityCode: this.cityCode }).then((data: DistrictItem[]) => {
      this.districtList = data
      this.districtCode = this.districtList[0].code
    })
  }

  /**
   * 重置按钮
   */
  reset() {
    if (this.openIndex == 0) {
      this.searchTextList[0] = this.defaultTextList[0]
      //重置位置
      this.provinceCode = ''
      this.districtCode = ''
      this.districtList = []
      this.cityCode = ''
      this.cityList = []
    } else if (this.openIndex == 1) {
      this.payWay = ''
      this.searchTextList[1] = this.defaultTextList[1]
    } else if (this.openIndex == 2) {
      this.price = this.priceList[0]
      this.searchTextList[2] = this.defaultTextList[2]
    } else if (this.openIndex == 3) {
      this.sort = this.sortList[0]
      this.searchTextList[3] = this.defaultTextList[3]
    }
  }

  /**
   * 确定按钮
   */
  submit() {
    this.openIndex = -1
    this.open = false
    let searchParams: SearchParams = {
      page: 1,
      limit: 10,
      provinceCode: this.provinceCode,
      cityCode: this.cityCode,
      districtCode: this.districtCode,
      paymentType: this.payWay,
    }
    // 如果有值就传，再改标题，不限制租金，就不改标题
    if (this.price.id !== this.priceList[0].id) {
      searchParams.minRent = this.price.minRent
      searchParams.maxRent = this.price.maxRent
      this.searchTextList[2] = this.priceList.filter((item) => item.id == this.price.id)[0].text
    }
    // 排序不改标题
    if (this.sort.id !== this.sortList[0].id) {
      searchParams.orderBy = this.sort.orderBy
      searchParams.orderType = this.sort.orderType
      // this.searchTextList[3] = this.sortList.filter((item) => item.id == this.sort.id)[0].text
    }
    //改变搜索标题
    if (this.districtCode) {
      this.searchTextList[0] = this.districtList.filter((item) => item.code == this.districtCode)[0].name
    }
    if (this.payWay) {
      this.searchTextList[1] = this.payWayList.filter((item) => item == this.payWay)[0]
    }
    // 父子组件传参
    this.searchParams = searchParams
  }

  /**
   * 搜索栏
   */
  @Builder
  header() {
    Row() {
      ForEach(this.searchTextList, (item: string, index: number) => {
        Row({ space: rvp(3) }) {
          Text(item)
            .fontSize(14)
            .fontColor('#333')
            .fontWeight(500)
            .textOverflow({ overflow: TextOverflow.Ellipsis })
            .fontColor(this.defaultTextList[index] == this.searchTextList[index] ? '#333' : $r('app.color.primary'))
            .maxLines(1)
            .constraintSize({ maxWidth: rvp(56) })
          // 图片不一样，被迫的
          Row() {
            Image(this.openIndex == index ? $r('app.media.arrow_down_3_active') : $r('app.media.arrow_down'))
              .fillColor(Color.Black)
              .width(this.openIndex == index ? rvp(15) : rvp(8))
              .height(this.openIndex == index ? rvp(15) : rvp(8))
          }
          .width(rvp(15))
          .height(rvp(15))
        }
        .justifyContent(FlexAlign.Start)
        .onClick(() => {
          if (!this.open) {
            //打开
            this.open = true
            this.openIndex = index
          } else if (this.openIndex == index) {
            // 重复点击-关闭
            this.open = false
            this.openIndex = -1
          } else if (this.openIndex != index) {
            // 切换
            this.openIndex = index
          }
        })
      })
    }
    .width('100%')
    .height(rvp(30))
    .justifyContent(FlexAlign.SpaceBetween)
    .padding({ left: rvp(16), right: rvp(16) })
  }

  /**
   * 按钮栏
   */
  @Builder
  footer() {
    Row({ space: rvp(22) }) {
      Button({ type: ButtonType.Normal }) {
        Text('重置').fontColor(Color.Black)
      }
      .onClick((event: ClickEvent) => {
        this.reset()
      })
      .borderRadius(rvp(4))
      .backgroundColor('#F0F0F0')
      .width(rvp(95))
      .height('100%')

      Button({ type: ButtonType.Normal }) {
        Text('查看房源').fontColor(Color.White)
      }
      .onClick((event: ClickEvent) => {
        this.submit()
      })
      .fontSize(Color.White)
      .backgroundColor('#67C0A8')
      .borderRadius(rvp(4))
      .height('100%')
      .layoutWeight(1)

    }
    .height(rvp(26))
    .margin(rvp(16))

  }

  /**
   * 位置
   */
  @Builder
  one() {
    Row() {
      List() {
        ForEach(this.provinceList, (item: ProvinceItem) => {
          ListItem() {
            Text(item.name)
              .width('100%')
              .fontWeight(500)
              .fontSize(12)
              .padding({
                left: rvp(16),
                right: rvp(16),
                top: rvp(6),
                bottom: rvp(6)
              })
              .fontColor(item.code == this.provinceCode ? '#009B71' : '#000')
              .onClick(() => {
                this.provinceCode = item.code
              })
          }
        })
      }
      .width('33%')
      .height('100%')
      .scrollBar(BarState.Off)
      .backgroundColor('#F7F7F7')

      List() {
        ForEach(this.cityList, (item: CityItem) => {
          ListItem() {
            Text(item.name)
              .width('100%')
              .fontWeight(500)
              .fontSize(12)
              .padding({
                left: rvp(16),
                right: rvp(16),
                top: rvp(6),
                bottom: rvp(6)
              })
              .fontColor(item.code == this.cityCode ? '#009B71' : '#000')
              .onClick(() => {
                this.cityCode = item.code
              })
          }
        })
      }
      .width('33%')
      .height('100%')
      .scrollBar(BarState.Off)
      .backgroundColor('#EBEBEB')

      List() {
        ForEach(this.districtList, (item: DistrictItem) => {
          ListItem() {
            Text(item.name)
              .width('100%')
              .fontWeight(500)
              .fontSize(12)
              .padding({
                left: rvp(16),
                right: rvp(16),
                top: rvp(6),
                bottom: rvp(6)
              })
              .fontColor(item.code == this.districtCode ? '#009B71' : '#000')
              .onClick(() => {
                this.districtCode = item.code
              })
          }
        })
      }
      .width('33%')
      .height('100%')
      .scrollBar(BarState.Off)
      .backgroundColor('#E6E6E6')
    }
    .width('100%')
    .height(rvp(240))
  }

  /**
   * 支付方式
   */
  @Builder
  two() {
    Row() {
      ForEach(this.payWayList, (item: string) => {
        Text(item)
          .width(rvp(70))
          .height(rvp(26))
          .borderRadius(rvp(4))
          .backgroundColor(this.payWay === item ? '#67c0a8' : $r('app.color.bg_gray'))
          .fontSize(12)
          .fontColor(this.payWay === item ? Color.White : $r('app.color.gray_second'))
          .textAlign(TextAlign.Center)
          .onClick(() => {
            this.payWay = item
          })
      })
    }
    .width('100%')
    .padding({
      left: rvp(16),
      right: rvp(16),
      top: rvp(8),
      bottom: rvp(8)
    })
    .justifyContent(FlexAlign.SpaceAround)
  }

  /**
   * 租金
   */
  @Builder
  three() {
    Column() {
      Grid() {
        ForEach(this.priceList, (item: RentPriceItem) => {
          GridItem() {
            Text(item.text)
              .width(rvp(95))
              .height(rvp(26))
              .textAlign(TextAlign.Center)
              .backgroundColor(this.price.id == item.id ? '#67c0a8' : $r('app.color.bg_gray'))
              .fontColor(this.price.id == item.id ? Color.White : $r('app.color.gray_second'))
              .borderRadius(rvp(4))
              .fontSize(12)
              .onClick(() => {
                this.price = item
              })
          }
        })
      }
      .columnsTemplate('1fr 1fr 1fr')
      .rowsTemplate('1fr 1fr 1fr')
      .height(rvp(140))
    }
    .width('100%')
    .backgroundColor($r('app.color.white'))
    .padding({ left: rvp(8), right: rvp(8) })
  }

  /**
   * 排序
   */
  @Builder
  four() {
    Column({ space: rvp(8) }) {
      ForEach(this.sortList, (item: SortItem) => {
        Row({ space: rvp(8) }) {
          Image(item.icon)
            .width(rvp(16))
            .height(rvp(16))
          Text(item.text)
            .fontSize(12)
            .fontColor('#666666')
        }
        .padding({
          left: rvp(4),
          right: rvp(16),
          top: rvp(4),
          bottom: rvp(4)
        })
        .shadow({
          radius: this.sort.id == item.id ? 8 : 0
        })
        .borderRadius(rvp(4))
        .onClick(() => {
          this.sort = item
        })
      })
    }
    .width('100%')
    .alignItems(HorizontalAlign.Start)
    .padding({
      left: rvp(32),
      right: rvp(32),
      top: rvp(8),
      bottom: rvp(8)
    })
  }

  build() {
    Column() {
      this.header()
      if (this.open) {
        Column() {
          if (this.openIndex == 0) {
            this.one()
          } else if (this.openIndex == 1) {
            this.two()
          } else if (this.openIndex == 2) {
            this.three()
          } else if (this.openIndex == 3) {
            this.four()
          }
          this.footer()
        }
        .width('100%')
        .backgroundColor(Color.White)

        Column() {
        }
        .backgroundColor('#b2000000')
        .width('100%')
        .layoutWeight(1)
        .onClick(() => {
          this.open = false
          this.openIndex = -1
        })
      }
    }
  }
}

