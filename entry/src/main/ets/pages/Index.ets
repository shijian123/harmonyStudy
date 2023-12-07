// @ts-nocheck
import thermal from '@ohos.thermal'
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

  build() {
    Column(){
      Text(` ${this.jackMan.name}` + " is " + `${this.jackMan.age}`)
        .height(30)
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

      Text(`${this.jackMan.name}` + " grilFriend is " +` ${this.jackMan.girlFriend.name}` + " : " +  `${this.jackMan.girlFriend.age}`)
        .fontSize(20)
        .fontWeight(FontWeight.Bold)
        .fontColor('#36D')
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
  }
}