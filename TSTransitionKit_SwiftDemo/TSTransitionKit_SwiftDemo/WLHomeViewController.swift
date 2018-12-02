//
//  WLHomeViewController.swift
//  TSTransitionKit_SwiftDemo
//
//  Created by three stone 王 on 2018/12/2.
//  Copyright © 2018年 three stone 王. All rights reserved.
//

import UIKit
import TSBaseViewController_Swift
class WLHomeViewController: WLBaseViewController {
    
    open override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
}
extension WLHomeViewController {
    
    open override func WL_prefersTabbarHidden() -> Bool {
        
        return false
    }
    open override func WL_prefersNavigationBarHidden() -> Bool {
        
        return true
    }
    open override func WL_prefrersNaviTitle() -> String {
        
        return "我的"
    }
    override open func configNaviItem() {
        
        title = "首页"
    }
}

