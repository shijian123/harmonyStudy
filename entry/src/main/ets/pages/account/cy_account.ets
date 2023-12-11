
import router from '@ohos.router';
@Entry
@Component
export struct CYAccountController {
  @State select: number = 2;
  private fruits: string[] = ['苹果', '橘子', '香蕉', '猕猴桃', '西瓜'];

  selectedDate: Date = new Date("2023-12-1")


  build(){
    Column({space:20}){

      Text('各类Study')
        .fontSize(30)
        .margin({top:20})

      Button('视频播放')
        .onClick( ()=> {
          router.pushUrl({url: "pages/study/videoPage"})
        })
      Button('web在线展示')
        .onClick( ()=> {
          router.pushUrl({
            url: "pages/study/webPage",
            params: {
              isLocal: false
            }
          })
        })
      Button('web本地展示')
        .onClick( ()=> {
          router.pushUrl({
            url: "pages/study/webPage",
            params: {
              isLocal: true
            }
          })
        })
      Button('网络数据请求')
        .onClick( ()=> {
          router.pushUrl({
            url: "pages/study/httpRequestPage"
          })
        })


    }
    .width('100%').height('100%').backgroundColor(Color.Pink)
  }
}