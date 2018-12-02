# WLTransitionKit

## 这只是我想要的效果  参考的是今日头条的转场效果 

## 百度搜索得到的基本都是view的截图然后做转场动画 这种方式会导致from界面不刷新 比如tableview的点击效果在返回时才消失

## 更改了几个版本 都是有bug存在的 在放弃之前找到目前这种方式。还有一种方式是自定义导航栏这里不表

## 想做的是无入侵式开发 用到了运行时扩展

1.pod 'WLTransitionKit'

2.在appdelegate UIViewController.popPanClassInit()

3.实现原理是基于响应者链 和 视图层级
视图层级  window -> tabbar.view -> navi.view -> vc.view 转场时是有个container 
运行时添加属性 替换方法 viewdidload 和viewdidappear

4.如果是没有导航的界面 请在viewdidappear里设置
public override func viewDidAppear(_ animated: Bool) {
super.viewDidAppear(animated)

navigationController?.setNavigationBarHidden(true, animated: false)
}
并在vc中实现两个继承方法
@objc open func WL_prefersNavigationBarHidden() -> Bool {

return false
}

@objc open func WL_prefersTabbarHidden() -> Bool {

return true
}

5.有导航的页面 在哪里viewwill设置  navigationController?.setNavigationBarHidden(false, animated: false)
