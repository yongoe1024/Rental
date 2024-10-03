/**
 * 房信息详情
 */
export interface RoomDetailModel {
  id: string;
  address: string;
  discounts: Discount[];
  distanceInfo: DistanceInfoItem;
  householdItem: Array<HouseholdItem>;
  housePicture: Array<HousePictureItem>;
  houseTitle: string;
  metaInfo: Array<MetaInfoItem>;
  rentArea: string;
  rentInfo: Array<RentInfoItem>;
  rentPriceUnit: string;
  rentPriceUnitListing: string;
  rentTerm: RentTermItem;
  support: Array<SupportItem>;
  tags: Array<TagItem>;

}

/**
 * 距离，服务器查不到，null
 */
export interface DistanceInfoItem {
  line: string
  name: string
  distance: string
}


export interface Discount {
  image: string;
  tagTxt: string;
  tagTxtBgAroundColor: string;
  tagTxtColor: string;
  txt: string;

}

export interface HousePictureItem {
  picList: Array<string>;
  spaceName: string;

}

export interface HouseholdItem {
  itemList: Array<InfoItem>;
  name: string;

}

export interface InfoItem {
  icon: string;
  value: string;

}

export interface MetaInfoItem {
  desc: string;
  name: string;

}

export interface RentInfoItem {
  image: string;
  title: string;
  userTag: string;
}

export interface RentTermItem {
  checkInTime: string;
  green: string;
  grounding: string;
  heating: string;
  house: string;
  kitchen: string;
  lift: string;
  protection: string;
  renovation: string;
  seeTime: string;
  term: string;
  year: string;

}

export interface SupportItem {
  image: string;
  subTitle: string;
  title: string;

}

export interface TagItem {
  name: string;
}

