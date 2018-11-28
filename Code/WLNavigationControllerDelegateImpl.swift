//
//  WLNavigationControllerDelegateImpl.swift
//  WLTransitionKit_SwiftDemo
//
//  Created by three stone 王 on 2018/11/22.
//  Copyright © 2018年 three stone 王. All righWL reserved.
//

import UIKit

open class WLNavigationControllerDelegateImpl: NSObject, UINavigationControllerDelegate {
    
    open func navigationController(_ navigationController: UINavigationController, interactionControllerFor animationController: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        
        if let animation = animationController as? WLBaseAnimation {
            
            return animation.interactivePopTransition
        }
        
        return nil
    }
    
    open func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationController.Operation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        if let interPop = fromVC.interactivePopTransition {
            
            let animation = WLNaviAnimation.animation(operation, 0.3)
            
            animation.interactivePopTransition = interPop
            
            animation.mDelegate = fromVC
            
            return animation
            
        } else {
            
            let animation = WLNaviAnimation.animation(operation, 1)
            
            animation.mDelegate = fromVC
            
            return animation
        }
    }
}
