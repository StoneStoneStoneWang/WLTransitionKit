//
//  TSNaviAnimation.swift
//  TSTransitionKit_SwiftDemo
//
//  Created by three stone 王 on 2018/11/20.
//  Copyright © 2018年 three stone 王. All rights reserved.
//

import UIKit
import TSToolKit_Swift
// 前言 发现在iOS7系统以上导航栏多了一个translucent属性。这个属性就是设置导航栏是否具有透明度这个功能。
// [[UINavigationBar appearance] setTranslucent:NO];
// self.navigationController.navigationBar.translucent = NO;
// 当translucent = YES，controller中self.view的原点是从导航栏左上角开始计算
// 当translucent = NO，controller中self.view的原点是从导航栏左下角开始计算

// v 1.0.5 之前是有bug存在的 就是转场的时候 由于是屏幕截图 回导致一些效果 比如点击按钮的高亮状态 不是立即消失

// 所以在v 1.0.6之后 修复这个bug
// 1.含有tabbar的一级界面跳转到二级界面 或 二级跳转到三级。。。
// 2.针对containerview 和fromview 重新布局
// 3.现在已有的网上开源的专场 会有些体验上的不好的地方
// 4.参考已成熟应用 如今日头条

// 之后会加入其他的 push pop转场

public class TSNaviAnimation: TSBaseAnimation {
    
    open override func push(_ transitionContext: UIViewControllerContextTransitioning) {
        
        let from = transitionContext.viewController(forKey: .from)!
        
        let to = transitionContext.viewController(forKey: .to)!
        
        printLog(message: from)
        
        printLog(message: to)
        
        let manager = TSNaviAnimationManager.shared
        
        if from.ts_naviChildViewControllersCount == 2 {
            
            manager.removeAllConfigs()
        }
        
        manager.startPushFrom(from)
        
        let fromConfig = manager.getConfigThrough(from)
        
        let duration = transitionDuration(using: transitionContext)
        
        let fromBaseView = UIView(frame: TS_SCREEN_BOUNDS)
        
        fromBaseView.addSubview(from.ts_contentView)
        
        let topView = configTopView(config: fromConfig!)
        
        fromBaseView.addSubview(topView)
        
        let tabbarImageView = UIImageView(image: fromConfig!.tabbarImage)
        
        tabbarImageView.frame = fromConfig!.tabbarFrame
        
        fromBaseView.addSubview(tabbarImageView)
        
        from.ts_tabbarController?.tabBar.isHidden = true
        
        let cover = UIView(frame: TS_SCREEN_BOUNDS)
        
        cover.backgroundColor = .black
        
        cover.alpha = 0
        
        let container = transitionContext.containerView
        
        container.addSubview(to.ts_contentView)
        
        to.ts_naviController!.view.superview!.insertSubview(fromBaseView, belowSubview: to.ts_naviController!.view)
        
        to.ts_naviController!.view.superview!.insertSubview(cover, belowSubview: to.ts_naviController!.view)
        
        to.ts_naviController!.view.transform = CGAffineTransform.init(translationX: TS_SCREEN_WIDTH, y: 0)
        
        UIView.animate(withDuration: duration, delay: 0, usingSpringWithDamping: 1.0, initialSpringVelocity: 0, options: .curveLinear, animations: {
            
            fromBaseView.transform = CGAffineTransform.init(scaleX: 0.95, y: 0.95)
            
            cover.alpha = 0.3
            
            to.ts_naviController!.view.transform = CGAffineTransform.identity
            
        }) { (isFinished) in
            
            manager.endPushTo(to)
            
            topView.removeFromSuperview()
            
            fromBaseView.removeFromSuperview()
            
            transitionContext.completeTransition(true)
        }
    }
    
    open override func pop(_ transitionContext: UIViewControllerContextTransitioning) {
        
        let from = transitionContext.viewController(forKey: .from)!
        
        let to = transitionContext.viewController(forKey: .to)!
        
        let manager = TSNaviAnimationManager.shared
        
        manager.startPopFrom(from)
        
        let fromConfig = manager.getConfigThrough(from)
        
        let toConfig = manager.getConfigThrough(to)
        
        let duration = transitionDuration(using: transitionContext)
        
        let toBaseView = UIView(frame: TS_SCREEN_BOUNDS)
        
        toBaseView.addSubview(to.view)
        
        let topTopView = configTopView(config: toConfig!)
        
        let tabbarImageView = UIImageView(image: toConfig!.tabbarImage)
        
        tabbarImageView.frame = toConfig!.tabbarFrame
        
        toBaseView.addSubview(topTopView)
        
        toBaseView.addSubview(tabbarImageView)
        
        to.ts_naviController!.isNavigationBarHidden = true
        
        toBaseView.transform = CGAffineTransform.init(scaleX: 0.95, y: 0.95)
        
        let cover = UIView(frame: TS_SCREEN_BOUNDS)
        
        cover.backgroundColor = .black
        
        cover.alpha = 0
        
        let container = transitionContext.containerView
        
        container.addSubview(from.ts_contentView)
        
        from.ts_naviController!.view.superview!.insertSubview(toBaseView, belowSubview: from.ts_naviController!.view)
        
        from.ts_naviController!.view.superview!.insertSubview(cover, belowSubview: from.ts_naviController!.view)
        
        let fromTopView = configTopView(config: fromConfig!)
        
        from.ts_naviController!.view.addSubview(fromTopView)
        
        from.ts_naviController!.view.transform = CGAffineTransform.identity
        
        to.ts_tabbarController?.tabBar.isHidden = true
        
        to.ts_naviController!.isNavigationBarHidden = true
        
        if let _ = from.interactivePopTransition {
            
            UIView.animate(withDuration: duration, delay: 0, options: .curveLinear, animations: {
                
                from.ts_naviController!.view.transform = CGAffineTransform.init(translationX: TS_SCREEN_WIDTH, y: 0)
                
                cover.alpha = 0
                
                toBaseView.transform = CGAffineTransform.identity
            }) { (isFinished) in
                
                if transitionContext.transitionWasCancelled {
                    
                    from.ts_naviController?.isNavigationBarHidden = from.ts_prefersNavigationBarHidden()
                } else {
                    
                    from.ts_contentView.removeFromSuperview()
                    
                    to.ts_naviController!.isNavigationBarHidden = to.ts_prefersNavigationBarHidden()
                    
                    to.ts_contentView.removeFromSuperview()
                    
                    container.addSubview(to.ts_contentView)
                    
                    manager.endPopFrom(from)
                    
                    to.tabBarController?.tabBar.isHidden = to.ts_prefersTabbarHidden()
                }
                
                to.ts_naviController!.view.transform = CGAffineTransform.identity
                
                toBaseView.removeFromSuperview()
                
                fromTopView.removeFromSuperview()
                
                cover.removeFromSuperview()
                
                transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
            }
        } else {
            
            UIView.animate(withDuration: duration, delay: 0, usingSpringWithDamping: 1.0, initialSpringVelocity: 0, options: .curveLinear, animations: {
                
                from.ts_naviController!.view.transform = CGAffineTransform.init(translationX: TS_SCREEN_WIDTH, y: 0)
                
                cover.alpha = 0
                
                toBaseView.transform = CGAffineTransform.identity
                
            }) { (isFinished) in
                
                from.ts_contentView.removeFromSuperview()
                
                to.ts_naviController!.view.transform = CGAffineTransform.identity
                
                to.ts_naviController!.isNavigationBarHidden = to.ts_prefersNavigationBarHidden()
                
                to.ts_contentView.removeFromSuperview()
                
                container.addSubview(to.ts_contentView)
                
                toBaseView.removeFromSuperview()
                
                fromTopView.removeFromSuperview()
                
                transitionContext.completeTransition(true)
                
                to.tabBarController?.tabBar.isHidden = to.ts_prefersTabbarHidden()
                
                manager.endPopFrom(from)
            }
        }
    }
    
    open func configTopView(config: TSNaviAnimationManager.TSNaviAnimationConfig) -> UIView {
        
        let topView = UIView(frame: CGRect(x: 0, y: 0, width: TS_SCREEN_WIDTH, height: config.naviFrame.height + config.statusBarFrame.height))
        
        let naviImageView = UIImageView(image: config.naviImage)
        
        naviImageView.frame = config.naviFrame
        
        let statusBar = UINavigationBar(frame: config.statusBarFrame)
        
        statusBar.barStyle = config.statusStyle
        
        statusBar.barTintColor = config.statusTintColor
        
        topView.addSubview(statusBar)
        
        topView.addSubview(naviImageView)
        
        statusBar.isHidden = config.prefersNavigationBarHidden
        
        return topView
    }
}
extension TSNaviAnimation {
    
    @objc override public func popCancled() {
        
        
    }
}
