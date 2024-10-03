import { NavBar } from '../../component/NavBar'
import { router } from '@kit.ArkUI';
import { rvp } from '../../common/utils/DeviceScreen';

@Entry
@Component
struct LoginPhone {
  reg = new RegExp(/^1(3|4|5|6|7|8|9)\d{9}$/);
  @State phone: string = ''
  @State isChecked: boolean = false
  @State isValidPhone: boolean = false
  @State isSendCode: boolean = false

  build() {
    Column() {
      NavBar({ title: '验证码登录' })
      Column({ space: rvp(16) }) {
        Stack() {
          TextInput({ placeholder: '请输入手机号' })
            .backgroundColor('rgba(0,0,0,0)')
            .fontSize(rvp(16))
            .showUnderline(true)
            .underlineColor($r('app.color.gray'))
            .caretStyle({ color: $r('app.color.gray_second') })
            .width('100%')
            .onChange((text: string) => {
              this.phone = text
              this.isValidPhone = this.reg.test(text)
            })
          Image($r('app.media.success'))
            .width(rvp(12))
            .height(rvp(8))
            .objectFit(ImageFit.Fill)
            .visibility(this.isValidPhone ? Visibility.Visible : Visibility.Hidden)
        }.alignContent(Alignment.End)


        Row({ space: rvp(4) }) {
          Checkbox({ name: 'checkbox1', group: 'checkboxGroup' })
            .select(false)
            .selectedColor($r('app.color.primary'))
            .shape(CheckBoxShape.CIRCLE)
            .onChange((value: boolean) => {
              this.isChecked = value
            })
            .width(rvp(14))
            .height(rvp(14))

          Text() {
            Span('同意').fontColor($r('app.color.text_gray'))
            Span('《用户协议》').fontColor($r('app.color.primary'))
            Span('和').fontColor($r('app.color.text_gray'))
            Span('《隐私政策》').fontColor($r('app.color.primary'))
          }
          .fontWeight(500)
          .fontSize(rvp(12))
        }
        .width('100%')


        Button('获取验证码')
          .onClick((event: ClickEvent) => {
            router.pushUrl({
              url: 'pages/login/LoginCode',
              params: { phone: this.phone }
            })
          })
          .width(rvp(100))
          .height(rvp(40))
          .margin({ top: rvp(40) })
          .alignSelf(ItemAlign.End)
          .backgroundColor($r('app.color.primary'))
          .enabled(!this.isSendCode && this.isChecked && this.isValidPhone)
      }
      .width('100%')
      .padding({ left: rvp(37), right: rvp(37), top: rvp(37) })

    }
    .height('100%')
    .width('100%')
    .linearGradient({
      colors: [
        ['#ddffdb', 0],
        ['#ffffff', 0.1]
      ]
    })
  }
}