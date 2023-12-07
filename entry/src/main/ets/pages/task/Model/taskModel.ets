
@Observed
export class TaskModel {
  static  id: number = 1
  name: string = `任务${TaskModel.id++}`
  finished: boolean =  false
}

