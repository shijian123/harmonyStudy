
@Entry
@Component
export struct AlertPage {
  @State select: number = 2;
  private fruits: string[] = ['苹果', '橘子', '香蕉', '猕猴桃', '西瓜'];

  selectedDate: Date = new Date("2023-12-1")


  build(){
    Column({space:20}){

      Text('各类弹窗')
        .fontSize(30)
        .margin({top:20})

      Button('点击提示弹窗')
        .onClick( ()=> {
          AlertDialog.show({
            title: "提示",
            message: "是否举报此用户",
            autoCancel: false,
            alignment: DialogAlignment.Bottom,
            offset: {dx: 0, dy: -20},
            primaryButton: {
              value: "取消",
              action: ()=> {
                console.info('点击取消')
              }
            },
            secondaryButton: {
              value: "确定",
              action: () => {
                console.info('点击确定')
              }
            }
          })
        })

      Button('点击文本选择弹窗')
        .onClick(()=> {
          TextPickerDialog.show({
            range: this.fruits,// 设置文本选择器的选择范围
            selected: this.select,// 设置初始选中项的索引值
            onAccept: (value: TextPickerResult) => {// 点击弹窗中的“确定”按钮时触发该回调。
              // 设置select为按下确定按钮时候的选中项index，这样当弹窗再次弹出时显示选中的是上一次确定的选项
              this.select = value.index;
              console.info("TextPickerDialog:onAccept()" + JSON.stringify(value));
            },
            onCancel: () => {// 点击弹窗中的“取消”按钮时触发该回调。
              console.info("TextPickerDialog:onCancel()");
            },
            onChange: (value: TextPickerResult) => {// 滑动弹窗中的选择器使当前选中项改变时触发该回调。
              console.info("TextPickerDialog:onChange()" + JSON.stringify(value));
            },
          }
          )
        }
        )
      Button('日期选择器')
        .onClick( ()=> {
          DatePickerDialog.show({
            start: new Date('1900-1-1'),
            end: new Date('2030-12-31'),
            selected: this.selectedDate,
            lunar: false, // 是否展示月历
            onAccept: (value: DatePickerResult) => {// 点击弹窗中的“确定”按钮时触发该回调
              // 通过Date的setFullYear方法设置按下确定按钮时的日期，这样当弹窗再次弹出时显示选中的是上一次确定的日期
              this.selectedDate.setFullYear(value.year, value.month, value.day)
              console.info("DatePickerDialog:onAccept()" + JSON.stringify(value))

            },
            onCancel: () => {// 点击弹窗中的“取消”按钮时触发该回调
              console.info("DatePickerDialog:onCancel()")
            },
            onChange: (value: DatePickerResult) => {// 滑动弹窗中的滑动选择器使当前选中项改变时触发该回调
              console.info("DatePickerDialog:onChange()" + JSON.stringify(value))

            },
          })
        })

    }
    .width('100%').height('100%').backgroundColor(Color.Pink)
  }
}