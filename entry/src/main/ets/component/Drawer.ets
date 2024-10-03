/**
 * 抽屉组件
 * @author yongoe
 * @since 2024/9/10
 */

@Component
export struct Drawer {
  @Link show: boolean;
  @BuilderParam render: () => void

  build() {
    if (this.show) {
      Stack() {
        Column() {
        }.width('100%')
        .height('100%')
        .backgroundColor('rgba(0, 0, 0, 0.7)')
        .onClick(() => {
          this.show = false;
        })

        Column() {
          this.render()
        }.backgroundColor($r('app.color.bg_gray'))
        .width('100%')
        .padding(15)
        .borderRadius({
          topLeft: 10,
          topRight: 10
        })
      }
      .width('100%')
      .height('100%')
      .position({ x: 0, y: 0 })
      .zIndex(999)
      .alignContent(Alignment.BottomStart)
    }
  }
}