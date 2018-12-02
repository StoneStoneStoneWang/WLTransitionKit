//
//  WLBaseViewController.swift
//  WLBaseViewController_Swift
//
//  Created by three stone 王 on 2018/11/20.
//  Copyright © 2018年 three stone 王. All rights reserved.
//

import UIKit
import WLToolsKit
open class WLBaseViewController: UIViewController {
    
    open var navBarHairlineImageView: UIImageView? {
        
        if let navi = navigationController {
            
            return findHairlineImageViewUnder(view: navi.navigationBar)
        }
        
        return nil
        
    }
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        
        configNaviItem()
        
        configOwnProperties()
        
        addOwnSubViews()
        
        configOwnSubViews()
        
        prepareData()
        
        configAuto()
    }
    
    fileprivate func findHairlineImageViewUnder(view: UIView) -> UIImageView? {
        
        if view is UIImageView && view.bounds.height <= 1.0 {
            return view as? UIImageView
        }
        for subView in view.subviews {
            
            let imageView = findHairlineImageViewUnder(view: subView)
            
            if imageView != nil {
                
                return imageView
            }
        }
        return nil
    }
    
    open func isLineHidden() -> Bool {
        
        return true
    }
    
    override open func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navBarHairlineImageView?.isHidden = isLineHidden()
    }
}

extension WLBaseViewController {
    
    open override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        
        view.endEditing(true)
    }
}

//MARK: status bar 与  屏幕朝向
extension WLBaseViewController {
    
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

extension WLBaseViewController {
    
    @objc open override func configOwnProperties() {
        
        view.backgroundColor = WLHEXCOLOR(hexColor: TSConfig_Swift.shared.Background_HEXColor)
    }
}
