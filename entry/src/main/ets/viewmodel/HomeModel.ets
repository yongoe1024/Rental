/**
 * 首页数据
 */
export interface HomeModel {
  adPicture: string;
  bannerList: Array<BannerItem>;
  navList: Array<NavItem>;
  planList: Array<PlanItem>;
  tileList: Array<TileItem>;
}

/**
 * 轮播图
 */
export interface BannerItem {
  id: number;
  imageURL: string;
  name: string;
}

/**
 * 导航网格
 */
export interface NavItem {
  id: number;
  imageURL: string;
  title: string;
}

/**
 * 计划列表
 */
export interface PlanItem {
  id: number;
  imageURL: string;
}

/**
 * 两个平铺
 */
export interface TileItem {
  id: number;
  imageURL: string;
  sub_title: string;
  title: string;
}


/**
 * 8个房源推荐
 */
export interface RoomRecommendItem {
  address: string;
  housePicture: string;
  houseTitle: string;
  id: string;
  rentArea: string;
  rentPriceListing: string;
  rentPriceUnit: string;
  tags: TagItem[];
}

/**
 * 房源Tag
 */
export interface TagItem {
  name: string;
}