/**
 * axios请求封装
 * @author yongoe
 * @since 2024/8/23
 */
import axios from '@ohos/axios'
import { promptAction } from '@kit.ArkUI'

export interface AnyObject {
  [key: string]: any
}

const instance = axios.create({
  baseURL: 'http://192.168.0.107:6060'
})

instance.interceptors.request.use(
  (config) => {
    const token = AppStorage.get<string>('token')
    if (token) {
      config.headers.token = token
    }
    return config
  }
)

instance.interceptors.response.use(
  (response) => {
    console.log(JSON.stringify(response.data))
    if (response.data.code === 200) {
      return response.data.data
    }
    promptAction.showToast({
      message: response.data.message
    })
    return Promise.reject(response.data)
  },
  (error) => {
    console.log(JSON.stringify(error))
    promptAction.showToast({
      message: error.message,
    })
    return Promise.reject(error)
  }
)

class Request {
  constructor() {
    console.log('初始化http')
  }

  get<T>(url: string, params?: AnyObject) {
    return instance.get<any, T>(url, { params })
  }

  post<T>(url: string, data?: AnyObject) {
    return instance.post<any, T>(url, data)
  }

  put<T>(url: string, data?: AnyObject) {
    return instance.put<any, T>(url, data)
  }

  delete<T>(url: string, params?: AnyObject) {
    return instance.delete<any, T>(url, { params })
  }
}

export const http = new Request()