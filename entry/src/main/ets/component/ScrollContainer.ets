/**
 * 滚动容器组件
 * @author yongoe
 * @since 2024/9/1
 */
import { setSystemBar } from '../common/utils/DeviceScreen';

@Component
export struct ScrollContainer {
  scrollY: number = 0;
  // 初始透明背景，逐渐变成不透明
  bgColorInfo: string = '255,255,255'
  //初始字体颜色
  fontColorStart: string = '255,255,255'
  //最终字体颜色从透明到不透明
  fontColorEnd: string = '0,0,0'
  //初始状态栏字体
  barColorStart: string = '#ffffff'
  //最终状态栏字体
  barColorEnd: string = '#000000'
  // 实际的变量
  @Link barData: BarData

  aboutToAppear(): void {
    this.barData.bgColor = `rgba(${this.bgColorInfo},0)`
    this.barData.fontColor = `rgb(${this.fontColorStart})`
    this.barData.navBarHeight = 0
  }

  @Builder
  customBuilder() {
  }

  @BuilderParam
  navBar: () => void = this.customBuilder
  @BuilderParam
  content: () => void = this.customBuilder
  /**
   * 处理滚动
   */
  handleScroll = (xOffset: number, yOffset: number) => {
    this.scrollY += yOffset;
    this.calcColor()
  }
  /**
   * 计算颜色
   */
  calcColor = () => {
    if (this.scrollY < 10) {
      this.barData.bgColor = `rgba(${this.bgColorInfo},0)`
      this.barData.fontColor = `rgba(${this.fontColorStart},1)`
      setSystemBar({
        statusBarContentColor: this.barColorStart
      })
    } else if (this.scrollY <= 100) {
      let colorOpacity = (this.scrollY - 10) / (100 - 10)
      this.barData.bgColor = `rgba(${this.bgColorInfo},${colorOpacity})`
      this.barData.fontColor = `rgba(${this.fontColorEnd},${colorOpacity})`
    } else {
      this.barData.bgColor = `rgb(${this.bgColorInfo})`
      this.barData.fontColor = `rgb(${this.fontColorEnd})`
      setSystemBar({
        statusBarContentColor: this.barColorEnd
      })
    }
  }

  build() {
    Stack({ alignContent: Alignment.Top }) {
      Scroll() {
        Column() {
          this.content()
        }
      }
      .align(Alignment.TopStart)
      .width('100%')
      .height('100%')
      .scrollBar(BarState.Off)
      .onDidScroll(this.handleScroll)

      Column() {
        this.navBar()
      }
      .onSizeChange((oldValue: SizeOptions, newValue: SizeOptions) => {
        this.barData.navBarHeight = Number(newValue.height)
      })
    }
    .alignContent(Alignment.TopStart)
    .width('100%')
    .height('100%')
  }
}

export class BarData {
  bgColor: string = ''
  fontColor: string = ''
  navBarHeight: number = 0
}