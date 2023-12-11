
import http from '@ohos.net.http';
import router from '@ohos.router'

@Entry
@Component
struct httpRequestPage {

  @State dataStr: string = "网络数据"

  onPageShow(){
    let httpRequest = http.createHttp()
    let urlStr: string = "http://service.aibizhi.adesk.com/v1/lightwp/vertical?adult=0&appid=com.lovebizhi.ipad&appver=5.1&appvercode=64&channel=ipicture&first=1&lan=zh-Hans-CN&limit=30&order=mixin&skip=0&sys_model=iPhone&sys_name=iOS&sys_ver=11.3"
    let promise_get = httpRequest.request(
      urlStr,
      {
        // 请求方式
        method: http.RequestMethod.GET,
        // 可选，默认为60s
        connectTimeout: 60000,
        // 可选，默认为60s
        readTimeout: 60000,
        // 开发者根据自身业务需要添加header字段
        header: {
          'Content-Type': 'application/json'
        }
      }
    )

    promise_get.then((data) => {
      if (data.responseCode === http.ResponseCode.OK) {
        console.info('******* Result:' + data.result);
        console.info('******* code:' + data.responseCode);
        this.dataStr = "网络数据: " + data.result
      }
    }).catch(err => {
      console.info('******* Error:' + JSON.stringify(err));
    })

    let url = "https://EXAMPLE_URL";
    let promise_post = httpRequest.request(
      // 请求url地址
      url,
      {
        // 请求方式
        method: http.RequestMethod.POST,
        // 请求的额外数据。
        extraData: {
          "param1": "value1",
          "param2": "value2",
        },
        // 可选，默认为60s
        connectTimeout: 60000,
        // 可选，默认为60s
        readTimeout: 60000,
        // 开发者根据自身业务需要添加header字段
        header: {
          'Content-Type': 'application/json'
        }
      });
    promise_get.then((data) => {
      if (data.responseCode === http.ResponseCode.OK) {
        console.info('******* Result:' + data.result);
        console.info('******* code:' + data.responseCode);
      }
    }).catch(err => {
      console.info('******* Error:' + JSON.stringify(err));
    })



  }

  build() {
    Column() {
      Text(this.dataStr)
    }
    .width('100%')
    .height('100%')
    .backgroundColor(Color.Pink)
  }
}
