type ICallback = (...args: any[]) => void

interface Events {
  [eventName: string]: ICallback[]
}

class Emitter {
  private callbacks: Events = {}

  /**
   * 绑定事件
   */
  on(eventName: string, cb: ICallback) {
    if (this.callbacks[eventName]) {
      this.callbacks[eventName].push(cb)
    } else {
      this.callbacks[eventName] = [cb]
    }
  }

  /**
   * 触发一次事件
   */
  once(eventName: string, cb: ICallback) {
    const callback = (...args) => {
      cb(...args)
      this.off(eventName, callback);
    }
    this.on(eventName, callback);
  }

  /**
   * 触发事件
   */
  emit(eventName: string, ...args: any[]) {
    if (!this.callbacks[eventName]) {
      // 事件不存在
      throw new Error(`${eventName}自定义事件不存在~`)
    }
    this.callbacks[eventName].forEach(cb => cb(...args))
  }

  /**
   * 解绑事件
   */
  off(eventName?: string, cb?: ICallback) {
    if (!eventName) {
      // 解绑所有事件
      this.callbacks = {};
      return;
    }

    if (!this.callbacks[eventName]) {
      // 事件不存在
      throw new Error(`${eventName}自定义事件不存在~`)
    }

    if (!cb) {
      // 解绑单个事件的所有回调函数
      delete this.callbacks[eventName]
      return;
    }
    // 解绑单个事件的单个回调
    this.callbacks[eventName] = this.callbacks[eventName].filter(callback => cb !== callback)
  }
}

export const globalEmitter = new Emitter();