//
//  UIViewController+WLHandleGesture.swift
//  TSTransitionKit_SwiftDemo
//
//  Created by three stone 王 on 2019/1/14.
//  Copyright © 2019年 three stone 王. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController: UIGestureRecognizerDelegate {
    
    open func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        
        if gestureRecognizer == __pop_pan_gesture {
            
            return gestureRecognizer.location(in: view).x > 0 && gestureRecognizer.location(in: view).x < popPanResponseW()
        }
        
        return false
    }
}
