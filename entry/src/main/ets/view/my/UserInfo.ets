/**
 * @author yongoe
 * @since 2024/9/8
 */
import { Avatar } from '../../component/Avatar'
import { router } from '@kit.ArkUI'
import { UserModel } from '../../viewmodel/UserModel'
import { getUserInfoApi } from '../../api/user'
import { rvp } from '../../common/utils/DeviceScreen'

@Component
export struct UserInfo {
  @State avatarSrc: string = ''
  @StorageProp('user')
  user: UserModel = {
    avatar: '',
    id: 0,
    nickname: ''
  }

  async getUser() {
    const user = await getUserInfoApi()
    this.avatarSrc = user.avatar
    AppStorage.setOrCreate('user', user)
  }

  aboutToAppear(): void {
    this.getUser()
  }

  goLoginPhone() {
    router.pushUrl({ url: 'pages/login/LoginPhone' })
  }

  build() {
    Row({ space: rvp(10) }) {
      if (this.user.nickname) {
        Avatar({ src: this.avatarSrc, avatarSize: rvp(60) }).onClick(() => {
          this.goLoginPhone()
        })
        Column({ space: rvp(4) }) {
          Text('Hi，' + this.user.nickname).fontSize(rvp(16)).fontColor($r('app.color.white')).fontWeight(700)
          Text('谷粒点15').fontSize(rvp(12)).fontColor($r('app.color.white'))
        }.alignItems(HorizontalAlign.Start)
      } else {
        Avatar({ src: this.avatarSrc, avatarSize: rvp(60) }).onClick(() => {
          this.goLoginPhone()
        })
        Text('请登录').fontSize(rvp(16)).fontColor($r('app.color.white')).fontWeight(700)

      }
    }.margin({ top: rvp(11) }).width('100%')
  }
}