/**
 * @author yongoe
 * @since 2024/9/10
 */
import { rvp } from '../../common/utils/DeviceScreen'
import { ReserveRoomParams } from '../../viewmodel/BookRoomModel'
import { promptAction } from '@kit.ArkUI'

@Component
@CustomDialog
export struct YuDing {
  controller?: CustomDialogController
  @StorageProp('bottomHeight')
  bottomHeight: number = 0
  @State name: string = ''
  @State phone: string = ''
  @State date: string = ''
  @State remark: string = ''
  confirm: (param: ReserveRoomParams) => void = () => {
  }

  build() {
    Column({ space: rvp(16) }) {
      Text('预约信息')
        .fontSize(18)
        .fontWeight(700)
      Column({ space: rvp(20) }) {

        Row({ space: rvp(18) }) {
          Text('姓名').width(rvp(56)).fontSize(14)
          TextInput({ placeholder: '请输入姓名' }).textInputStyles()
            .onChange((value: string) => {
              this.name = value;
            })
        }.width('100%')

        Row({ space: rvp(18) }) {
          Text('手机号').width(rvp(56)).fontSize(14)
          TextInput({ placeholder: '请输入手机号' }).type(InputType.PhoneNumber).maxLength(11).textInputStyles()
            .onChange((value: string) => {
              this.phone = value;
            })
        }.width('100%')

        Row({ space: rvp(18) }) {
          Text('预约日期').width(rvp(56)).fontSize(14)
          Row() {
            TextInput({ placeholder: '请选择预约日期', text: $$this.date })
              .enabled(false)
              .textInputStyles()
            Image($r('app.media.arrow_down_2')).width(rvp(10)).fillColor($r('app.color.gray'))
          }.layoutWeight(1)
          .justifyContent(FlexAlign.SpaceBetween)
          .onClick(() => {
            DatePickerDialog.show({
              start: new Date(),
              alignment: DialogAlignment.Bottom,
              end: new Date(new Date().getTime() + 1000 * 60 * 60 * 24 * 6),
              onAccept: (value: DatePickerResult) => {
                this.date = `${value.year}-${addZero(value.month)}-${addZero(value.day)}`
              },
            })
          })
        }.width('100%')

        Row({ space: rvp(18) }) {
          Text('备注信息').width(rvp(56)).fontSize(14)
          TextArea({ placeholder: '请输入备注信息' }).textAreaStyles()
            .onChange((value: string) => {
              this.remark = value;
            })
        }.width('100%')
        .alignItems(VerticalAlign.Top)

      }
      .width('100%')
      .backgroundColor(Color.White)
      .padding(16)
      .borderRadius(4)

      Button('预约看房', { type: ButtonType.Normal })
        .onClick(() => {
          if (this.name && this.phone && this.date) {
            let param: ReserveRoomParams = {} as ReserveRoomParams
            param.name = this.name
            param.phone = this.phone
            param.date = this.date
            param.comment = this.remark
            console.log(JSON.stringify(param))
            this.confirm(param)
            this.controller?.close()
          } else {
            promptAction.showToast({
              message: '请输入信息！',
              duration: 1000,
              bottom: 150
            });
          }
        })
        .backgroundColor('#24A17B')
        .fontColor(Color.White)
        .borderRadius(2)
        .height(43)
        .width('100%')
    }
    .alignItems(HorizontalAlign.Start)
    .width('100%')
    .borderRadius({ topLeft: 20, topRight: 20 })
    .backgroundColor('#ffececec')
    .padding({
      top: 16,
      left: 16,
      right: 16,
      bottom: 16 + this.bottomHeight
    })
  }
}

function addZero(x: number): string {
  if (x < 10) {
    return `0${x}`
  } else {
    return x + ''
  }
}


@Styles
function pressedStyles() {
  .backgroundColor('#F6F6F6')
}

@Extend(TextInput)
function textInputStyles() {
  .layoutWeight(1)
  .backgroundColor(Color.Transparent)
  .placeholderColor($r('app.color.gray'))
  .placeholderFont({ size: 14 })
  .caretColor($r('app.color.gray'))
  .fontSize(14)
  .borderRadius(rvp(8))
  .stateStyles({
    pressed: pressedStyles,
  })
  .padding(0)
}

@Extend(TextArea)
function textAreaStyles() {
  .layoutWeight(1)
  .backgroundColor('#F6F6F6')
  .placeholderColor($r('app.color.gray'))
  .placeholderFont({ size: 14 })
  .caretColor($r('app.color.gray'))
  .fontSize(14)
  .borderRadius(rvp(8))
  .stateStyles({
    pressed: pressedStyles,
  })
  .padding(rvp(0))
  .height(rvp(60))
}