/**
 * 用户信息模型
 */
export interface UserModel {
  avatar: string;
  id: number;
  nickname: string;
}


/**
 * 用户登录
 */
export interface LoginResModel {
  token: string;
}