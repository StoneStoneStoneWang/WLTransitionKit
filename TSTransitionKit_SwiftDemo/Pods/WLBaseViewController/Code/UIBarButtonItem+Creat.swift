//
//  UIBarButtonItem+Creat.swift
//  TSBaseViewController_Swift
//
//  Created by three stone 王 on 2018/11/20.
//  Copyright © 2018年 three stone 王. All rights reserved.
//

import Foundation
import UIKit

extension UIBarButtonItem {
    
    public static func barButtonItem(imageName : String, highImageName : String = "", size : CGSize = CGSize.zero ,target: AnyObject ,action: Selector) -> UIBarButtonItem {
        
        // 1.创建UIButton
        let btn = UIButton()
        
        // 2.设置btn的图片
        btn.setImage(UIImage(named: imageName), for: .normal)
        if !highImageName.isEmpty {
            
            btn.setImage(UIImage(named: highImageName), for: .highlighted)
        }
        // 3.设置btn的尺寸
        if size == CGSize.zero {
            
            btn.sizeToFit()
        } else {
            
            btn.frame = CGRect(origin: CGPoint.zero, size: size)
        }
        
        btn.addTarget(target, action: action, for: .touchUpInside)
        
        return UIBarButtonItem(customView : btn)
    }
    public static func barButtonItem(name : String,nameColor: UIColor ,highName : String = "",highColor: UIColor, size : CGSize = CGSize.zero ,target: AnyObject ,action: Selector) -> UIBarButtonItem {
        
        // 1.创建UIButton
        let btn = UIButton(type: .custom).then {
            
            $0.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        }
        
        // 2.设置btn的图片
        btn.setTitle(name, for: .normal)
        
        btn.setTitle(highName, for: .highlighted)
        
        btn.setTitleColor(nameColor, for: .normal)
        
        btn.setTitleColor(highColor, for: .highlighted)
        // 3.设置btn的尺寸
        
        if size == CGSize.zero {
            
            btn.sizeToFit()
            
        } else {
            btn.frame = CGRect(origin: CGPoint.zero, size: size)
        }
        
        btn.addTarget(target, action: action, for: .touchUpInside)
        
        return UIBarButtonItem(customView : btn)
    }
    public static func barButtonItem(name : String,nameColor: UIColor ,highName : String = "",highColor: UIColor,disbledName: String,disbledColor: UIColor,font: UIFont, size : CGSize = CGSize.zero ,target: AnyObject ,action: Selector) -> UIBarButtonItem {
        
        // 1.创建UIButton
        let btn = UIButton()
        
        // 2.设置btn的图片
        btn.setTitle(name, for: .normal)
        
        btn.setTitle(highName, for: .highlighted)
        
        btn.setTitleColor(nameColor, for: .normal)
        
        btn.setTitleColor(highColor, for: .highlighted)
        
        btn.setTitle(disbledName, for: .disabled)
        
        btn.setTitleColor(disbledColor, for: .disabled)
        // 3.设置btn的尺寸
        
        if size == CGSize.zero {
            
            btn.sizeToFit()
            
        } else {
            btn.frame = CGRect(origin: CGPoint.zero, size: size)
        }
        
        btn.titleLabel?.font = font
        
        btn.addTarget(target, action: action, for: .touchUpInside)
        
        return UIBarButtonItem(customView : btn)
    }
}
