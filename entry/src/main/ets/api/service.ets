import { http } from '../common/utils/Request'
import { ServiceModel } from '../viewmodel/ServiceModel';


/**
 * 服务页信息
 */
export const getServiceDataApi = (): Promise<ServiceModel> => {
  return http.get<ServiceModel>('/service/info');
}
