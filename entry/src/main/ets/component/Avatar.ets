/**
 * 头像组件
 * @author yongoe
 * @since 2024/9/8
 */
@Component
export struct Avatar {
  @Link src: string
  @Prop avatarSize: number = 20
  @Prop radius: number = 0

  build() {
    Image(this.src || $r('app.media.avatar_unlogin'))
      .width(this.avatarSize)
      .height(this.avatarSize)
      .borderRadius(this.radius)
      .objectFit(ImageFit.Fill)
  }
}