/**
 * 计算当前月、前两月、后三月的数字
 */
class Calendar {
  currentMonth: number;

  constructor() {
    this.currentMonth = new Date().getMonth() + 1
  }

  addZero(val: number) {
    return val < 10 ? '0' + val : `${val}`;
  }

  getLastNthMonth(nth: number) {
    const currentMonth = this.currentMonth;
    const diffVal = currentMonth - nth; // 1 - 2 === -1
    if (diffVal < 1) {
      return 12 + diffVal
    } else {
      return diffVal;
    }
  }

  getNextNthMonth(nth: number) {
    const currentMonth = this.currentMonth;
    const sumVal = currentMonth + nth; // 12 + 3 === 15
    if (sumVal > 12) {
      return sumVal - 12
    }
    return sumVal;
  }

  generatorCalendarList() {
    return [
      this.addZero(this.getLastNthMonth(2)),
      this.addZero(this.getLastNthMonth(1)),
      this.addZero(this.currentMonth),
      this.addZero(this.getNextNthMonth(1)),
      this.addZero(this.getNextNthMonth(2)),
      this.addZero(this.getNextNthMonth(3)),
    ]
  }
}

export const CalendarList = new Calendar().generatorCalendarList()