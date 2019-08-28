//
//  GameLinkTableViewCell.swift
//  AppStoreDemo
//
//  Created by Allen long on 2019/8/7.
//  Copyright © 2019 Utimes. All rights reserved.
//

import UIKit

class GameLinkTableViewCell: UITableViewCell {
    
    private lazy var headerView: CommonSectionHeaderView = {
        let frame = CGRect(x: 0, y: 0, width: kScreenW, height: 42)
        let it = CommonSectionHeaderView(frame: frame)
        it.changeSectionTitle(with: "Quick Links")
        return it
    }()
    
    private lazy var tableView: GameLinkTableView = {
        let frame = CGRect(x: 0, y: 42, width: kScreenW, height: GlobalConstants.linkCellHeight * 6)
        let it = GameLinkTableView(frame: frame)
        return it
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        contentView.addSubview(headerView)
        contentView.addSubview(tableView)
    }
    
}
