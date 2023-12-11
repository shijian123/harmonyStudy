@Entry
@Component
export struct GridExample {
  // 定义一个长度为16的数组
  private arr: string[] = new Array(40).fill('').map((_, index) => `item ${index}`);

  build() {
    Column() {
      Grid() {
        ForEach(this.arr, (item: string) => {
          GridItem() {
            Text(item)
              .fontSize(16)
              .fontColor(Color.White)
              .backgroundColor(0x007DFF)
              .width('100%')
              .height(100)
              .textAlign(TextAlign.Center)
          }
        }, item => item)
      }
      // 表示这个网格为4列
      .columnsTemplate('1fr 2fr 2fr 1fr')
      // 为了可以滚动，不设置rowsTemplate
      // 表示这个网格为4行，将Grid允许的高分为4等分，每行占1份
      // .rowsTemplate('1fr 1fr 1fr 1fr')
      .columnsGap(10)
      .rowsGap(10)
      .height(300)
    }
    .width('100%')
    .padding(12)
    .backgroundColor(0xF1F3F5)
  }
}