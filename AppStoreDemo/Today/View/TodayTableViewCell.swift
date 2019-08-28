//
//  TodayTableViewCell.swift
//  AppStoreDemo
//
//  Created by Allen long on 2019/7/31.
//  Copyright © 2019 Utimes. All rights reserved.
//

import UIKit

class TodayTableViewCell: UITableViewCell {
    
    let bgBackView = UIView()
    let bgImageView = UIImageView()    
    let emptyView = UIView()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        
        bgBackView.addSubview(bgImageView)
        contentView.addSubview(bgBackView)
        contentView.addSubview(emptyView)
        
        bgBackView.frame = CGRect(x: GlobalConstants.leftMargin, y: 0, width: GlobalConstants.todayCardSize.width, height: GlobalConstants.todayCardSize.height)
        bgBackView.layer.shadowColor = UIColor.black.cgColor
        bgBackView.layer.shadowOpacity = 0.4
        bgBackView.layer.shadowOffset = CGSize(width: 0, height: 1)
        
        bgImageView.frame = bgBackView.bounds
        bgImageView.contentMode = .scaleAspectFill
        bgImageView.layer.cornerRadius = GlobalConstants.toDayCardCornerRadius
        bgImageView.layer.masksToBounds = true
        
        emptyView.backgroundColor = UIColor.white.withAlphaComponent(0)
        emptyView.frame = CGRect(x: 0, y: bgImageView.frame.size.height, width: GlobalConstants.todayCardSize.width, height: GlobalConstants.toDayCardRowH - GlobalConstants.todayCardSize.height)
    }
    
}
