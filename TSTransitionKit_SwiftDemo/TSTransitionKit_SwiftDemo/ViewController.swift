//
//  ViewController.swift
//  TSTransitionKit_SwiftDemo
//
//  Created by three stone 王 on 2018/11/20.
//  Copyright © 2018年 three stone 王. All rights reserved.
//

import UIKit

import TSToolKit_Swift
import TSBaseViewController_Swift

public class ViewController: WLBaseViewController {
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(btn)
        
        btn.frame = CGRect(x: 0, y: 100, width: 100, height: 100)
        
        btn.backgroundColor = .red
        
        btn.addTarget(self, action: #selector(onClick), for: .touchUpInside)
        
        //        view.backgroundColor = .white
    }
    
    let btn = UIButton(type: .custom)
    
    public override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    public override func configNaviItem() {
        
        title = "1级"
    }
    public override func WL_prefrersNaviTitle() -> String {
        
        return "1级"
    }
}

extension ViewController {
    
    @objc open func onClick() {
        
        let vc = aaaaa()
        
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc open override func WL_prefersTabbarHidden() -> Bool {
        
        return false
    }
    
    @objc open override func WL_prefersNavigationBarHidden() -> Bool {
        
        return true
    }
    
    public override func isAddPan() -> Bool {
        
        return false
    }
}

class aaaaa: ViewController {
    
    public override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.setNavigationBarHidden(false, animated: false)
    }
    public override func configNaviItem() {
        
        title = "2级"
    }
    public override func WL_prefrersNaviTitle() -> String {
        
        return "2级"
    }
    
    override func isAddPan() -> Bool {
        
        return true
    }
    
    @objc open override func configOwnProperties() {
        
        view.backgroundColor = .white
    }
    override func WL_prefersNavigationBarHidden() -> Bool {
        
        return false
    }
    override func onClick() {
        
        let vc = bbbbbb()
        
        navigationController?.pushViewController(vc, animated: true)
    }
}
class bbbbbb: aaaaa {
    
    public override func configNaviItem() {
        
        title = "3级"
    }
    public override func WL_prefrersNaviTitle() -> String {
        
        return "3级"
    }
    override func onClick() {
        
        let vc = cccccc()
        
        navigationController?.pushViewController(vc, animated: true)
    }
}

class cccccc: aaaaa {
    
    public override func configNaviItem() {
        
        title = "4级"
    }
    public override func WL_prefrersNaviTitle() -> String {
        
        return "4级"
    }
}
