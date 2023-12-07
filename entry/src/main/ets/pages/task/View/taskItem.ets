
import { TaskModel } from '../Model/taskModel'
import { StatInfoModel } from '../taskPage'

// 任务进度Header卡片
@Component
export struct TaskHeader {
  // 单向同步，仅支持string、number、boolean、enum
  // 不可以是数组、any
  // @Prop totalTask: number
  // @Prop finishTask: number

  @Consume statInfo: StatInfoModel

  build() {
    Row(){
      Text('任务进度：')
        .fontSize(30)
        .fontWeight(FontWeight.Bold)
      Stack() {
        Progress({
          value: this.statInfo.finishTask,
          total: this.statInfo.totalTask,
          type: ProgressType.Ring
        })
        Row(){
          Text(this.statInfo.finishTask.toString())
            .fontSize(21)
            .fontColor("#36D")
          Text(' / ' + this.statInfo.totalTask.toString())
            .fontSize(21)
            .fontColor("#36D")
        }
      }
    }
    .taskCardStyle()
    .margin({top: 20, bottom: 20})
    .justifyContent(FlexAlign.SpaceEvenly)
  }
}

// 任务卡片
@Component
export struct TaskList {

  @State tasks: TaskModel[] = []
  // 双向同步，和State类似，支持string、number、boolean、enum、object、class以及他们的数组
  // @Link totalTask: number
  // @Link finishTask: number
  // @Link statInfo: StatInfoModel
  @Consume statInfo: StatInfoModel

  handleTaskChange() {
    this.statInfo.totalTask = this.tasks.length
    this.statInfo.finishTask = this.tasks.filter(item => item.finished).length
  }

  build() {

    Column(){
      Button('新增任务')
        .width(200)
        .onClick( () => {
          this.tasks.push(new TaskModel())
          this.statInfo.totalTask = this.tasks.length
        })
      .margin({bottom:20})

      List(){
        ForEach(
          this.tasks,
          (item: TaskModel, index) => {
            ListItem(){
              // 注意方法传递时需要保证this不会变为子类的this，需要设置 bind（this）
              TaskCell({item: item, onTaskChangeClosure: this.handleTaskChange.bind(this)})
            }
            .swipeAction({end: this.DeleteBtn(index)})
          }
        )
      }
      .width('100%')
      .layoutWeight(1)
      .alignListItem(ListItemAlign.Center)
    }
  }

  @Builder DeleteBtn(index: number) {
    Button('Delete')
      .type(ButtonType.Normal)
      .backgroundColor(Color.Red)
      .height(60)
      .onClick( ()=> {
        this.tasks.splice(index, 1)
        this.handleTaskChange()
      })
  }
}


// 任务卡片
@Component
export struct TaskCell {

  @ObjectLink item: TaskModel
  // 回调
  onTaskChangeClosure: () => void

  build() {
    Row(){
      if (this.item.finished) {
        Text(this.item.name)
          .fontSize(20)
          .finishedTaskStyle()
      } else {
        Text(this.item.name)
          .fontSize(20)
      }

      Checkbox()
        .select(this.item.finished)
        .onChange(val => {
          // 1.更新当前任务状态
          this.item.finished = val
          // 2.更新已完成任务数量
          this.onTaskChangeClosure()
        })
    }
    .margin({bottom: 20})
    .taskCardStyle()
    .justifyContent(FlexAlign.SpaceBetween)
  }
}


// 统一的卡片样式
@Styles function taskCardStyle() {
  .width('95%')
  .padding(20)
  .backgroundColor(Color.White)
  .borderRadius(15)
  .shadow({radius: 6, color: "#1f000000", offsetX: 2, offsetY: 4})
}

// 任务完成样式
@Extend(Text) function finishedTaskStyle() {
  .decoration({type: TextDecorationType.LineThrough})
  .fontColor('#B1B2b3')
}