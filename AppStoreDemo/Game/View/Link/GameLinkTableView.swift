//
//  GameLinkTableView.swift
//  AppStoreDemo
//
//  Created by Allen long on 2019/8/7.
//  Copyright © 2019 Utimes. All rights reserved.
//

import UIKit

class GameLinkTableView: UITableView {
    
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        rowHeight = GlobalConstants.linkCellHeight
        register(UITableViewCell.self, forCellReuseIdentifier: UITableViewCellID)
        dataSource = self
        separatorInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
    }
}

extension GameLinkTableView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return linkDataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = dequeueReusableCell(withIdentifier: UITableViewCellID, for: indexPath)
        cell.textLabel?.font = UIFont.systemFont(ofSize: 22)
        cell.textLabel?.text = linkDataSource[indexPath.row]
        cell.textLabel?.textColor = GlobalConstants.textBlueColor
        return cell
    }

}

fileprivate let UITableViewCellID = "UITableViewCellID"
fileprivate let linkDataSource: [String] = [
    "Add a Payment Method",
    "Parents' Guide to the App",
    "About In-App Purchases",
    "About Apps & Games for Your Kids",
    "About Personalisation",
    "New to the App Store",
]
