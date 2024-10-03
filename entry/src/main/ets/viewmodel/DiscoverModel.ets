/**
 * 发现页面
 */
export interface DiscoverModel {
  danMuList1: Array<DanMuItem>,
  danMuList2: Array<DanMuItem>,
  postZone: PostZone,
  benefits: Array<BenefitsItem>
}

export interface PostZone {
  mainPost: MainPost
  contentBlockList: Array<ContentBlockItem>
}

export interface BenefitsItem {
  title: string
  img: string
}

export interface ContentBlockItem {
  img: string
}

export interface DanMuItem {
  avatar: string
  content: string
}

export interface MainPost {
  followerNum: number
  title: string
  userAvatar: string
  userName: string
  postContent: string
}
