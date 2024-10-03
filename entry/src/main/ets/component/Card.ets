/**
 * 卡片组件
 * @author yongoe
 * @since 2024/9/5
 */
@Component
export struct Card {
  //卡片内边距
  @Prop cardPadding: number = 8

  @Builder
  default() {
  }

  @BuilderParam content: () => void = this.default

  build() {
    Column() {
      this.content()

    }
    .alignItems(HorizontalAlign.Start)
    .padding(this.cardPadding)
    .borderRadius(8)
    .backgroundColor($r('app.color.white'))

  }
}

