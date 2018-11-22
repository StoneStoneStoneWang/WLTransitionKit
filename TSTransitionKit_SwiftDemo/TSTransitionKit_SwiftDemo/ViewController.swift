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

public class ViewController: UIViewController {
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(btn)
        
        btn.frame = CGRect(x: 0, y: 100, width: 100, height: 100)
        
        btn.backgroundColor = .red
        
        btn.addTarget(self, action: #selector(onClick), for: .touchUpInside)
        
        view.backgroundColor = .white

    }
    
    let btn = UIButton(type: .custom)
    
}

extension ViewController {
    
    @objc func onClick() {
        
        let vc = aaaaa()
        
        vc.title = "二级"
        
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc open override func ts_prefersTabbarHidden() -> Bool {
        
        return false
    }
    
    @objc open override func ts_prefersNavigationBarHidden() -> Bool {
        
        return false
    }
    
    public override func isAddPan() -> Bool {
        
        return false
    }
}

class aaaaa: ViewController {
    
    override func isAddPan() -> Bool {
        
        return true
    }
}
