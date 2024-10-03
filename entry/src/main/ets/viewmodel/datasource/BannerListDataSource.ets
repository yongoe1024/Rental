/**
 * BannerList懒加载
 * @author yongoe
 * @since 2024/8/31
 */
import { BannerItem } from '../HomeModel';

@Observed
export default class BannerListDataSource implements IDataSource {
  bannerList: BannerItem[] = []
  // 内部用来触发UI更新的对象
  listeners: DataChangeListener[] = []

  totalCount(): number {
    return this.bannerList.length
  }

  getData(index: number): BannerItem {
    return this.bannerList[index]
  }

  setData(banner: BannerItem): void {
    this.bannerList.push(banner)
    this.notifyDataAdd(this.bannerList.length - 1)
  }

  setList(bannerList: BannerItem[]) {
    this.bannerList = bannerList
    this.notifyDataReload()
  }

  // 该方法为框架侧调用，为LazyForEach组件向其数据源处添加listener监听
  registerDataChangeListener(listener: DataChangeListener): void {
    if (this.listeners.indexOf(listener) < 0) {
      this.listeners.push(listener);
    }
  }

  // 该方法为框架侧调用，为对应的LazyForEach组件在数据源处去除listener监听
  unregisterDataChangeListener(listener: DataChangeListener): void {
    const pos = this.listeners.indexOf(listener);
    if (pos >= 0) {
      this.listeners.splice(pos, 1);
    }
  }

  // 通知LazyForEach组件需要重载所有子组件
  notifyDataReload(): void {
    this.listeners.forEach(listener => {
      listener.onDataReloaded();
    })
  }

  // 通知LazyForEach组件需要在index对应索引处添加子组件
  notifyDataAdd(index: number): void {
    this.listeners.forEach(listener => {
      listener.onDataAdd(index);
    })
  }

  // 通知LazyForEach组件在index对应索引处数据有变化，需要重建该子组件
  notifyDataChange(index: number): void {
    this.listeners.forEach(listener => {
      listener.onDataChange(index);
    })
  }

  // 通知LazyForEach组件需要在index对应索引处删除该子组件
  notifyDataDelete(index: number): void {
    this.listeners.forEach(listener => {
      listener.onDataDelete(index);
    })
  }

  // 通知LazyForEach组件将from索引和to索引处的子组件进行交换
  notifyDataMove(from: number, to: number): void {
    this.listeners.forEach(listener => {
      listener.onDataMove(from, to);
    })
  }
}