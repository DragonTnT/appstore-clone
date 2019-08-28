//
//  DetailInformationCell.swift
//  AppStoreDemo
//
//  Created by Allen long on 2019/8/9.
//  Copyright © 2019 Utimes. All rights reserved.
//

import UIKit

class DetailInformationCell: UITableViewCell {

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(headerView)
        contentView.addSubview(tableView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var headerView: CommonSectionHeaderView = {
        let frame = CGRect(x: 0, y: 0, width: kScreenW, height: 52)
        let it = CommonSectionHeaderView(frame: frame)
        it.changeSectionTitle(with: "Information")
        it.lineView.isHidden = true
        return it
    }()
    
    private lazy var tableView: UITableView = {
        let frame = CGRect(x: 0, y: self.headerView.frame.height, width: kScreenW, height: 400)
        let it = UITableView(frame: frame)
        it.separatorInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        it.dataSource = self
        it.ut_registerClassCell(DetailInfomationTableViewCell.self)
        it.rowHeight = 50
        return it
    }()
    
}

extension DetailInformationCell: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.ut_dequeueReusable(DetailInfomationTableViewCell.self, for: indexPath)
        cell.nameLabel.text = dataSource[indexPath.row].0
        cell.contentLabel.text = dataSource[indexPath.row].1
        cell.selectionStyle = .none
        return cell
    }
}

fileprivate let dataSource: [(String,String)] = [
    ("Seller", "Hangzhou NetEase Leihuo Technology Co., Ltd."),
    ("Size", "2.5GB"),
    ("Category", "Games: Strategy"),
    ("Compatibility", "Works on this iphone"),
    ("Languages", "Simplified Chinese"),
    ("Age Rating", "9+"),
    ("In-App Purchases", "Yes"),
    ("Copyright", "©1997-2019 网易公司版权所有")
]

