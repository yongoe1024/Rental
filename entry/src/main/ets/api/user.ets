import { http } from '../common/utils/Request'
import { LoginResModel, UserModel } from '../viewmodel/UserModel';

/**
 * 获取验证码
 */
export const sendSMSCodeApi = (phone: string): Promise<void> => {
  return http.post<void>('/sendSMSCode', { phone: phone });
}

/**
 * 登录
 */
export const loginApi = (phone: string, code: string): Promise<LoginResModel> => {
  return http.post<LoginResModel>('/login', { phone: phone, code: code });
}

/**
 * 获取用户信息
 */
export const getUserInfoApi = (): Promise<UserModel> => {
  return http.get<UserModel>('/auth/user/userInfo');
}