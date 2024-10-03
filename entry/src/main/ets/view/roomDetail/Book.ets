/**
 * @author yongoe
 * @since 2024/9/10
 */
import { reservationApi } from '../../api/book';
import { YuDing } from './YuDing';
import { promptAction, router } from '@kit.ArkUI';
import { rvp } from '../../common/utils/DeviceScreen';
import { ReserveRoomParams } from '../../viewmodel/BookRoomModel';

@Component
export struct Book {
  @StorageProp('bottomRectHeight')
  bottomRectHeight: number = 0
  @StorageProp('token') token: string = '';
  @Prop houseId: string
  yuDingController: CustomDialogController = new CustomDialogController({
    builder: YuDing({
      confirm: (param: ReserveRoomParams) => {
        param.houseId = this.houseId
        reservationApi(param).catch(() => {
          promptAction.showToast({
            message: '预约失败，时间冲突'
          })
        })
      }
    }),
    alignment: DialogAlignment.Bottom,
    autoCancel: true,
    customStyle: true,
    isModal: true,
    maskColor: 'rgba(0,0,0,0.7)',

  })

  build() {
    Row() {
      Column({ space: rvp(4) }) {
        Image($r('app.media.my_icon_1')).width(rvp(18))
        Text('99+').fontSize(12).fontColor($r('app.color.gray'))
      }

      Column({ space: rvp(4) }) {
        Image($r('app.media.message')).width(rvp(18)).fillColor($r('app.color.black'))
        Text('咨询').fontSize(12).fontColor($r('app.color.gray'))
      }

      Button('立即预定', { type: ButtonType.Normal })
        .borderRadius(rvp(2))
        .backgroundColor('#24A17B')
        .padding({ left: rvp(30), right: rvp(30) })
        .height(rvp(34))
        .onClick(() => {
          if (!this.token) {
            router.pushUrl({ url: 'pages/login/LoginPhone' })
            return
          }
          this.yuDingController.open()
        })
      Button('去看房', { type: ButtonType.Normal })
        .borderRadius(rvp(2))
        .backgroundColor('#6BE3BE')
        .padding({ left: rvp(30), right: rvp(30) })
        .height(rvp(34))
    }
    .backgroundColor($r('app.color.white'))
    .padding({ bottom: this.bottomRectHeight })
    .justifyContent(FlexAlign.SpaceEvenly)
    .width('100%')
  }
}

