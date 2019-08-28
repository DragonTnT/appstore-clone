//
//  CommonSectionHeaderView.swift
//  AppStoreDemo
//
//  Created by Allen long on 2019/8/9.
//  Copyright © 2019 Utimes. All rights reserved.
//

import UIKit

class CommonSectionHeaderView: UIView {

    let topicLabel = UILabel()
    let seeAllBtn = UIButton()
    let lineView = UIView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        lineView.backgroundColor = GlobalConstants.speratorLineColor
        lineView.frame = CGRect(x: GlobalConstants.leftMargin, y: 0, width: kScreenW - 2 * GlobalConstants.leftMargin, height: 0.8)
        
        topicLabel.frame = CGRect(x: 20, y: 13, width: 200, height: 24)
        topicLabel.font = UIFont.systemFont(ofSize: 22.0, weight: .medium)
        topicLabel.textColor = UIColor.black
        
        seeAllBtn.setTitleColor(GlobalConstants.textBlueColor, for: .normal)
        seeAllBtn.setTitle("See All", for: .normal)
        seeAllBtn.titleLabel?.font = UIFont.systemFont(ofSize: 17)
        seeAllBtn.frame = CGRect(x: kScreenW - GlobalConstants.leftMargin - 72, y: 16, width: 72, height: 22)
        
        addSubview(lineView)
        addSubview(topicLabel)
        addSubview(seeAllBtn)
    }
    
    func changeSectionTitle(with title: String) {
        topicLabel.text = title
    }

}
