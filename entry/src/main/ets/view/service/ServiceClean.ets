/**
 * @author yongoe
 * @since 2024/9/5
 */
import { rvp } from '../../common/utils/DeviceScreen'
import { Card } from '../../component/Card'
import { CleaningServiceInfoItem, NewcomerZoneItem } from '../../viewmodel/ServiceModel'

@Component
export struct ServiceClean {
  @Prop newcomerZone: NewcomerZoneItem
  @Prop cleaningServiceInfo: CleaningServiceInfoItem[]
  @State index: number = 0

  /**
   * 标题
   */
  @Builder
  title() {
    Card() {
      Text() {
        Span('新人')
        Span('专区')
          .fontColor($r('app.color.primary'))
      }.fontSize(16).fontWeight(700)

      Image(this.newcomerZone.img)
        .width('100%')
        .height(rvp(90))
        .margin({ top: rvp(8) })
    }
  }

  /**
   * 内容
   */
  @Builder
  content() {
    Card() {
      Text('洁净家').fontSize(16).fontWeight(700)
      Row({ space: rvp(8) }) {
        ForEach(this.cleaningServiceInfo, (item: CleaningServiceInfoItem) => {
          Column({ space: rvp(8) }) {
            Image(item.img)
              .width(rvp(152))
              .height(rvp(115))
            Text(item.title).fontSize(14).fontWeight(700)
            Text(item.subTitle).fontSize(10).fontWeight(500).fontColor(Color.Gray)
            Row({ space: rvp(4) }) {
              Text('到手价').fontSize(10).fontColor('#666')
              Text('￥' + item.priceAfterDiscounts).fontSize(16).fontColor(Color.Red)
              Text('￥' + item.originalPrice).fontSize(10).fontColor(Color.Gray)
                .decoration({ type: TextDecorationType.LineThrough })
            }
          }
          .alignItems(HorizontalAlign.Start)
        })
      }
      .width('100%')
      .margin({ top: rvp(8) })
    }
  }

  @Builder
  contentBuilder() {
    Column() {
      this.title()
      this.content()
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Start)
  }

  @Builder
  tabBarBuilder(title: string, subTitle: string, index: number) {
    Column({ space: rvp(3) }) {
      Text(title)
        .fontSize(this.index == index ? 18 : 14)
        .fontWeight(700)
      Text(subTitle)
        .fontSize(12)
        .fontWeight(500)
      if (this.index == index) {
        Row()
          .width(rvp(20))
          .height(rvp(4))
          .backgroundColor('#51bb9e')
          .borderRadius(rvp(9))
      }
    }
    .height('100%')
    .justifyContent(FlexAlign.Center)

  }

  build() {
    Tabs() {
      TabContent() {
        this.contentBuilder()
      }
      .tabBar(this.tabBarBuilder('会员精选', '专业服务', 0))

      TabContent() {
        this.contentBuilder()
      }
      .tabBar(this.tabBarBuilder('居家保洁', '解放双手', 1))

      TabContent() {
        this.contentBuilder()
      }
      .tabBar(this.tabBarBuilder('深层清洁', '高温蒸洗', 2))

      TabContent() {
        this.contentBuilder()
      }
      .tabBar(this.tabBarBuilder('新居乔迁', '一站搬家', 3))
    }
    .barHeight(rvp(70))
    .width('100%')
    .height(rvp(440))
    .onChange((index: number) => {
      this.index = index
    })

  }
}

