//
//  UINavigationController+Config.swift
//  TSBaseViewController_Swift
//
//  Created by three stone 王 on 2018/11/20.
//  Copyright © 2018年 three stone 王. All rights reserved.
//

import Foundation
import UIKit
// 本来想在这里 控制hidesBottomBarWhenPushed 发现只能用继承比较好
//extension UINavigationController {
//
//    public static func naviInit() {
//
//        pushViewController_swizzleMethod
//    }
//
//    fileprivate static func swizzlingForClass(_ forClass: AnyClass, originalSelector: Selector, swizzledSelector: Selector) {
//        let originalMethod = class_getInstanceMethod(forClass, originalSelector)
//        let swizzledMethod = class_getInstanceMethod(forClass, swizzledSelector)
//
//        guard (originalMethod != nil && swizzledMethod != nil) else {
//            return
//        }
//
//        if class_addMethod(forClass, originalSelector, method_getImplementation(swizzledMethod!), method_getTypeEncoding(swizzledMethod!)) {
//            class_replaceMethod(forClass, swizzledSelector, method_getImplementation(originalMethod!), method_getTypeEncoding(originalMethod!))
//        } else {
//            method_exchangeImplementations(originalMethod!, swizzledMethod!)
//        }
//    }
//}
//// MARK: viewWillAppear_swizzleMethod
//extension UINavigationController {
//
//    @objc open func __ts_swizzled_pushViewController(_ viewController: UIViewController, animated: Bool) {
//        __ts_swizzled_pushViewController(viewController, animated: animated)
//
//        if children.count > 0 {
//
//            viewController.hidesBottomBarWhenPushed = true
//        }
//    }
//
//    private static let pushViewController_swizzleMethod: Void = {
//        let originalSelector = #selector(pushViewController(_:animated:))
//        let swizzledSelector = #selector(__ts_swizzled_pushViewController(_:animated:))
//        swizzlingForClass(UINavigationController.self, originalSelector: originalSelector, swizzledSelector: swizzledSelector)
//    }()
//
//}
