//
//  UITabBarController+Orientation.swift
//  TSBaseViewController_Swift
//
//  Created by three stone 王 on 2018/11/20.
//  Copyright © 2018年 three stone 王. All rights reserved.
//

import Foundation
import UIKit

// 朝向
extension UITabBarController {
    // 支持自动旋转
    open override var shouldAutorotate: Bool {
        
        guard let selectedViewController = selectedViewController  else {
            
            return false
        }
        return selectedViewController.shouldAutorotate
    }
    // 支持方向
    open override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        
        guard let selectedViewController = selectedViewController  else {
            
            return .portrait
        }
        return selectedViewController.supportedInterfaceOrientations
    }
    // 初始化朝向
    open override var preferredInterfaceOrientationForPresentation: UIInterfaceOrientation  {
        guard let selectedViewController = selectedViewController  else {
            
            return .portrait
        }
        return selectedViewController.preferredInterfaceOrientationForPresentation
    }
}
