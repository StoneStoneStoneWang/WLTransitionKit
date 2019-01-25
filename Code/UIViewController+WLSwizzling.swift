//
//  UIViewController+WLSwizzling.swift
//  TSTransitionKit_SwiftDemo
//
//  Created by three stone 王 on 2019/1/14.
//  Copyright © 2019年 three stone 王. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    
    
    @objc open func __WL_popPan_swizzled_viewDidLoad() {
        __WL_popPan_swizzled_viewDidLoad()
        
        configPopPan()
        
        configAnimationSetting()
    }
    // MARK: 预留 遇到的问题是经过pod 之后发现不执行 这个代码 不经过pod的话 是执行这段代码的
    // 分析原因可能是包含行参之后 pod和原生swift函数以及行参命名空间的问题  不知道对不对 也只能想到这个原因了
    // 比如类 NSClassFromString("TSTransitionKit_SwiftDemo.WLHomeViewController")
    // 比如函数 NSSelectorFromString("__WL_popPan_swizzled_viewDidAppearWithAnimated:")
    @objc open func __WL_popPan_swizzled_viewDidAppear(_ animated: Bool) {
        __WL_popPan_swizzled_viewDidAppear(animated)
        
        
    }
}

extension UIViewController {
    
    public static func popPanClassInit() {
        
        viewDidLoad_swizzleMethod
        
        viewDidApppear_swizzleMethod
    }
    
    fileprivate static let viewDidLoad_swizzleMethod: Void = {
        let originalSelector = #selector(viewDidLoad)
        let swizzledSelector = #selector(__WL_popPan_swizzled_viewDidLoad)
        swizzlingForClass(UIViewController.self, originalSelector: originalSelector, swizzledSelector: swizzledSelector)
    }()
    
    fileprivate static let viewDidApppear_swizzleMethod: Void = {
        let originalSelector = #selector(viewDidAppear(_:))
        let swizzledSelector = #selector(__WL_popPan_swizzled_viewDidAppear(_:))
        swizzlingForClass(UIViewController.self, originalSelector: originalSelector, swizzledSelector: swizzledSelector)
    }()
    
    fileprivate static func swizzlingForClass(_ forClass: AnyClass, originalSelector: Selector, swizzledSelector: Selector) {
        let originalMethod = class_getInstanceMethod(forClass, originalSelector)
        let swizzledMethod = class_getInstanceMethod(forClass, swizzledSelector)
        
        guard (originalMethod != nil && swizzledMethod != nil) else {
            return
        }
        
        if class_addMethod(forClass, originalSelector, method_getImplementation(swizzledMethod!), method_getTypeEncoding(swizzledMethod!)) {
            class_replaceMethod(forClass, swizzledSelector, method_getImplementation(originalMethod!), method_getTypeEncoding(originalMethod!))
        } else {
            method_exchangeImplementations(originalMethod!, swizzledMethod!)
        }
    }
}
