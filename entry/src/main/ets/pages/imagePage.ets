
@Entry
@Component
struct imagePage {
  // state 修饰的不能为空值
  // 支持object、class、string、number、boolean，enum
  // 不支持嵌套，如object 内的object，数组中的object发生变化时
  @State message: string = 'Hello World'
  @State imgWidth: number = 200
  @State times: number = 0

  build() {
    Column() {
      Text(this.message)
        .fontSize(30)
        .fontWeight(FontWeight.Bold)
        .fontColor('#36D')
        .onClick(() => {
          if (this.message === "Hello World") {
            this.message = "不欢迎"
          } else {
            this.message = "Hello World"
          }
        })
      // Image('https://cdnimg.gamekee.com/wiki2.0/images/w_1563/h_856/829/43637/2023/4/16/151198.png')
      //   .width(300)
      Row() {
        Image($r('app.media.pic3'))
          .width(this.imgWidth)
          .borderRadius(8)
          .interpolation(ImageInterpolation.High)
      }
      .width('100%')
      .height(300)
      .justifyContent(FlexAlign.Center)

      Row() {
        Text($r("app.string.width_label"))
          .lineHeight(32)
          .fontSize(20)
          .fontColor("#333")
        TextInput({ placeholder: "请输入图片的宽度", text: this.imgWidth.toFixed(0) })
          .type(InputType.Number)
          .backgroundColor('#FFF')
          .width(150)
          .onChange(value => {
            this.imgWidth = parseInt(value)
          })
      }
      .width('100%')
      .padding({ left: 16, right: 16 })
      .justifyContent(FlexAlign.SpaceBetween)

      Divider()
        .width('91%')


      Row({ space: 20 }) {
        Button('缩小')
          .width(100)
          .height(30)
          .type(ButtonType.Normal)
          .onClick(() => {
            if (this.imgWidth > 100) {
              this.imgWidth -= 10
            }
          })
        Button('变大')
          .width(100)
          .height(30)
          .onClick(() => {
            if (this.imgWidth < 320) {
              this.imgWidth += 10
            }
          })
      }
      .width('100%')
      .margin({ top: 20, bottom: 20 })
      .justifyContent(FlexAlign.SpaceEvenly) // 主轴
      .alignItems(VerticalAlign.Center) // 交叉轴

      Slider({
        min: 100,
        max: 320,
        value: this.imgWidth,
        step: 10, //  步长
        style: SliderStyle.OutSet, //滑块展示内、外
        direction: Axis.Horizontal, // 水平方法
        reverse: false // 是否反向滑动
      })
        .blockColor('#36D')
        .trackThickness(8) // 展示滑块高度
        .showTips(true) // 是否展示气泡
        .onChange(value => {
          this.imgWidth = value
        })


    }
    .width('100%')
    .height('100%')
  }
}