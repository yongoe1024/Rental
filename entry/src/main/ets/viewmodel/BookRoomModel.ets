/**
 * 预约房间
 */
export interface BookRoomItem {
  comment: string;
  date: string;
  distanceInfo: null;
  houseId: string;
  id: string;
  img: string;
  rentPrice: string;
  subTitle: string;
  tags: Tag[];
  title: string;
}

export interface Tag {
  name: string;
}

/**
 * 提交预约参数
 */
export interface ReserveRoomParams {
  comment: string;
  date: string;
  houseId: string;
  name: string;
  phone: string;
}
