//
//  WLViewControllerPushAnimationDelegate.swift
//  WLTransitionKit_SwiftDemo
//
//  Created by three stone 王 on 2018/11/20.
//  Copyright © 2018年 three stone 王. All righWL reserved.
//

import UIKit
import WLToolsKit
public protocol WLViewControllerPushAnimationDelegate: NSObjectProtocol {
    
    func WL_prefersNavigationBarHidden() -> Bool
    
    func WL_prefersTabbarHidden() -> Bool
}

