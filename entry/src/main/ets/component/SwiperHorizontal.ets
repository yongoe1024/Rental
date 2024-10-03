/**
 * 区域导览
 * @author yongoe
 * @since 2024/9/3
 */
@Component
export struct SwiperHorizontal {
  // -----------------------------------组件参数----------------------------------
  halfCount: number = 2 //图片数量的半计数，左右显示2个
  imageList: ResourceStr[] = []
  duration: number = 300 //  动画时间 300毫秒
  onlyOneChange: boolean = false // 仅滑动一个
  imageWidth: number = 100 //宽百分比--中间图片
  imageHeight: number = 100 // 高百分比--中间图片
  boxRadius: number = 15 // 图片内容的圆角
  firstOffset: number = 50 //  两侧第一个元素的偏移vp，递减，后续图片每次减少一半
  changeSize: number = 50 // 手指拖动切换的临界点，vp
  heightChangeUnit: number = 15 // 两侧图片每个减少15%的高度，递进
  opacityChangeUnit: number = 0 // 两侧图片每个减少透明度变化单位，递进
  blurChangeUnit: number = 0 //  两侧图片每个减少模糊度变化单位，递进
  // -----------------------------------结束----------------------------------
  private baseOffsetX: number = 0
  private changing: boolean = false //是否更新索引
  @State
  private moveX: number = 0 //横向移动距离
  @State
  private aheadIndex: number = 0 //开始索引：默认显示
  onclick: (index: number) => void = () => {
  }
  onChange: (index: number) => void = () => {
  }

  @Builder
  customBuilder(item: ResourceStr) {
    Image(item)
      .objectFit(ImageFit.Fill)
      .shadow({ radius: 50, color: 'rgba(0,0,0,0.3)' })
      .borderRadius(this.boxRadius)
  }

  @BuilderParam
  imageBuild: (item: ResourceStr) => void = this.customBuilder

  build() {

    Stack() {
      //循环数据列表
      ForEach(this.imageList, (item: ResourceStr, index: number) => {
        Row() {
          this.imageBuild(item)
        }
        .rotate({
          y: 1,
          angle: 30 * this.getImageCoefficients(index)
        })
        .borderRadius(this.boxRadius)
        .blur(this.blurChangeUnit * Math.abs(this.getImageCoefficients(index)))
        .offset({ x: this.getOffsetX(index), y: 0 })
        .width(`${this.imageWidth}%`)
        .opacity(1 - this.opacityChangeUnit * Math.min(this.halfCount, Math.abs(this.getImageCoefficients(index))))
        .height(index == this.aheadIndex || this.getImageCoefficients(index) !== 0
          ? `${this.imageHeight - this.heightChangeUnit * Math.abs(this.getImageCoefficients(index))}%`
          : `${Math.max(0, this.imageHeight - this.heightChangeUnit * this.halfCount)}%`)
        .zIndex(index == this.aheadIndex || this.getImageCoefficients(index) !== 0
          ? this.halfCount - Math.abs(this.getImageCoefficients(index))
          : 0)

      })
    }
    .width('100%')
    .height('100%')
    .alignContent(Alignment.Center)
    //绑定手势
    .gesture(
      //拖动(上下)
      PanGesture({ direction: PanDirection.Horizontal })
        .onActionStart((e: GestureEvent) => {
          this.baseOffsetX = 0
        })
        .onActionUpdate((e: GestureEvent) => {
          this.handlePanGesture(e.offsetX)
        })
        .onActionEnd(() => {
          this.moveX = 0
          this.changing = false
        })
    )
    .onClick(() => {
      this.onclick(this.aheadIndex)
    })

  }

  //【获取图片的系数】
  //计算图片和最上方图片的索引的相对差值
  // [5]  系数：2
  // [4]  系数：1
  // [1]  系数：0
  // [2]  系数：-1
  // [3]  系数：-2
  //利用方法传入当前图片的索引，通过与当前呈现第一张图片的索引进行计算
  //最终得出上下图片的系数
  //提供后续方法使用，可以决定图片的位置、大小等
  getImageCoefficients(index: number): number {
    // 最前面面是0
    if (index == this.aheadIndex) {
      return 0
    }
    //默认图片索引-当前图片的索引 = 默认图片是在上面还是在下面
    // 备注：上下的索引没跨越数组边缘
    let coefficient = this.aheadIndex - index
    //转绝对值：具体差几张
    let tmpCoefficient = Math.abs(coefficient)
    //判断：如果差值<=半计数，说明在屏幕中
    if (tmpCoefficient <= this.halfCount) {
      //直接返回
      return coefficient
    }
    // 备注：上下的索引跨越数组边缘
    //上面没有执行到判断，说明不再屏幕中，还是要绘制出来
    //元素个数-相差的张数
    let tempOffset = this.imageList.length - tmpCoefficient
    //如果<= 显示的半计数
    if (tempOffset <= this.halfCount) {
      return coefficient > 0 ? -tempOffset : tempOffset
    }
    //上面都不对，不显示，默认0
    return 0
  }

  //获取Y轴
  getOffsetX(index: number) {
    //调用上方方法，提供图片索引，得到系数
    let offsetIndex = this.getImageCoefficients(index)
    //转绝对值
    let tempOffset = Math.abs(offsetIndex)
    // 滑动的移动距离，离得远就变化小，算倍率
    let moveItem = this.moveX / (tempOffset + 1)
    // let moveItem = this.moveX
    // 算固定的偏移位置
    let sum = 0
    for (let index = 1; index <= tempOffset; index++) {
      sum += this.firstOffset / index
    }
    return offsetIndex < 0 ? moveItem + sum : moveItem - sum
  }

  //手势拖动的Y轴处理
  handlePanGesture(offsetX: number) {
    const myOffsetY = offsetX - this.baseOffsetX
    if (Math.abs(myOffsetY) < this.changeSize) {
      this.moveX = myOffsetY * 0.2
    } else {
      if (this.onlyOneChange && this.changing) {
        return
      }
      this.changing = true
      this.baseOffsetX = offsetX
      this.startAnimation(myOffsetY < 0)
    }
  }

  //切换图片动画
  startAnimation(isUP: boolean) {
    animateTo({
      duration: 500, onFinish: () => {
        this.onChange(this.aheadIndex)
      }
    }, () => {
      //元素个数
      let dataLength = this.imageList.length
      //操作的图片索引
      let tempIndex = isUP ? this.aheadIndex + 1 : dataLength + this.aheadIndex - 1
      //更新选中索引
      this.aheadIndex = tempIndex % dataLength
      //复原
      this.moveX = 0
    })
  }
}

