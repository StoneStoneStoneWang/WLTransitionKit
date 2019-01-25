//
//  ViewController.swift
//  dddddd
//
//  Created by three stone 王 on 2018/12/2.
//  Copyright © 2018年 three stone 王. All rights reserved.
//

import UIKit

import WLToolsKit
import WLBaseViewController

protocol ViewControllerDelegate {
    
    func onClickt()
}


public class ViewController: WLBaseViewController {
    
    var delegate: ViewControllerDelegate!
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        
        //        view.backgroundColor = .white
    }
    
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
    
//    public override func viewDidAppear(_ animated: Bool) {
//        super.viewDidAppear(animated)
//        
//        navigationController?.setNavigationBarHidden(true, animated: false)
//    }
    
    public override func configNaviItem() {
        
        title = "1级"
    }
    
    public override func configOwnProperties() {
        
        view.backgroundColor = .white
        
    }
    public override func isAddPan() -> Bool {
        
        return true
    }
}

extension ViewController {

    @objc open func onClick() {
        
        let aaa = aaaaa()
//
        self.sideMenuController?.hideLeftView(animated: true, completionHandler: nil)

//        let tab = self.sideMenuController?.rootViewController as! WLNaviController
//
//        let navi = tab.selectedViewController as! WLNaviController

        let navi = self.sideMenuController?.rootViewController as! WLNaviController
        
        navi.pushViewController(aaa, animated: true)
        
//        self.delegate.onClickt()
        
//        dismiss(animated: true) {
//
//
//        }
        
//        dismiss(animated: true, completion: nil)
    }
    
    @objc open override func WL_prefersTabbarHidden() -> Bool {

        return false
    }

    @objc open override func WL_prefersNavigationBarHidden() -> Bool {

        return false
    }
//
//    public override func isAddPan() -> Bool {
//
//        return false
//    }
}

class aaaaa: WLBaseViewController {
    
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
    
    public override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
    public override func configNaviItem() {
        
        title = "2级"
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
    @objc func onClick() {
        
        let vc = bbbbbb()
        
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
}
class bbbbbb: aaaaa {
    
    public override func configNaviItem() {
        
        title = "3级"
    }
    
    override func onClick() {
        
        let vc = cccccc()
        
        navigationController?.pushViewController(vc, animated: true)
    }
}

class cccccc: ViewController {
    
//    public override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//
//        navigationController?.setNavigationBarHidden(true, animated: false)
//    }
    
    public override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    override func isAddPan() -> Bool {
        
        return true
    }
    
    public override func configNaviItem() {
        
        title = "4级"
    }
}
