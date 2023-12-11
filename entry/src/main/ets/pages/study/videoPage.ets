

import mediaLibrary from '@ohos.multimedia.mediaLibrary';


@Entry
@Component
struct VideoPage {
  private soure: Resource = $rawfile('再回首漫长的季节.mp4')
  private previewUrl: Resource = $r('app.media.pic3')

  build(){
    Column(){
      // 不支持 preview
      Video({
        src: this.soure,
        previewUri: this.previewUrl
      })
        .objectFit(ImageFit.Auto)
        .autoPlay(true)
        .loop(false)
        .width('100%')
        .width('100%')
    }
    .width('100%')
    .width('100%')
  }



}