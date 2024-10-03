/**
 * @author yongoe
 * @since 2024/9/8
 */
import { Card } from '../../component/Card'
import { router } from '@kit.ArkUI'
import { rvp } from '../../common/utils/DeviceScreen'

@Component
export struct Order {
  navList1: INavList = [
    {
      id: 1,
      text: '想看',
      icon: $r('app.media.my_icon_1')
    },
    {
      id: 2,
      text: '足迹',
      icon: $r('app.media.my_icon_2')
    },
    {
      id: 3,
      text: '约看',
      icon: $r('app.media.my_icon_3')
    },
    {
      id: 4,
      text: '拼租',
      icon: $r('app.media.my_icon_4')
    }
  ]
  navList2: INavList = [
    {
      id: 1,
      text: '合同',
      icon: $r('app.media.my_icon_5')
    },
    {
      id: 2,
      text: '账单',
      icon: $r('app.media.my_icon_6')
    },
    {
      id: 3,
      text: '订单',
      icon: $r('app.media.my_icon_7')
    },
    {
      id: 4,
      text: '评价',
      icon: $r('app.media.my_icon_8')
    },
    {
      id: 5,
      text: '钱包',
      icon: $r('app.media.my_icon_9')
    }
  ]

  build() {
    Column() {
      Card({ cardPadding: rvp(8) }) {
        Row({ space: rvp(38) }) {
          ForEach(this.navList1, (nav: INavItem) => {
            Row({ space: rvp(4) }) {
              Image(nav.icon).width(rvp(16)).height(rvp(16))
              Text(nav.text).fontSize(rvp(12)).fontColor($r('app.color.black'))
            }
            .onClick(() => {
              if (nav.text === '约看') {
                router.pushUrl({ url: 'pages/rentRoom/BookRoomList' })
              }
            })
          }, (nav: INavItem) => nav.id + '')
        }.width('100%').justifyContent(FlexAlign.Center)

        Divider().margin({ top: rvp(16) })
        Row({ space: rvp(39) }) {
          ForEach(this.navList2, (nav: INavItem) => {
            Column({ space: rvp(6) }) {
              Image(nav.icon).width(rvp(16)).height(rvp(16))
              Text('合同').fontSize(rvp(12)).fontColor($r('app.color.black'))
            }
          }, (nav: INavItem) => nav.id + '')
        }.margin({ top: rvp(12) }).justifyContent(FlexAlign.Center).width('100%')
      }
    }.margin({ top: rvp(10) })
  }
}

export interface INavItem {
  id: number
  text: string
  icon: Resource
}

export type INavList = INavItem[]