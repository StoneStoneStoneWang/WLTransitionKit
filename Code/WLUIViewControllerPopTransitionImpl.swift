//
//  WLUIViewControllerPopTransitionImpl.swift
//  TSTransitionKit_SwiftDemo
//
//  Created by three stone 王 on 2019/1/25.
//  Copyright © 2019年 three stone 王. All rights reserved.
//

import Foundation
import UIKit

@objc class WLUIViewControllerPopTransitionImpl: NSObject {
    
    @objc public static func configPopPan(vc: UIViewController) {
        
        vc.configPopPan()
    }
    
    @objc public static func configAnimationSetting(vc: UIViewController) {
        
        vc.configAnimationSetting()
    }
}
