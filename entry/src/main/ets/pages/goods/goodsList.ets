
import router from '@ohos.router'
import {GoodsModel} from '../goods/Model/goodsModel'
import {GoodsCell} from '../goods/View/goodsCell'


// @Styles function fillScreen() {
//   .width('100%')
//   .height('100%')
//   .padding(20)
// }


@Entry
@Component
export  struct goodList {

  private  dataList: Array<GoodsModel> = [
    new GoodsModel('华为Mate60', $r('app.media.pic3'), 6999),
    new GoodsModel('MateBookProX', $r('app.media.pic3'),10000, 2100),
    new GoodsModel('WatchGT4', $r('app.media.pic3'),1438, 120),
    new GoodsModel('Mate X5', $r('app.media.pic3'),12990),
    new GoodsModel('MateBookProX', $r('app.media.pic3'),10000, 2100),
    new GoodsModel('WatchGT4', $r('app.media.pic3'),1438, 120),
    new GoodsModel('Mate X5', $r('app.media.pic3'),12990),
    new GoodsModel('MateBookProX', $r('app.media.pic3'),10000, 2100),
    new GoodsModel('WatchGT4', $r('app.media.pic3'),1438, 120),
    new GoodsModel('Mate X5', $r('app.media.pic3'),12990),
    new GoodsModel('MateBookProX', $r('app.media.pic3'),10000, 2100),
    new GoodsModel('WatchGT4', $r('app.media.pic3'),1438, 120),
    new GoodsModel('Mate X5', $r('app.media.pic3'),12990),
  ]

  @State dataModel: object = router.getParams()

  build() {

    Column() {
      Header({title: '商品列表:id_' + this.dataModel?.["goodsId"]})

      List({space: 8, initialIndex: 1}) {
        ForEach(
          this.dataList,
          (item: GoodsModel) => {
            ListItem(){
              GoodsCell({item})
            }
            .backgroundColor("#FFF")
            .width('100%')
            .padding({left:16, right:16})
            .margin({bottom: 10})
          }
        )
      }
      .divider( {strokeWidth: 0.5, color: Color.Gray, startMargin: 16, endMargin: 16})
      .width('100%')
      .layoutWeight(1)// 约束的权重
      .onScrollIndex((firstIndex: number, lastIndex: number) => {
        console.info('first' + firstIndex)
        console.info('last' + lastIndex)
      })
      .onScroll((scrollOffset: number, scrollState: ScrollState) => {
        console.info('scrollOffset' + scrollOffset)
        console.info('scrollState' + scrollState)
      })
      .onReachStart(() => {
        console.info('onReachStart')
      })
      .onReachEnd(() => {
        console.info('onReachEnd')
      })
      .onScrollStop( ()=> {
        console.info('onScrollStop')
      })
    }
  }
}

@Component
struct Header {

  private title: ResourceStr

  build() {
    Row(){
      Image($r('app.media.base_nav_back_icon'))
        .width(24)
        .onClick( () => {
          router.back()
          // router.back({url:"pages/Index"})
        })
      Text(this.title)
        .fontSize(32)
        .fontWeight(FontWeight.Bold)
      Blank()
      Image($r('app.media.base_nav_refresh_icon'))
        .width(40)
    }
    .width('100%')
    .height(30)
    .margin({top: 20, left: 20, bottom: 20})
  }
}

