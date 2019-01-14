//
//  UIViewController+Transiontion.swift
//  WLTransitionKit_SwiftDemo
//
//  Created by three stone 王 on 2018/11/20.
//  Copyright © 2018年 three stone 王. All righWL reserved.
//

import Foundation
import UIKit
import WLToolsKit
private let WLPopPanResponseW: CGFloat = 100

private var kAnimationConfigKey: String = ""

private var kPopPanKey: String = ""

extension UIViewController {
    
    open var __pop_pan_gesture: UIPanGestureRecognizer? {
        
        set {
            objc_setAssociatedObject(self, &kPopPanKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
        get {
            return objc_getAssociatedObject(self, &kPopPanKey) as? UIPanGestureRecognizer
        }
    }
    
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
                    
                    __pop_pan_gesture = popRecognizer
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
    
    public func configPopPan() {
        
        if isAddPan() {
            
            addPopPanGesture()
        }
        
        if !(self is UINavigationController) && !(self is UITabBarController) {
            
            __animation_config = WLNaviAnimationConfig()
        }
    }
    
    public func configAnimationSetting() {
        
        if !(self is UINavigationController) && !(self is UITabBarController) {
            
            if let navi = navigationController {
                
                printLog(message: self)
                
                if __animation_config?.naviImage == nil {
                    
                    __animation_config!.naviImage = UIImage.viewTransformToImage(view: navi.navigationBar)
                }
                
                __animation_config!.statusStyle = navi.navigationBar.barStyle
                
                __animation_config!.statusTintColor = navi.navigationBar.barTintColor ?? .clear
                
                __animation_config!.prefersNavigationBarHidden = WL_prefersNavigationBarHidden()
                
                __animation_config!.prefersTabbarHidden = WL_prefersTabbarHidden()
                
                __animation_config!.isTranslucent = navi.navigationBar.isTranslucent
                
                if let tab = tabBarController {
                    
                    if __animation_config?.tabbarImage == nil {
                        
                        __animation_config!.tabbarImage = UIImage.viewTransformToImage(view: tab.tabBar)
                    }
                }
            }
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
