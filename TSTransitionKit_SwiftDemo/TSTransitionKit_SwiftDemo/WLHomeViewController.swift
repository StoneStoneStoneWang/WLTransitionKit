//
//  WLHomeViewController.swift
//  TSTransitionKit_SwiftDemo
//
//  Created by three stone 王 on 2018/12/2.
//  Copyright © 2018年 three stone 王. All rights reserved.
//

import UIKit
import WLToolsKit
import WLBaseViewController
import FlowingMenu

class WLHomeViewController: WLBaseViewController {
    
    let aView = UIView()
    
    let btn = UIButton(type: .custom).then {
        
        $0.frame = CGRect(x: 0, y: 100, width: 100, height: 100)
        
        $0.backgroundColor = .red
    }
    public override func configOwnSubViews() {
        
        btn.addTarget(self, action: #selector(onClick), for: .touchUpInside)
    }
    public override func addOwnSubViews() {
        
        view.addSubview(btn)
    }
    
    @objc open func onClick() {
        
        let aaa = WLHomeViewController11()
        
        self.navigationController?.pushViewController(aaa, animated: true)
    }
}

extension WLHomeViewController {
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        
    }
    
    open override func WL_prefersTabbarHidden() -> Bool {
        
        return false
    }
    open override func WL_prefersNavigationBarHidden() -> Bool {
        
        return false
    }
    
    override open func configNaviItem() {
        
        title = "首页"
    }
}

class WLHomeViewController11: WLBaseViewController {
    
    let aView = UIView()
    
    let btn = UIButton(type: .custom).then {
        
        $0.frame = CGRect(x: 0, y: 100, width: 100, height: 100)
        
        $0.backgroundColor = .red
    }
    public override func configOwnSubViews() {
        
        btn.addTarget(self, action: #selector(onClick), for: .touchUpInside)
    }
    public override func addOwnSubViews() {
        
        view.addSubview(btn)
    }
    
    @objc open func onClick() {
        
        //        let aaa = ViewController()
        //
        //        self.navigationController?.pushViewController(aaa, animated: true)
    }
}

extension WLHomeViewController11 {
    
    open override func WL_prefersTabbarHidden() -> Bool {
        
        return true
    }
    open override func WL_prefersNavigationBarHidden() -> Bool {
        
        return false
    }
    
    override open func configNaviItem() {
        
        title = "首页11"
    }
    
    override func isAddPan() -> Bool {
        
        return true
    }
}

