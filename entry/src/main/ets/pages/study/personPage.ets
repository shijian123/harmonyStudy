
@Observed
class Person{
  name: string
  age: number
  friend: Person

  constructor(name: string, age: number, friend?: Person) {
    this.name = name
    this.age = age
    this.friend = friend
  }
}

@Component
struct Child {
  @ObjectLink person: Person

  build() {
    Column(){
      Text(`${this.person.name} : ${this.person.age}`)
    }
  }
}

@Entry
@Component
struct Parent {
  @State jackMan: Person = new Person('Jack', 21, new Person('Rose', 23))
  @State girlFriends: Person[] = [
    new Person('萝丝', 23),
    new Person('露西',20)
  ]
  build() {
    Column(){
      Child({person: this.jackMan.friend})
        .onClick( () => this.jackMan.friend.age++)

      Text('====== 女友列表 ======')
        .margin({top:20, bottom: 20})

      ForEach(
        this.girlFriends,
        (item: Person) => {
          Child({person: item}).onClick(() => item.age++)
        }
      )
    }
    .width('100%')
    .height('100%')
    .margin({top:40})
  }
}

