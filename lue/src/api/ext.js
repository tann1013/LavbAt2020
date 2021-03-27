import {
  post,
  get
} from '@/utils/request';

const api = {
  //billList
  //auth_menus:'admin/bill/list'
    billList:'admin/bill/list'
}
/**
 * 获取授权菜单服务接口
 */
export function ServeGetBills() {
  return get(api.billList);
}

/**
 * 导出服务接口列表
 */
export const EXT_API = api