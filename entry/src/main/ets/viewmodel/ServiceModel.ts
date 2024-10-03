/**
 * 服务页面数据
 */
export interface ServiceModel {
  cleaningServiceInfo: Array<CleaningServiceInfoItem>;
  homeServiceList: Array<HomeServiceItem>;
  newcomerZone: NewcomerZoneItem;
  serviceActivity: ServiceActivityItem;
  vipServiceList: Array<VipServiceItem>;
}

/**
 * 清洁家的卡片信息
 */
export interface CleaningServiceInfoItem {
  img: string;
  originalPrice: string;
  priceAfterDiscounts: string;
  subTitle: string;
  title: string;
}

/**
 * 家庭服务网格
 */
export interface HomeServiceItem {
  icon: string;
  title: string;
}

/**
 * 新人专区图片
 */
export interface NewcomerZoneItem {
  img: string;
}

/**
 * 服务日历
 */
export interface ServiceActivityItem {
  img: string;
  name: string;
  subTitle: string;
  title: string;
}

/**
 * 四个VIP信息
 */
export interface VipServiceItem {
  content: number;
  name: string;
}