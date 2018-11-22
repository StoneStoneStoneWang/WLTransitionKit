//
//  UIViewController+Swizzling.swift
//  TSBaseViewController_Swift
//
//  Created by three stone 王 on 2018/11/20.
//  Copyright © 2018年 three stone 王. All rights reserved.
//

import Foundation
import TSToolKit_Swift

//extension UIViewController: SelfAware {
//
//    @objc public static func awake() {
//
//        UIViewController.classInit()
//    }
//
//    private static func classInit() {
//
//        viewDidLoad_swizzleMethod
//
//        viewWillAppear_swizzleMethod
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
//
//// MARK: viewDidLoad_swizzleMethod
//extension UIViewController {
//
//    @objc open func __ts_swizzled_viewDidLoad() {
//        __ts_swizzled_viewDidLoad()
//
//        configNaviItem()
//
//        configOwnProperties()
//
//        addOwnSubViews()
//
//        configOwnSubViews()
//
//        prepareData()
//    }
//
//    fileprivate static let viewDidLoad_swizzleMethod: Void = {
//        let originalSelector = #selector(viewDidLoad)
//        let swizzledSelector = #selector(__ts_swizzled_viewDidLoad)
//        swizzlingForClass(UIViewController.self, originalSelector: originalSelector, swizzledSelector: swizzledSelector)
//    }()
//}
//
//// MARK: viewWillAppear_swizzleMethod
//extension UIViewController {
//
//    @objc open func __ts_swizzled_viewWillAppear(_ animated: Bool) {
//        __ts_swizzled_viewWillAppear(animated)
//
//    }
//
//    private static let viewWillAppear_swizzleMethod: Void = {
//        let originalSelector = #selector(viewWillAppear(_:))
//        let swizzledSelector = #selector(__ts_swizzled_viewWillAppear(_:))
//        swizzlingForClass(UIViewController.self, originalSelector: originalSelector, swizzledSelector: swizzledSelector)
//    }()
//}

