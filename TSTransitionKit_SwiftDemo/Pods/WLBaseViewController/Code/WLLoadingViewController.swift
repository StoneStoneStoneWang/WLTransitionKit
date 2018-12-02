//
//  WLLoadingViewController.swift
//  TSBaseViewController_Swift
//
//  Created by three stone 王 on 2018/12/2.
//  Copyright © 2018年 three stone 王. All rights reserved.
//

import UIKit

open class WLLoadingViewController: WLBaseViewController {
    
    open var loadingView: WLLoadingView = WLLoadingView(frame: .zero)
    
    open override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        loadingView.showToSuperView(view)
        
        loadingView.onLoadingStatusChanged(.begin)
        
        loadingView.onLoadingStatusChanged(.loading)
    }
}
extension WLLoadingViewController {
    
    
}
