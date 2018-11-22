//
//  UINavigationController+Orientation.swift
//  TSBaseViewController_Swift
//
//  Created by three stone 王 on 2018/11/20.
//  Copyright © 2018年 three stone 王. All rights reserved.
//

import Foundation
import UIKit

// 朝向
extension UINavigationController {
    // 支持自动旋转
    open override var shouldAutorotate: Bool {
        
        guard let topViewController = topViewController  else {
            
            return false
        }
        
        return topViewController.shouldAutorotate
    }
    // 支持方向
    open override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        
        guard let topViewController = topViewController  else {
            
            return .portrait
        }
        
        return topViewController.supportedInterfaceOrientations
    }
    // 初始化朝向
    open override var preferredInterfaceOrientationForPresentation: UIInterfaceOrientation  {
        guard let topViewController = topViewController  else {
            
            return .portrait
        }
        return topViewController.preferredInterfaceOrientationForPresentation
    }
}
