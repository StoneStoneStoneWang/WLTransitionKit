//
//  UIViewController+Transiontion.swift
//  WLTransitionKit_SwiftDemo
//
//  Created by three stone 王 on 2018/11/20.
//  Copyright © 2018年 three stone 王. All righWL reserved.
//

import Foundation
import UIKit
import TSToolKit_Swift
private let WLPopPanResponseW: CGFloat = 100

private var kAnimationConfigKey: String = ""

extension UIViewController {
    
    @objc open func isAddPan() -> Bool {
        
        return false
    }
    
    @objc open func addPopPanGesture() {
        
        if let navi = navigationController {
            
            if self != navi.children.first {
                
                if isAddPan() {
                    
                    let popRecognizer = UIPanGestureRecognizer(target: self, action: #selector(handlePopRecognizer(_:)))
                    
                    view.addGestureRecognizer(popRecognizer)
                    
                    popRecognizer.delegate = self
                }
            }
        }
    }
    
    @objc private func handlePopRecognizer(_ recognizer: UIPanGestureRecognizer) {
        
        var progress = recognizer.translation(in: view).x / view.frame.width
        
        progress = min(1.0, max(0.0, progress))
        
        if recognizer.state == .began {
            
            interactivePopTransition = UIPercentDrivenInteractiveTransition()
            
            navigationController?.popViewController(animated: true)
            
        } else if recognizer.state == .changed {
            
            interactivePopTransition?.update(CGFloat(progress))
            
        } else if recognizer.state == .ended || recognizer.state == .cancelled {
            
            if progress > 0.25 {
                
                interactivePopTransition?.finish()
            } else {
                
                interactivePopTransition?.cancel()
            }
            
            interactivePopTransition = nil
        }
    }
    // 可以在子类里设置响应手势的f范围
    @objc open func popPanResponseW() -> CGFloat {
        
        return WLPopPanResponseW
    }
    
    public var __animation_config: WLNaviAnimationConfig? {
        
        set {
            objc_setAssociatedObject(self, &kAnimationConfigKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
        get {
            return objc_getAssociatedObject(self, &kAnimationConfigKey) as? WLNaviAnimationConfig
        }
    }
    
    
    @objc open func __WL_popPan_swizzled_viewDidLoad() {
        __WL_popPan_swizzled_viewDidLoad()
        
        if isAddPan() {
            
            addPopPanGesture()
        }
    }
}

extension UIViewController: UIGestureRecognizerDelegate {
    
    public func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        
        return gestureRecognizer.location(in: view).x > 0 && gestureRecognizer.location(in: view).x < popPanResponseW()
    }
}
extension UIViewController {
    
    public static func popPanClassInit() {
        
        viewDidLoad_swizzleMethod
    }
    
    fileprivate static let viewDidLoad_swizzleMethod: Void = {
        let originalSelector = #selector(viewDidLoad)
        let swizzledSelector = #selector(__WL_popPan_swizzled_viewDidLoad)
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
private var kInteractiveKey: String = ""

extension UIViewController: WLViewControllerPushAnimationDelegate {
    
    @objc open func WL_prefersNavigationBarHidden() -> Bool {
        
        return false
    }
    
    @objc open func WL_prefersTabbarHidden() -> Bool {
        
        return true
    }
    
    @objc open var interactivePopTransition: UIPercentDrivenInteractiveTransition? {
        
        set {
            objc_setAssociatedObject(self, &kInteractiveKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
        get {
            
            return objc_getAssociatedObject(self, &kInteractiveKey) as? UIPercentDrivenInteractiveTransition
        }
    }
}

extension UIViewController: WLBaseAnimationDelegate {
    @objc open func pushEnded() {
        
        printLog(message: "pushEnded")
    }
    
    @objc open func popEnded() {
        
        printLog(message: "popEnded")
    }
    
    @objc open func pushCancled() {
        
        printLog(message: "pushCancled")
    }
    
    @objc open func popCancled() {
        
        printLog(message: "popCancled")
    }
}
