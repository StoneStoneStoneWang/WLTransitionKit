//
//  WLLoadingView.swift
//  TSBaseViewController_Swift
//
//  Created by three stone 王 on 2018/12/2.
//  Copyright © 2018年 three stone 王. All rights reserved.
//

import UIKit
import WLToolsKit

public typealias WLLoadingReloadAction = () -> ()

open class WLLoadingView: UIView {
    
    public var iconImageView: UIImageView = UIImageView(image: UIImage(named: "Loading_Image")).then {
        
        $0.contentMode = .scaleAspectFit
    }
    
    public var activity: UIActivityIndicatorView = UIActivityIndicatorView(style: .gray)
    
    public var stateLabel: UILabel = UILabel().then {
        
        $0.textColor = WLHEXCOLOR(hexColor: "#666666")
        
        $0.textAlignment = .center
    }
    
    public var reloadItem: UIButton = UIButton(type: .custom)
    
    public var reloadAction: WLLoadingReloadAction!
    
    open func showToSuperView(_ superView: UIView?) {
        
        if let superView = superView {
            
            frame = superView.bounds
            
            superView.addSubview(self)
        } else {
            
            let window = UIApplication.shared.keyWindow!
            
            frame = window.bounds
            
            window.addSubview(self)
        }
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        
        commitInit()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
extension WLLoadingView {
    
    @objc open func commitInit() {
        
        backgroundColor = WLHEXCOLOR(hexColor: "#eeeeee")
        
        addSubview(reloadItem)
        
        addSubview(iconImageView)
        
        addSubview(activity)
        
        addSubview(stateLabel)
        
        reloadItem.addTarget(self, action: #selector(onReloadItemClick), for: .touchUpInside)
    }
    @objc open func onReloadItemClick() {
        
        reloadAction()
    }
}
extension WLLoadingView {
    
    
}
extension WLLoadingView {
    
    @objc open func onBegin() {
        
        stateLabel.frame = CGRect(x: 0, y: 0, width: bounds.width, height: 40)
        
        stateLabel.center = CGPoint(x: bounds.width / 2, y: bounds.height / 2 )
        
        activity.center = CGPoint(x: bounds.width / 2, y: bounds.height / 2 )
        
        iconImageView.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        
        iconImageView.center = CGPoint(x: bounds.width / 2, y: bounds.height / 2 - 100)
        
        reloadItem.frame = bounds
    }
    @objc open func onLoading() {
        
        activity.startAnimating()
        
        stateLabel.text = ""
    }
    
    @objc open func onFail() {
        
        activity.stopAnimating()
        
        stateLabel.text = "点击屏幕 重新加载"
    }
    @objc open func onSucc() {
        
        onDismiss()
    }
    @objc open func onReload() {
        
        activity.startAnimating()
        
        stateLabel.text = ""
    }
    @objc open func onDismiss() {
        
        if activity.isAnimating {
            
            activity.stopAnimating()
        }
        
        removeFromSuperview()
    }
}
extension WLLoadingView {
    
    open func onLoadingStatusChanged(_ status: WLLoadingStatus) {
        
        switch status {
        case .begin:
            onBegin()
        case .loading:
            onLoading()
        case .succ:
            onSucc()
        case .fail:
            onFail()
        case .dismiss:
            onDismiss()
        case .reload:
            onReload()
        }
    }
}

extension WLLoadingView {
    
    public enum WLLoadingStatus: String {
        case begin
        
        case loading
        
        case succ
        
        case fail
        
        case reload
        
        case dismiss
    }
}
