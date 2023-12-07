
import { TaskHeader, TaskList } from '../task/View/taskItem'

@Styles function FillScreenStyle() {
  .width('100%')
  .height('100%')
  .backgroundColor("#F1F2F3")
}

export class StatInfoModel {
  totalTask: number = 0
  finishTask: number = 0
}

@Entry
@Component
struct taskPage {
  // @State tasks: TaskModel[] = []
  // @State statInfo: StatInfoModel = new StatInfoModel()
  // Provide & Consume 不需要显性的传参，由于会有额外的消耗，非必要，跨组件的时候还是使用prop和link
  @Provide statInfo: StatInfoModel = new StatInfoModel()

  build() {
    Column({space: 10}) {
      // 任务进度
      TaskHeader()
      // 任务列表
      TaskList()

    }
    .FillScreenStyle()

  }


}