[鸿蒙官方文档](https://developer.harmonyos.com/)

#### 基础代码

装饰器：用于装饰类结构、方法、变量
	@Component：编辑自定义组件
	@Entry：标记当前组件为入口组件
	@State：标记该变量为状态变量，值变化时会触发UI刷新
	
struct Index 自定义组件：可复用的UI单元
build()：UI描述，其内部以声明式方式描述UI结构
Row()：容器组件，用来完成页面布局
Text()：自带样式和功能的页面元素
. fontSize
. fontWeight 属性方法，设置组件的UI样式



@Entry
@Component
struct Index {
  @State message: string = 'Hello Worldadfj'

  @State times: number = 0

  build() {
    Row() {
      Column() {
        Text(this.message)
          .fontSize(30)
          .fontWeight(FontWeight.Bold)
          . onClick(() => {
          	// 事件方法
          })
        Button('字符串'+this.times)
          .backgroundColor('#3DDDdd')
          .onClick( () => this.times++ )
      }
      .width('100%')
    }
    .height('100%')
  }
}






#### 状态管理器

##### @State
在声明UI中，以状态驱动视图更新，驱动视图更新的数据（被装饰器标记的变量）

@State 装饰器标记的变量必须要初始化、不能为空值

@State 支持 Object、class、string、number、boolean、enum类型以及这些类型的数组

嵌套类型以及数组中的对象属性无法触发视图更新


##### @Prop & @Link & @Watch
当父子组件进行数据同步时使用

两者的差异
@Prop： 单向同步，仅支持string、number、boolean、enum，不可以是数组、any

@Link：双向同步，和State类似，支持string、number、boolean、enum、object、class以及他们的数组

![状态管理.png](https://p9-juejin.byteimg.com/tos-cn-i-k3u1fbpfcp/f2ae857f9bb84bf08e4e27e5caad861e~tplv-k3u1fbpfcp-jj-mark:0:0:0:0:q75.image#?w=1270&h=665&s=226616&e=png&b=010101)

@Watch: 监听状态变化
@Link @Watch('onClickIndexChange') clickIndex: number;

onClickIndexChange() {
...
}

##### @Provide & @Consume

可以跨组件提供类似 @State 和 @Link 的双向同步

#####  @ObjectLink & Observed

用于涉及嵌套对象或数组元素为对象的场景中进行双向数据同步



