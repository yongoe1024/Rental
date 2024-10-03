import { http } from '../common/utils/Request'
import { DiscoverModel } from '../viewmodel/DiscoverModel'


// 获取发现列表数据
export const getDiscoverDataApi = (): Promise<DiscoverModel> => {
  return http.get<DiscoverModel>('/discover/info')
}