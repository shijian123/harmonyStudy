
import { goodList } from '../pages/goods/goodsList'
import { CYHomeController } from  '../pages/home/cy_home'
import { CYTrendController } from  '../pages/trend/cy_trend'
import { CYMessageController } from  '../pages/message/cy_message'
import { CYAccountController } from  '../pages/account/cy_account'

@Entry
@Component
struct MainTabs {
  private tabsCon: TabsController = new TabsController()

  @State currentIndex: number = 3

  @Builder TabBuilder(title: string, targetIndex: number, normalImg: Resource, selectedImg: Resource) {
    Column(){
      Image(this.currentIndex === targetIndex ? selectedImg: normalImg)
        .size({width: 30, height: 30})
      Text(title)
        .fontColor(this.currentIndex === targetIndex ? "#1698CE" : "#6B6B6B")
    }
    .onClick( () => {
      this.currentIndex = targetIndex
      this.tabsCon.changeIndex(targetIndex)
    })
  }

  build() {
    Column() {
      Tabs({ barPosition: BarPosition.Start, index: 3, controller: this.tabsCon }) {
        TabContent() {
          CYHomeController()
        }
        .tabBar(this.TabBuilder('home', 0, $r('app.media.tabbar_icon_home_d'), $r('app.media.tabbar_icon_home_s')))

        TabContent() {
          CYTrendController()
        }
        .tabBar(this.TabBuilder('trend', 1, $r('app.media.tabbar_trend_d'), $r('app.media.tabbar_trend_s')))

        TabContent() {
          CYMessageController()
        }
        .tabBar(this.TabBuilder('message', 2, $r('app.media.tabbar_message_d'), $r('app.media.tabbar_message_s')))

        TabContent() {
          CYAccountController()
        }
        .tabBar(this.TabBuilder('account', 3, $r('app.media.tabbar_account_d'), $r('app.media.tabbar_account_s')))
      }
      .barPosition(BarPosition.End)
      .barMode(BarMode.Fixed)
      .barWidth('100%') // 设置TabBar宽度
      .barHeight(60) // 设置TabBar高度
      .width('100%') // 设置Tabs组件宽度
      .height('100%') // 设置Tabs组件高度
      .backgroundColor(0xF5F5F5) // 设置Tabs组件背景颜色
      // .scrollable(false)
      .onChange( (index: number) => {
        this.currentIndex = index
      })
    }
    .width('100%')
    .height('100%')
  }
}