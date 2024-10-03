import { RoomRecommendItem } from './HomeModel';

/**
 * 房源推荐页面搜索
 */
export interface SearchParams {
  page: number;
  limit: number;
  maxRent?: string;
  minRent?: string;
  cityCode?: string;
  districtCode?: string;
  orderBy?: string; //只能传递两种值 ： area | price
  orderType?: string; //排序方式 如果orderby没指定或者给错了就默认升序，如果传值为desc就降序。
  paymentType?: string;
  provinceCode?: string;
}

/**
 * 房源推荐数据
 */
export interface RoomListModel {
  records: Array<RoomItem>;
  total: string;
}

/**
 * 房源数据
 */
export interface RoomItem extends RoomRecommendItem {
  activity?: ActivityItem
}

/**
 * 活动数据
 */
export interface ActivityItem {
  "#text": string;
  icon: string;
  textBackGroundColor: string;
  textColor: string;
  title: string;
}

/**
 * 省份
 */
export interface ProvinceItem {
  code: string;
  name: string;
}

/**
 * 城市
 */
export interface CityItem {
  code: string;
  name: string;
  provinceCode: string
}

/**
 * 地区
 */
export interface DistrictItem {
  cityCode: string;
  code: string;
  name: string;
  provinceCode: string;
}

/**
 * 查询城市
 */
export interface CityParams {
  provinceCode: string;
}

/**
 * 查询地区
 */
export interface DistrictParams {
  cityCode: string;
}

/**
 * 租金搜索项
 */
export interface RentPriceItem {
  id: number;
  minRent: string;
  maxRent: string;
  text: string;
}

/**
 * 排序搜索项
 */
export interface SortItem {
  id: number;
  icon: Resource;
  text: string;
  orderBy: string; //只能传递两种值 ： area | price
  orderType: string; //排序方式 如果orderby没指定或者给错了就默认升序，如果传值为desc就降序。
}

/**
 * 租金搜索列表
 */
export const RentPriceList: Array<RentPriceItem> =
  [
    {
      id: 1,
      minRent: '0',
      maxRent: '0',
      text: '不限'
    },
    {
      id: 2,
      minRent: '0',
      maxRent: '1500',
      text: '1500元以下'
    },
    {
      id: 3,
      minRent: '1500',
      maxRent: '2500',
      text: '1500-2500元'
    },
    {
      id: 4,
      minRent: '2500',
      maxRent: '3500',
      text: '2500-3500元'
    },
    {
      id: 5,
      minRent: '3500',
      maxRent: '4500',
      text: '3500-4500元'
    },
    {
      id: 6,
      minRent: '4500',
      maxRent: '6000',
      text: '4500-6000元'
    },
    {
      id: 7,
      minRent: '6000',
      maxRent: '8000',
      text: '6000-8000元'
    },
    {
      id: 8,
      minRent: '8000',
      maxRent: '10000',
      text: '8000-10000元'
    },
    {
      id: 9,
      minRent: '10000',
      maxRent: '0',
      text: '10000元以上'
    }
  ]

/**
 * 排序搜索列表
 */
export const SortList: Array<SortItem> =
  [
    {
      id: 1,
      icon: $r('app.media.sort'),
      text: '综合排序',
      orderBy: '',
      orderType: ''
    },
    {
      id: 2,
      icon: $r('app.media.rent'),
      text: '价格从低到高',
      orderBy: 'price',
      orderType: 'asc'
    },
    {
      id: 3,
      icon: $r('app.media.rent'),
      text: '价格从高到低',
      orderBy: 'price',
      orderType: 'desc'
    },
    {
      id: 4,
      icon: $r('app.media.area'),
      text: '面积从大到小',
      orderBy: 'area',
      orderType: 'desc'
    },
    {
      id: 5,
      icon: $r('app.media.area'),
      text: '面积从小到大',
      orderBy: 'area',
      orderType: 'asc'
    }
  ]
