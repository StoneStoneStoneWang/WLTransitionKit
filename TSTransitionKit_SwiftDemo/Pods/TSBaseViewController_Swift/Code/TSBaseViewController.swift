//
//  TSBaseViewController.swift
//  TSBaseViewController_Swift
//
//  Created by three stone 王 on 2018/11/20.
//  Copyright © 2018年 three stone 王. All rights reserved.
//

import UIKit

open class TSBaseViewController: UIViewController {
    
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        
        configNaviItem()
        
        configOwnProperties()
        
        addOwnSubViews()
        
        configOwnSubViews()
        
        prepareData()
        
        configAuto()
    }
}

extension TSBaseViewController {
    
    open override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        
        view.endEditing(true)
    }
}
//MARK: status bar 与  屏幕朝向
extension TSBaseViewController {
    
    open override var preferredStatusBarStyle: UIStatusBarStyle {
        
        return .default
    }
    
    open override var prefersStatusBarHidden: Bool {
        
        return false
    }
    
    open override var preferredInterfaceOrientationForPresentation: UIInterfaceOrientation {
        
        return .portrait
    }
    
    open override var shouldAutorotate: Bool {
        
        return false
    }
    
    open override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        
        return .portrait
    }
}
