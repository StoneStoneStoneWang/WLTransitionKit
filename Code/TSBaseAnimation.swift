//
//  TSBaseAnimation.swift
//  TSTransitionKit_SwiftDemo
//
//  Created by three stone 王 on 2018/11/20.
//  Copyright © 2018年 three stone 王. All rights reserved.
//

import UIKit

public protocol TSBaseAnimationDelegate {
    
    func pushEnded()
    
    func popEnded()
    
    func pushCancled()
    
    func popCancled()
}

public class TSBaseAnimation: NSObject {
    
    open var transitionType: UINavigationController.Operation = .push
    
    open var interactivePopTransition: UIPercentDrivenInteractiveTransition?
    
    open var mDelegate: TSBaseAnimationDelegate!
    
    fileprivate var duration: TimeInterval = 0
    
    public static func animation(_ transitionType: UINavigationController.Operation ,_ duration: TimeInterval) -> Self {
        
        return self.init(transitionType,duration)
    }
    
    convenience required init(_ transitionType: UINavigationController.Operation ,_ duration: TimeInterval) {
        
        self.init()
        
        self.transitionType = transitionType
        
        self.duration = duration
    }
    
    open func push(_ transitionContext: UIViewControllerContextTransitioning) { }
    
    open func pop(_ transitionContext: UIViewControllerContextTransitioning) { }
}
extension TSBaseAnimation: UIViewControllerAnimatedTransitioning {
    open func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        
        return duration
    }
    
    open func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
        if transitionType == .push {
            
            push(transitionContext)
        } else if transitionType == .pop {
            
            pop(transitionContext)
        }
    }
}

// MARK: push and pop 状态函数
extension TSBaseAnimation: TSBaseAnimationDelegate {
    
    @objc open func pushEnded() {
        
        guard let delegate = mDelegate else { return }
        
        delegate.pushEnded()
    }
    @objc open func popEnded() {
        
        guard let delegate = mDelegate else { return }
        
        delegate.popEnded()
    }
    
    @objc open func pushCancled() {
        
        guard let delegate = mDelegate else { return }
        
        delegate.pushCancled()
    }
    @objc open func popCancled() {
        
        guard let delegate = mDelegate else { return }
        
        delegate.popCancled()
    }
    
}
