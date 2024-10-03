import { http } from '../common/utils/Request'

import {
  CityItem,
  CityParams,
  DistrictItem,
  DistrictParams,
  ProvinceItem,
  RoomListModel,
  SearchParams,
} from '../viewmodel/RoomListModel'

/**
 * 搜索房源列表数据
 */
export const getRoomListApi = (param: SearchParams): Promise<RoomListModel> => {
  return http.get<RoomListModel>('/house/search', param);
}

/**
 * 获取省份
 */
export const getProvinceApi = (): Promise<ProvinceItem[]> => {
  return http.get<ProvinceItem[]>('/province');
}

/**
 * 获取省份
 */
export const getCityApi = (params: CityParams): Promise<CityItem[]> => {
  return http.get<CityItem[]>('/city', params);
}

/**
 * 获取省份
 */
export const getAreaApi = (params: DistrictParams): Promise<DistrictItem[]> => {
  return http.get<DistrictItem[]>('/area', params);
}