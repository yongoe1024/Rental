/**
 * @author yongoe
 * @since 2024/9/8
 */
@Component
export struct Empty {
  @Prop title: ResourceStr
  @Prop image: ResourceStr

  build() {
    Column() {
      Image(this.image)
        .width(150)
        .height(140)
        .objectFit(ImageFit.Fill)
      Text(this.title)
        .fontSize(12)
        .fontWeight(500)
        .margin({ top: 20 })
    }
    .width('100%')
    .alignItems(HorizontalAlign.Center)

  }
}

