[TypeScript 教程](https://wangdoc.com/typescript/)阮一峰著

[官方文档](https://www.typescriptlang.org/)

官方有 playground 可以在线测试代码

ts 是在 js 的基础上加入了静态类型检查功能，因此每个变量都有一个固定的数据类型


变量声明、条件控制、循环迭代、函数、类和接口、模块开发


#### 基础数据类型

let msg: string = 'hello world'
let age: number = 21
let finished: boolean = true

// 两个不确定的类型，any(不确定类型)和union(联合类型，可以多个指定类型中的一种)
let a: any = 'jack'
let u: string|number|boolean = 'rose'

// object 对象
let obj= {name:'jack', age: 21}
console.log(obj.name)
console.log(obj['name'])

// 数组
let names: Array<string> = ['jack', 'tom']
let ages: number[] = [21,18]
console.log(ages[0])



#### 条件判断

let num: number = 21

if (num > 0) {
    console.log("正数")
} else if (num < 0) {
    console.log("负数")
} else {
        console.log("为0")
}

let grade = "A"
switch (grade) {
    case 'A': {
        console.log('优秀')
        break
    }
    case 'B': {
        console.log('良好')
        break
    }
    default: {
        console.log('未定义')
        break
    }
}


#### 循环判断

for (let i = 0; i<3; i++) {
    console.log('点赞'+i +'次')
}

let names1 = ['jack', 'tom']
for (let num in names1) {
    console.log(names[num] + ': 点赞')
} 

for (let name of names1) {
    console.log(name + ': 点赞')
} 



#### 函数

// 无返回值
function sayHello(name: string){
        console.log('你好，'+name)
}
sayHello('jack')


// 有返回值
function sum(x:number, y: number): number {
    return x + y
}
let result = sum(21,18)
console.log('21 + 18 = '+ result)


// 箭头函数
let sayHi = (name: string) => {
    console.log('你好，' + name)
}
sayHi('Tom')


// 可选参数
function sayHello1(name?: string): void {
    name = name ? name : "陌生人"
    console.log('你好，'+name)
}
sayHello1()


// 默认参数
function sayHello2(name: string = '陌生人'): void {
    console.log('你好，'+name)
}
sayHello2()



#### 面向对象

enum Msg {
    HI = 'hi',
    HELLO = 'hello'
}

// 在类或者接口内定义的方法，不可以添加function

// 定义接口，抽象方法接收枚举参数
interface A {
    say(msg: Msg): void
}

// 实现接口
class B implements A {
    say(msg: Msg): void {
        console.log(msg + ', I am B')
    }
}

// 初始化对象，必须有new
let a: A = new B()
a.say(Msg.HELLO)



// 定义矩形
class Rectangle {
	// 定义私有变量
    private width: number
    private length: number

	// 构造函数，没有方法名
    constructor(width: number, length: number) {
        this.width = width
        this.length = length
    }
	
	// 成员方法，public可省略
    public area(): number {
        return this.width * this.length
    }

}

// 定义正方形
class Square extends Rectangle {
    constructor(side: number) {
    	// 调用父类构造
       super(side, side)
    }
}

let squareM = new Square(10)
console.log('正方形面积为：'+squareM.area())


#### 模块开发

通用功能抽离到单独的ts文件中，每个文件都是一个模块（module），模块可以互相加载，提高代码复用性


定义一个 rectangle.ts 文件

// 定义 Rectangle 类 并通过export 导出
export class Rectangle {
    // 定义成员变量
    public width: number
    public length: number

	// 构造函数，没有方法名
    constructor(width: number, length: number) {
        this.width = width
        this.length = length
    }
}

// 定义工具方法，求矩形面积，并通过export 导出
export function area(rec: Rectangle): number {
    return rec.width * rec.length
}


定义一个 index.ts 文件

// 如果只导入一个，可省略大括号
import {Rectangle, area} from '../rectangle'

// 创建 Rectangle 对象
let r = new Rectangle(10, 20)
// 调用 area 方法
console.log('面积：'+area(r))










