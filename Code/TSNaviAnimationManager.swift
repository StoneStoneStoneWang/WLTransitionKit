//
//  TSNaviAnimationManager.swift
//  TSTransitionKit_SwiftDemo
//
//  Created by three stone 王 on 2018/11/20.
//  Copyright © 2018年 three stone 王. All rights reserved.
//

import UIKit
import TSToolKit_Swift
public protocol TSViewControllerPushAnimationDelegate: NSObjectProtocol {
    
    func ts_prefersNavigationBarHidden() -> Bool
    
    func ts_prefersTabbarHidden() -> Bool
    
    var interactivePopTransition: UIPercentDrivenInteractiveTransition? { set get }
    
    var ts_naviChildViewControllersCount: Int { get }
    
    var ts_tabbarController: UITabBarController? { get }
    
    var ts_naviController: UINavigationController? { get }
    
    var ts_contentView: UIView { get }
}

public class TSNaviAnimationManager: NSObject {
    
    static let shared: TSNaviAnimationManager = TSNaviAnimationManager()
    
    private override init() { }
    
    fileprivate var viewControllersConfigs: Array<TSNaviAnimationConfig> = []
}

extension TSNaviAnimationManager {
    
    open func startPushFrom(_ from: UIViewController) {
        
        let naviController = from.ts_naviController
        
        guard let navi = naviController else {
            
            return
        }
        
        let tab = from.ts_tabbarController
        
        let fromConfig = TSNaviAnimationConfig()
        
        fromConfig.vc = from
        
        fromConfig.naviImage = UIImage.viewTransformToImage(view: navi.navigationBar)
        
        fromConfig.prefersNavigationBarHidden = from.ts_prefersNavigationBarHidden()
        
        fromConfig.tabbarImage =  tab == nil ? nil : UIImage.viewTransformToImage(view: tab!.tabBar)
        
        fromConfig.prefersTabbarHidden = from.ts_prefersTabbarHidden()
        
        fromConfig.statusStyle = navi.navigationBar.barStyle
        
        fromConfig.statusTintColor = navi.navigationBar.barTintColor ?? .clear
        
        printLog(message: fromConfig.statusBarFrame)
        
        var replaceConfig: TSNaviAnimationConfig?
        
        var idx: Int = 0
        
        for item in viewControllersConfigs {
            
            if item.vc! == from {
                
                replaceConfig = item
                
                idx += 1
                
                break
            }
            
            idx += 1
        }
        
        if let replaceConfig = replaceConfig {
            
            viewControllersConfigs.replaceSubrange(0..<1, with: [replaceConfig])
        } else {
            
            viewControllersConfigs.append(fromConfig)
        }
    }
    open func endPushTo(_ to: UIViewController) {
        
        let naviController = to.ts_naviController
        
        guard let navi = naviController else {
            
            return
        }
        
        let tab = to.ts_tabbarController
        
        let toConfig = TSNaviAnimationConfig()
        
        toConfig.vc = to
        
        toConfig.naviImage = UIImage.viewTransformToImage(view: navi.navigationBar)
        
        toConfig.prefersNavigationBarHidden = to.ts_prefersNavigationBarHidden()
        
        toConfig.tabbarImage =  tab == nil ? nil : UIImage.viewTransformToImage(view: tab!.tabBar)
        
        toConfig.prefersTabbarHidden = to.ts_prefersTabbarHidden()
        
        toConfig.statusStyle = navi.navigationBar.barStyle
        
        toConfig.statusTintColor = navi.navigationBar.barTintColor ?? .clear
        
        viewControllersConfigs.append(toConfig)
        
    }
    open func startPopFrom(_ from: UIViewController) {
        
        let naviController = from.ts_naviController
        
        guard let navi = naviController else {
            
            return
        }
        
        let tab = from.ts_tabbarController
        
        let fromConfig = TSNaviAnimationConfig()
        
        fromConfig.vc = from
        
        fromConfig.naviImage = UIImage.viewTransformToImage(view: navi.navigationBar)
        
        fromConfig.prefersNavigationBarHidden = from.ts_prefersNavigationBarHidden()
        
        fromConfig.tabbarImage =  tab == nil ? nil : UIImage.viewTransformToImage(view: tab!.tabBar)
        
        fromConfig.prefersTabbarHidden = from.ts_prefersTabbarHidden()
        
        fromConfig.statusStyle = navi.navigationBar.barStyle
        
        printLog(message: navi.navigationBar.barTintColor)
        
        fromConfig.statusTintColor = navi.navigationBar.barTintColor ?? .clear
        
        var replaceConfig: TSNaviAnimationConfig?
        
        var idx: Int = 0
        
        for item in viewControllersConfigs {
            
            if item.vc! == from {
                
                replaceConfig = item
                
                break
            }
            
            idx += 1
        }
        
        if let replaceConfig = replaceConfig {
            
            viewControllersConfigs.replaceSubrange(idx..<idx+1, with: [replaceConfig])
        }
        
    }
    open func endPopFrom(_ from: UIViewController) {
        
        let fromConfig = TSNaviAnimationConfig()
        
        fromConfig.vc = from
        
        var removeConfig: TSNaviAnimationConfig?
        
        var idx: Int = 0
        
        for item in viewControllersConfigs {
            
            if item.vc! == from {
                
                removeConfig = item
                
                break
            }
            
            idx += 1
        }
        
        if let _ = removeConfig {
            
            viewControllersConfigs.remove(at: idx)
        }
        
        if viewControllersConfigs.count == 1 {
            
            removeAllConfigs()
        }
    }
    
    open func removeAllConfigs() {
        
        viewControllersConfigs.removeAll()
    }
    
    open func getConfigThrough(_ vc: UIViewController) -> TSNaviAnimationConfig? {
        
        var config: TSNaviAnimationConfig?
        
        for item in viewControllersConfigs {
            
            if item.vc! == vc {
                
                config = item
                
                break
            }
        }
        
        return config
    }
}
extension TSNaviAnimationManager {
    
    public class TSNaviAnimationConfig {
        
        var naviImage: UIImage!
        /**
         naviFrame
         */
        var naviFrame: CGRect {
            
            return prefersNavigationBarHidden ? .zero : CGRect(x: 0, y: KISIPHONEX ? 44 : 20, width: TS_SCREEN_WIDTH, height: 44)
        }
        /**
         导航是否隐藏
         */
        var prefersNavigationBarHidden: Bool = false
        /**
         tabbarFrame
         */
        var tabbarFrame: CGRect {
            
            return prefersTabbarHidden ? .zero : CGRect(x: 0, y: TS_SCREEN_HEIGHT - (KISIPHONEX ? 84 : 49), width: TS_SCREEN_WIDTH, height: KISIPHONEX ? 84 : 49)
        }
        
        var tabbarImage: UIImage!
        /**
         tabbar 是否隐藏
         */
        var prefersTabbarHidden: Bool = false
        /**
         状态栏 样式
         */
        
        var statusBarFrame: CGRect {
            
            return prefersNavigationBarHidden ? .zero : CGRect(x: 0, y: 0, width: TS_SCREEN_WIDTH, height: KISIPHONEX ? 44 : 20)
        }
        
        var statusStyle: UIBarStyle = .default
        
        var statusTintColor: UIColor = .clear
        
        var vc: UIViewController!
    }
}
