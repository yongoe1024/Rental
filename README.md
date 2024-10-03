## Rental-硅谷租房（完成品）

### 介绍
1. 部分代码与原视频不同，修改了一些`错误`与`笨重写法`，简化了代码和可读性
2. 参考了部分鸿蒙官方示例，重写了目录结构
3. 补全了视频中未做完的页面，与笔记的写法一致，例如`发现`、`我的`

## 资料

1. 服务器：MacOS amd和arm、linux-amd、windows-amd
2. 官方md文档
3. 在线笔记地址：https://www.yuque.com/xpromise/ab7f1e/mlc0xae1s0ycxii9
4. apifox接口文档（重制版）
5. UI设计稿

## 目录结构
某些`工具类`与`组件`没有用到
```
├── api  
├── common
│   ├── constants
│   │   └── CommonConstants.ets 常量
│   ├── image
│   └── utils
│       ├── DeviceScreen.ets    屏幕工具，获取宽高
│       ├── Emitter.ts          事件工具，发布订阅 (没用到)
│       ├── GlobalContext.ets   全局上下文，存储全局对象比如Window、Want
│       └── Request.ts          axios工具
├── component
│   ├── Avatar.ets              头像
│   ├── BottomSafeArea.ets      导航栏安全区填充 (没用到)
│   ├── Card.ets                卡片
│   ├── Drawer.ets              抽屉弹窗 (没用到)
│   ├── Empty.ets               空数据提示图
│   ├── NavBar.ets              导航栏
│   ├── ScrollContainer.ets     滚动容器
│   ├── SwiperHorizontal.ets    轮播图 左右 (没用到)
│   ├── SwiperVertical.ets      轮播图 上下 (没用到)
│   └── TopSafeArea.ets         状态栏安全区填充(没用到)
├── pages
│   ├── Index.ets               index
│   ├── login
│   │   ├── LoginCode.ets       输入验证码
│   │   └── LoginPhone.ets      输入手机号
│   └── rentRoom
│       ├── BookRoomList.ets    预约房间列表
│       ├── RoomDetail.ets      房间详情
│       └── RoomList.ets        房间列表
├── utils
│   └── Calendar.ts             日历工具
├── view
│   ├── bookRoomList            预约房间列表
│   ├── discover                发现
│   ├── home                    首页
│   ├── index                   index
│   ├── my                      我的
│   ├── roomDetail              房间详情
│   ├── roomList                房间列表
│   ├── see                     想看
│   └── service                 服务
└── viewmodel
```

## 图片

![截屏2024-10-03 14.29.12.png](%E8%B5%84%E6%96%99%2Fimg%2F%E6%88%AA%E5%B1%8F2024-10-03%2014.29.12.png)
![截屏2024-10-03 14.29.23.png](%E8%B5%84%E6%96%99%2Fimg%2F%E6%88%AA%E5%B1%8F2024-10-03%2014.29.23.png)
![截屏2024-10-03 14.29.28.png](%E8%B5%84%E6%96%99%2Fimg%2F%E6%88%AA%E5%B1%8F2024-10-03%2014.29.28.png)
![截屏2024-10-03 14.29.38.png](%E8%B5%84%E6%96%99%2Fimg%2F%E6%88%AA%E5%B1%8F2024-10-03%2014.29.38.png)
![截屏2024-10-03 14.29.48.png](%E8%B5%84%E6%96%99%2Fimg%2F%E6%88%AA%E5%B1%8F2024-10-03%2014.29.48.png)
![截屏2024-10-03 14.29.59.png](%E8%B5%84%E6%96%99%2Fimg%2F%E6%88%AA%E5%B1%8F2024-10-03%2014.29.59.png)
