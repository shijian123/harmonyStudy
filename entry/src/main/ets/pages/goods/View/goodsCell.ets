
import {GoodsModel} from '../Model/goodsModel'


// @Styles 公共属性，
// @Styles function goodsRedText() {
//   .width('100%')
// }

// @Extend 设置特定组件属性
// 自定义装饰器，放到类中去除 function
@Extend(Text) function goodsRedText() {
  .fontSize(16)
  .fontColor('#F36')
}

@Extend(Text) function goodsGrayText() {
  .fontSize(16)
  .fontColor('#ccc')
}

@Component
export struct GoodsCell {
  private item: GoodsModel
  build() {
    Row({space: 4}){
      Image(this.item.image)
        .width(100)
      .onClick(()=> {

      })
      Column({space: 4}){
        Text(this.item.name)
          .fontSize(20)
          .fontWeight(FontWeight.Bold)
        if (this.item.discount) {
          Text('原价：￥' + this.item.price)
            .goodsGrayText()
            .decoration({type: TextDecorationType.LineThrough})
          Text('折扣价：￥'+(this.item.price - this.item.discount))
            .goodsRedText()
          Text('优惠：￥'+this.item.discount)
            .goodsRedText()
        } else {
          Text('￥'+ this.item.price)
            .goodsRedText()
        }
      }
      .width('100%')
      .alignItems(HorizontalAlign.Start)
    }
  }
}

