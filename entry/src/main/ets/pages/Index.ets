// @ts-nocheck
import thermal from '@ohos.thermal'
import router from '@ohos.router'
// @ts-nocheck

class  Person {
  name: string
  age: number
  girlFriend: Person

  constructor(name: string, age: number, girlFriend?: Person) {
    this.name = name
    this.age = age
    this.girlFriend = girlFriend
  }
}


@Entry
@Component
struct Index {
  // state 修饰的不能为空值
  // 支持object、class、string、number、boolean，enum
  // 不支持嵌套，如object 内的object，数组中的object发生变化时
  @State message: string = 'Hello World'
  @State jackMan: Person = new Person('Jack', 21, new Person('Rose',23))

  inputController: TextInputController = new TextInputController()

  build() {
    Column({space: 6}){
      Text(this.message)
        .fontSize(30)
        .fontStyle(FontStyle.Italic)
        .fontWeight(FontWeight.Bold)
        .textAlign(TextAlign.Start)
        .maxLines(2)
        .textOverflow({overflow:TextOverflow.Ellipsis})
        .fontFamily('Arial')
        .fontColor('#36D')
        .onClick(() => {
          if (this.message === "Hello World") {
            this.message = "不欢迎"
          } else {
            this.message = "Hello World"
          }
        })

      Text("This is the text content of Text Component This is the text content of Text Component")
      Text("This is the text content of Text Component This is the text content of Text Component")
      Text("This is the text content of Text Component This is the text content of Text Component")
      Text("This is the text content of Text Component This is the text content of Text Component")

      Text("This is the text content of Text Component This is the text content of Text Component")
        .fontSize(30)
        .fontStyle(FontStyle.Italic)
        .fontWeight(FontWeight.Bold)
        .textAlign(TextAlign.Start)
        .maxLines(2)
        .textOverflow({overflow:TextOverflow.Ellipsis})
        .decoration({type: TextDecorationType.Underline, color: Color.Black})
        .fontFamily('Arial')
        .fontColor('#36D')

      Text(`${this.jackMan.name}` + " grilFriend is " +` ${this.jackMan.girlFriend.name}` + " : " +  `${this.jackMan.girlFriend.age}`)
        .fontSize(20)
        .fontWeight(FontWeight.Bold)
        .fontColor('#36D')

      TextInput({placeholder: "请输入手机号", controller: this.inputController})
        .maxLength(11)
        .type(InputType.Number)

      Button('修改光标位置')
        .onClick(()=> {
          this.inputController.caretPosition(2)
        })

      LoadingProgress()
        .color(Color.Blue)
        .height(60)
        .width(60)

      Button('进入商品列表')
        .type(ButtonType.Capsule)
        .onClick( () => {

          router.pushUrl({
            url: "pages/goods/goodsList",
            params: {
              title: "从首页进入",
              goodsId: '10101'
            }
          })
        }
        )
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
  }

  // ************* 生命周期 *************
  aboutToAppear() {
    console.log("开始展示")

  }

  onPageShow(){
    console.log("页面开始展示")
  }
  onBackPress() {
    console.log("点击返回")
    // 默认false，调用系统返回
    return false
  }
  onPageHide() {
    console.log('页面隐藏')
  }

  aboutToDisappear() {
    console.log("即将销毁")
  }

}