//
//  UIViewController+Transiontion.swift
//  TSTransitionKit_SwiftDemo
//
//  Created by three stone 王 on 2018/11/20.
//  Copyright © 2018年 three stone 王. All rights reserved.
//

import Foundation
import UIKit
import TSToolKit_Swift
private let TSPopPanResponseW: CGFloat = 100

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
        
        printLog(message: progress)
        
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
    
    @objc open func popPanResponseW() -> CGFloat {
        
        return TSPopPanResponseW
    }
    @objc open func __ts_popPan_swizzled_viewDidLoad() {
        __ts_popPan_swizzled_viewDidLoad()
        
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
        let swizzledSelector = #selector(__ts_popPan_swizzled_viewDidLoad)
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

extension UIViewController: TSViewControllerPushAnimationDelegate {
    
    @objc open func ts_prefersNavigationBarHidden() -> Bool {
        
        return false
    }
    
    @objc open func ts_prefersTabbarHidden() -> Bool {
        
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
    
    @objc open var ts_naviChildViewControllersCount: Int {
        
        return navigationController?.children.count ?? 0
    }
    
    @objc open var ts_tabbarController: UITabBarController? {
        
        return tabBarController
    }
    
    @objc open var ts_naviController: UINavigationController? {
        
        return navigationController
    }
    
    @objc open var ts_contentView: UIView {
        
        return view
    }
}

extension UIViewController: TSBaseAnimationDelegate {
    @objc open func pushEnded() {
        
    }
    
    @objc open func popEnded() {
        
        
    }
    
    @objc open func pushCancled() {
        
    }
    
    @objc open func popCancled() {
        
        
    }
}

