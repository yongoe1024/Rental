/**
 * 通用导航栏组件
 * @author yongoe
 * @since 2024/9/6
 */
import { router } from '@kit.ArkUI'

@Component
export struct NavBar {
  //导航标题
  @Prop title: string
  @StorageProp('topRectHeight')
  topRectHeight: number = 0

  build() {
    Stack({ alignContent: Alignment.TopStart }) {
      Text(this.title)
        .fontWeight(700)
        .fontSize(16)
        .textAlign(TextAlign.Center)
        .width('100%')
      Image($r('app.media.back'))
        .width(24)
        .height(23)
        .onClick(() => {
          router.back()
        })
    }
    .width('100%')
    .align(Alignment.Start)
    .padding({ top: this.topRectHeight + 10, bottom: 10, left: 8 })
  }
}

