//
//  WLSingleLeton.swift
//  TSBaseViewController_Swift
//
//  Created by three stone 王 on 2018/11/20.
//  Copyright © 2018年 three stone 王. All rights reserved.
//

import Foundation
import UIKit
// 使用某些功能的时候 需要 在appdidluanching的时候调用这个函数
public class WLSingleLeton {
    
    public static func needReg() {
        
        UIViewController.callClassInit()
    }
    
}
