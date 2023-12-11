import Prompt from '@system.prompt'

@Entry
@Component
struct animationPage {

  @State imgWidth: number = 200;
  @State img_y: number = 20;

  build() {
    Column() {

      Row() {
        Image($r('app.media.pic3'))
          .width(this.imgWidth)
          .position( {x: 40, y: this.img_y})
          .animation({
            duration: 2000,
            tempo: 2.0,
            delay: 400,
            curve: Curve.Linear,
            playMode: PlayMode.Alternate,
            iterations: 1,//-1 表示无限次播放
            onFinish: () => {
              Prompt.showToast({ message:"动画播放结束！！！" })
            }
          })
      }
      .width('100%')
      .height(300)
      .justifyContent(FlexAlign.Center)

      Button('动画播放')
        .onClick( ()=> {
          if (this.imgWidth === 300) {
            this.imgWidth = 200
            this.img_y = 20
          } else {
            this.imgWidth = 300
            this.img_y = 100
          }
        })

    }
    .width('100%')
    .height('100%')
  }
}
