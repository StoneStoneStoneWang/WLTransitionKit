//
//  UINavigationController+Transition.swift
//  TSTransitionKit_SwiftDemo
//
//  Created by three stone 王 on 2018/11/21.
//  Copyright © 2018年 three stone 王. All rights reserved.
//

import Foundation
import UIKit
import TSBaseViewController_Swift
import TSToolKit_Swift
//Users/threestonewang/Desktop/新的仓库/TSTransitionKit_Swift/Code/UINavigationController+Transition.swift:12:35: Conformance of 'UINavigationController' to protocol 'UINavigationControllerDelegate' was already stated in the type's module 'UIKit'
// MARK: 如果使用这个转场 请在 didluanch里 TSSingleLeton.needReg()
// 我想做的是无入侵的代码

private var kimplKey: String = ""

extension UINavigationController {
    
    public var ts_impl: TSNavigationControllerDelegateImpl? {
        
        set {
            objc_setAssociatedObject(self, &kimplKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
        get {
            return objc_getAssociatedObject(self, &kimplKey) as? TSNavigationControllerDelegateImpl
        }
    }
    open override func __ts_popPan_swizzled_viewDidLoad() {
        
        ts_impl = TSNavigationControllerDelegateImpl()
        
        delegate = ts_impl
        
        printLog(message: ts_impl)
    }
}
