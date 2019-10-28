//
//  UIViewController+Extension.swift
//  AppStoreDemo
//
//  Created by Erwin on 2019/8/4.
//  Copyright © 2019 Utimes. All rights reserved.
//

import UIKit

extension UIViewController {
    
    private struct associateKeys {
        static var iconButtonKey = "UIViewController+Extension+iconButton"
    }
    
    //  We use `runtime` to add a iconButton for every UIViewController we want
    var iconButton: UIButton? {
        get {
            return objc_getAssociatedObject(self, &associateKeys.iconButtonKey) as? UIButton
        }
        set {
            objc_setAssociatedObject(self, &associateKeys.iconButtonKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    func setNavigationBarBottomLineHidden(_ isHidden: Bool) {
        navigationController?.navigationBar.setValue(isHidden, forKey: "hidesShadow")
    }
    
    /** Add icon button on navigationBar.
        We can not use `UIBarButtonItem` here for adding a button on navigationBar,
        because it will cause an unsuitable layout.
        So I use a custom button instead.
     */
    func addIconButtonOnNavigationBar() {
        guard let navController = navigationController else { return }
        guard let classType = NSClassFromString("_UINavigationBarLargeTitleView") else { return }
        
        if iconButton == nil {
            iconButton = createIconButtonForNavigationBar()
        }
        
        for subView in navController.navigationBar.subviews {
            if subView.isKind(of: classType) {
                subView.addSubview(iconButton!)
                
                guard let largeTitleLabel = subView.subviews.first as? UILabel else { return }
                iconButton!.translatesAutoresizingMaskIntoConstraints = false
                iconButton!.trailingAnchor.constraint(equalTo: subView.trailingAnchor, constant: -25).isActive = true
                iconButton!.centerYAnchor.constraint(equalTo: largeTitleLabel.centerYAnchor, constant: -5).isActive = true
                iconButton!.widthAnchor.constraint(equalToConstant: 35).isActive = true
                iconButton!.heightAnchor.constraint(equalToConstant: 35).isActive = true
            }
        }
    }
    
    // change navigationBar backgroundColor for iOS 13
    func adjustNavigationForiOS13() {
        if #available(iOS 13.0, *) {
            let navBarAppearance = UINavigationBarAppearance()
            navBarAppearance.configureWithOpaqueBackground()
            navBarAppearance.backgroundColor = .white
            navBarAppearance.shadowColor = nil
            navigationController?.navigationBar.standardAppearance = navBarAppearance
            navigationController?.navigationBar.scrollEdgeAppearance = navBarAppearance
        }
    }
    
    
    // creat a button for navigationBar
    private func createIconButtonForNavigationBar()-> UIButton {
        let btn = UIButton()
        btn.setImage(#imageLiteral(resourceName: "demo_icon"), for: .normal)
        btn.setImage(#imageLiteral(resourceName: "demo_icon"), for: .highlighted)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.layer.borderColor = GlobalConstants.iconBorderColor
        btn.layer.borderWidth =  GlobalConstants.iconBorderWidth
        btn.layer.cornerRadius = GlobalConstants.iconCornerRadius
        btn.addTarget(self, action: #selector(presentUserTableViewController), for: .touchUpInside)
        return btn
    }
    
    @objc func presentUserTableViewController() {
        let navController = UIStoryboard(name: "User", bundle: nil).instantiateViewController(withIdentifier: "UserNavigationControllerID")
        present(navController, animated: true, completion: nil)
    }
}

extension UIResponder {
    func setStatusBarColor(_ color: UIColor) {
        if #available(iOS 13.0, *) {
            let tag = 38482
            let keyWindow = UIApplication.shared.windows.filter {$0.isKeyWindow}.first

            if let statusBar = keyWindow?.viewWithTag(tag) {
                statusBar.backgroundColor = color
            } else {
                guard let statusBarFrame = keyWindow?.windowScene?.statusBarManager?.statusBarFrame else { return }
                let statusBarView = UIView(frame: statusBarFrame)
                statusBarView.tag = tag
                statusBarView.backgroundColor = color
                keyWindow?.addSubview(statusBarView)
            }
        } else if let statusBar = UIApplication.shared.value(forKeyPath: "statusBarWindow.statusBar") as? UIView {
            statusBar.backgroundColor = color
        }
    }
}
