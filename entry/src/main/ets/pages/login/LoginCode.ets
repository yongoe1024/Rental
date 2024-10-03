import { router } from '@kit.ArkUI';
import { getUserInfoApi, loginApi, sendSMSCodeApi } from '../../api/user';
import { rvp } from '../../common/utils/DeviceScreen';
import { NavBar } from '../../component/NavBar';

@Entry
@Component
struct LoginCode {
  @StorageLink('token') token: string = ''
  @State phone: string = ''
  @State code: string = ''
  @State codeTime: number = 60
  timer = 0

  /**
   * 倒计时
   */
  countDown() {
    this.timer = setInterval(() => {
      this.codeTime--
      if (this.codeTime == 0) {
        clearInterval(this.timer)
      }
    }, 1000)
  }

  /**
   * 验证码
   */
  async sendCode() {
    await sendSMSCodeApi(this.phone)
    this.codeTime = 60
    this.countDown()
  }

  /**
   * 登录
   */
  async login() {
    const res = await loginApi(this.phone, this.code)
    this.token = res.token
    const user = await getUserInfoApi()
    AppStorage.setOrCreate('user', user)
    router.back({
      url: 'pages/Index',
    })
  }

  aboutToAppear(): void {
    const params = router.getParams() as Record<string, string>
    this.phone = params.phone
    this.sendCode()
  }

  aboutToDisappear(): void {
    clearInterval(this.timer)
  }

  build() {
    Column() {
      NavBar({ title: '验证码登录' })
      Column() {
        Stack() {
          TextInput({ placeholder: '请输入验证码' })
            .inputFilter('^.{0,6}$')
            .backgroundColor('rgba(0,0,0,0)')
            .fontSize(16)
            .showUnderline(true)
            .underlineColor($r('app.color.gray'))
            .caretStyle({ color: $r('app.color.gray_second') })
            .width('100%')
            .onChange((text: string) => {
              this.code = text
            })
          Text(this.codeTime == 0 ? '重新获取' : this.codeTime + 's')
            .fontSize(rvp(16))
            .fontWeight(500)
            .fontColor($r('app.color.primary'))
            .onClick(() => {
              if (this.codeTime == 0) {
                this.sendCode()
              }
            })
        }.alignContent(Alignment.End)

        Button('确认')
          .onClick((event: ClickEvent) => {
            this.login()
          })
          .width(rvp(100))
          .height(rvp(40))
          .margin({ top: rvp(40) })
          .alignSelf(ItemAlign.End)
          .backgroundColor($r('app.color.primary'))
          .enabled(!!this.code)
      }
      .width('100%')
      .padding({ left: rvp(40), right: rvp(37), top: rvp(40) })

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