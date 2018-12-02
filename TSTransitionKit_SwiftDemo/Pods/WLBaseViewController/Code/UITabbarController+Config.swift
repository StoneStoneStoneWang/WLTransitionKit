//
//  UITabbarController+Config.swift
//  TSBaseViewController_Swift
//
//  Created by three stone 王 on 2018/11/20.
//  Copyright © 2018年 three stone 王. All rights reserved.
//

import Foundation
import UIKit

extension UITabBarController {
    
    open func addChildVC(childVC: UIViewController, title: String = "" ,fontSize: CGFloat,titleColor: UIColor ,highColor: UIColor,imageName: String = "" ,selectedImageName: String = "" ) {
        
        childVC.navigationItem.title = title
        
        childVC.tabBarItem.title = title
        
        childVC.title = title
        
        childVC.tabBarItem.setTitleTextAttributes([NSAttributedString.Key.foregroundColor:titleColor
            ,NSAttributedString.Key.font: UIFont.systemFont(ofSize: fontSize)], for: .normal)
        
        childVC.tabBarItem.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: highColor
            ,NSAttributedString.Key.font: UIFont.systemFont(ofSize: fontSize)], for: .selected)
        
        if !imageName.isEmpty {
            
            childVC.tabBarItem.image = UIImage(named: imageName)?.withRenderingMode(.alwaysOriginal)
        }
        if !selectedImageName.isEmpty {
            
            childVC.tabBarItem.selectedImage = UIImage(named: selectedImageName)?.withRenderingMode(.alwaysOriginal)
        }
        
        let navi = WLNaviController(rootViewController: childVC)
        
        addChild(navi)
    }
}

