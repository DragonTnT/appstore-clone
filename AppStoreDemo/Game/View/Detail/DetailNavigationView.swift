//
//  DetailNavigationView.swift
//  AppStoreDemo
//
//  Created by Allen long on 2019/8/7.
//  Copyright © 2019 Utimes. All rights reserved.
//

import UIKit

class DetailNavigationView: UIView {
    
    var goBackClosure: (()->())?
    
    let goBackBtn = UIButton()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        backgroundColor = UIColor.white.withAlphaComponent(0)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        goBackBtn.setTitle("Games", for: .normal)
        goBackBtn.setTitleColor(UIColor.white, for: .normal)
        let image = UIImage(named: "navigation_back")?.withRenderingMode(.alwaysTemplate)
        goBackBtn.setImage(image, for: .normal)
        goBackBtn.tintColor = UIColor.white
        goBackBtn.frame = CGRect(x: 5, y: statusBarH + 5, width: 80, height: 30)
        goBackBtn.addTarget(self, action: #selector(goBackAction), for: .touchUpInside)
        addSubview(goBackBtn)
    }
    
    @objc private func goBackAction() {
        goBackClosure?()
    }

}
