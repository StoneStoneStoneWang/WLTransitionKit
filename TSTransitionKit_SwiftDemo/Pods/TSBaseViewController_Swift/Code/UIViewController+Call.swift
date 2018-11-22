//
//  UIViewController+Call.swift
//  TSBaseViewController_Swift
//
//  Created by three stone 王 on 2018/11/20.
//  Copyright © 2018年 three stone 王. All rights reserved.
//

import Foundation
import UIKit
import WebKit
extension UIViewController {
    
    open var phoneView: WKWebView? {
        
        set {
            objc_setAssociatedObject(self, "phoneView", newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
        get {
            
            return objc_getAssociatedObject(self, "phoneView") as? WKWebView
        }
    }
    
    public static func callClassInit() {
        
        viewDidLoad_swizzleMethod
    }
    
    fileprivate static let viewDidLoad_swizzleMethod: Void = {
        let originalSelector = #selector(viewDidLoad)
        let swizzledSelector = #selector(__ts_swizzled_viewDidLoad)
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
// MARK: 初始化wwebview
extension UIViewController {
    
    @objc open func shouldInitWebView() -> Bool {
        
        return false
    }
    
    @objc open func __ts_swizzled_viewDidLoad() {
        __ts_swizzled_viewDidLoad()
        
        if phoneView == nil && shouldInitWebView() {
            
            phoneView = WKWebView(frame: view.bounds)
            
            view.addSubview(phoneView!)
        }
    }
    
    open func call(phone: String) {
        
        let phoneUrl = URL(string: "tel:\(phone)")
        
        phoneView!.load(URLRequest(url: phoneUrl!))
    }
}

