/**
 * 避让区填充容器
 * @author yongoe
 * @since 2024/9/10
 */
@Component
export struct BottomSafeArea {
  @StorageProp('bottomRectHeight')
  bottomRectHeight: number = 0

  build() {
    Row() {

    }
    .width('100%')
    .height(this.bottomRectHeight)

  }
}

