//
//  UIViewController+config.swift
//  TSBaseViewController_Swift
//
//  Created by three stone 王 on 2018/11/20.
//  Copyright © 2018年 three stone 王. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    
    @objc open func configNaviItem() { }
    
    @objc open func configOwnProperties() {
        
//        view.backgroundColor = 
    }
    
    @objc open func addOwnSubViewController() {}
    
    @objc open func addOwnSubViews() { }
    
    @objc open func configOwnSubViews() { }
    
    @objc open func prepareData() { }
    
    @objc open func configAuto() {
        
        if #available(iOS 11.0, *) {
            
           _ = view.subviews.map {
                
                if $0 is UIScrollView {
                    
                    let scrollView = $0 as! UIScrollView;
                    
                    scrollView.contentInsetAdjustmentBehavior = .never
                }
            }
        } else {
            
            automaticallyAdjustsScrollViewInsets = false
        }
        
    }
}


