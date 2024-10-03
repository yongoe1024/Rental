import { http } from '../common/utils/Request'
import { BookRoomItem, ReserveRoomParams } from '../viewmodel/BookRoomModel';

/**
 * 预约租房
 */
export const reservationApi = (params: ReserveRoomParams): Promise<void> => {
  return http.post<void>('/auth/house/reservation', params);
}

// 获取预约租房列表
export const getBookRentRoomListApi = (): Promise<BookRoomItem[]> => {
  return http.get<BookRoomItem[]>('/auth/house/history')
}