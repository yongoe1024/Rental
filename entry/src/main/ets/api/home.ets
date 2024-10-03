import { http } from '../common/utils/Request'
import { HomeModel, RoomRecommendItem } from '../viewmodel/HomeModel';

/**
 * 首页信息
 */
export const getHomeDataApi = (): Promise<HomeModel> => {
  return http.get<HomeModel>('/home/info');
}

/**
 * 首页8个房源推荐
 */
export const getRoomRecommendApi = (): Promise<RoomRecommendItem[]> => {
  return http.get<RoomRecommendItem[]>('/house/nearbyHouses');
}