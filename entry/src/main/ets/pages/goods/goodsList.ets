
import {GoodsModel} from '../goods/Model/goodsModel'
import {GoodsCell} from '../goods/View/goodsCell'


// @Styles function fillScreen() {
//   .width('100%')
//   .height('100%')
//   .padding(20)
// }


@Entry
@Component
struct goodList {

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

  build() {

    Column() {
      Header({title: '商品列表'})

      List({space: 8}) {
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
      .width('100%')
      .layoutWeight(1)// 约束的权重
    }
  }
}

@Component
struct Header {

  private title: ResourceStr

  build() {
    Row(){
      Image($r('app.media.base_nav_back_icon'))
        .width(40)
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

