
import web_webview from '@ohos.web.webview'
import router from '@ohos.router'

@Entry
@Component
struct webPage {

  controller: web_webview.WebviewController = new web_webview.WebviewController()
  // isLocal boolean
  @State dataModel: object = router.getParams()

  build() {
    Column() {
      // 不支持 preview
      Web({
        src: this.dataModel["isLocal"] ? $rawfile("html_test.html") : "https://www.baidu.com",
        controller: this.controller
      })

        .javaScriptAccess(true)// 在Web组件中运行JavaScript
        .onPageEnd(e => {
          try {
            this.controller.runJavaScript('test()')
              .then(function (result) {
                console.log('result: ' +   result);
              })
              .catch(function (error) {
                console.error("error: " + error);
              })
            console.info('url: ', e.url);
          } catch (error) {
            console.error(`Errorcode: ${error.code}, Message: ${error.message}`);
          }
        })
    }
    .width('100%')
    .height('100%')
    .backgroundColor(Color.Pink)
  }
}
