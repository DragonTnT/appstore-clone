//
//  DetailInfomationTableViewCell.swift
//  AppStoreDemo
//
//  Created by Allen long on 2019/8/9.
//  Copyright © 2019 Utimes. All rights reserved.
//

import UIKit

class DetailInfomationTableViewCell: UITableViewCell {
    
    let nameLabel = UILabel()
    let contentLabel = UILabel()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        nameLabel.textColor = .lightGray
        nameLabel.font = UIFont.systemFont(ofSize: 15)
        nameLabel.textAlignment = .left
        
        contentLabel.textColor = UIColor.black
        contentLabel.font = UIFont.systemFont(ofSize: 15)
        contentLabel.textAlignment = .right
        
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(nameLabel)
        
        contentLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(contentLabel)
        
        nameLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20).isActive = true
        contentLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        contentLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -20).isActive = true
        contentLabel.leadingAnchor.constraint(greaterThanOrEqualTo: nameLabel.trailingAnchor, constant: 30).isActive = true
        
        nameLabel.setContentHuggingPriority(UILayoutPriority(rawValue: 252), for: .horizontal)
        contentLabel.setContentCompressionResistancePriority(UILayoutPriority(749), for: .horizontal)
    }

}
