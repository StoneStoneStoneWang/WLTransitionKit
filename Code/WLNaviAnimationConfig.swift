//
//  WLNaviAnimationConfig.swift
//  TSTransitionKit_SwiftDemo
//
//  Created by three stone 王 on 2018/11/24.
//  Copyright © 2018年 three stone 王. All rights reserved.
//

import UIKit
import TSToolKit_Swift
// 在iOS7系统以上导航栏多了一个translucent属性。这个属性就是设置导航栏是否具有透明度这个功能。
// [[UINavigationBar appearance] setTranslucent:NO];
// self.navigationController.navigationBar.translucent = NO;
// 当translucent = YES，controller中self.view的原点是从导航栏左上角开始计算
// 当translucent = NO，controller中self.view的原点是从导航栏左下角开始计算

open class WLNaviAnimationConfig: NSObject {
    
    var naviImage: UIImage!
    /**
     naviFrame
     */
    var naviFrame: CGRect {
        
        return prefersNavigationBarHidden ? .zero : CGRect(x: 0, y: KISIPHONEX ? 44 : 20, width: WL_SCREEN_WIDTH, height: 44)
    }
    /**
     导航是否隐藏
     */
    var prefersNavigationBarHidden: Bool = false
    /**
     tabbarFrame
     */
    var tabbarFrame: CGRect {
        
        return prefersTabbarHidden ? .zero : CGRect(x: 0, y: WL_SCREEN_HEIGHT - (KISIPHONEX ? 84 : 49), width: WL_SCREEN_WIDTH, height: KISIPHONEX ? 84 : 49)
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
        
        return prefersNavigationBarHidden ? .zero : CGRect(x: 0, y: 0, width: WL_SCREEN_WIDTH, height: KISIPHONEX ? 44 : 20)
    }
    
    var statusStyle: UIBarStyle = .default
    
    var statusTintColor: UIColor = .clear
    
    var isTranslucent: Bool = true
    
    var title: String = ""
}
