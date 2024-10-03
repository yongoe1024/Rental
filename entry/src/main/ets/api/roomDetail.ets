import { http } from '../common/utils/Request'
import { RoomDetailModel } from '../viewmodel/RoomDetailModel';

/**
 * 获取房间详情
 */
export const getRoomDetailApi = (id: string): Promise<RoomDetailModel> => {
  return http.get<RoomDetailModel>('/house/detail', { id: id });
}
