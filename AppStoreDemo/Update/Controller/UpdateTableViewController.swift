//
//  UpdateTableViewController.swift
//  AppStoreDemo
//
//  Created by Erwin on 2019/8/4.
//  Copyright © 2019 Utimes. All rights reserved.
//

import UIKit

class UpdateTableViewController: UITableViewController {
    
    var dataSource = DataSource
    
    //record cellHeight to prevent flickering when tapped `more`
    var cellHeights: [IndexPath: CGFloat] = [:]

    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBarBottomLineHidden(true)
        addIconButtonOnNavigationBar()
        configTableView()
    }
    
    private func configTableView() {
        tableView.ut_registerNibCell(UpdateTableViewCell.self)
    }
    
    //add iconButton to LargeTitleView
    
    @objc func rightButtonTapped(_ btn: UIButton) {
        presentUserTableViewController()
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return dataSource.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.ut_dequeueReusable(UpdateTableViewCell.self, for: indexPath)
        cell.isFirstCell = (indexPath.row == 0)
        cell.updateClosure = { [weak self] tappedCell in
            guard let StrongSelf = self else { return }
            StrongSelf.dataSource[indexPath.row].showMore = true
            StrongSelf.tableView.reloadRows(at: [indexPath], with: .none)
            print(indexPath)
        }
        cell.model = dataSource[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cellHeights[indexPath] = cell.frame.size.height
    }
    
    override func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        if let height = cellHeights[indexPath] {
            return height
        } else {
            return UITableView.automaticDimension
        }
    }
    
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView.contentOffset.y > 0 {
            setNavigationBarBottomLineHidden(false)
        } else {
            setNavigationBarBottomLineHidden(true)
        }
    }

}


fileprivate let DataSource: [UpdateModel] = [
    UpdateModel(appName: "Huajiao Live", updateDate: "Today", iconImageStr: "logo_broadcast", updateContent: "[Play] Music radio broadcasting page revision, more immersed in music exploration \n\n[Mine] Rewriting sets the position of the night mode \n\n[Radio] Let's go with DJ and get up!", version: "2.0.0", size: 35.7, showMore: false),
    UpdateModel(appName: "Sina Weibo", updateDate: "Today", iconImageStr: "logo_weibo", updateContent: "-Performance improvements and bug fixed", version: "5.3.3", size: 32.5, showMore: false),
    UpdateModel(appName: "Sougou-input", updateDate: "Yesterday", iconImageStr: "logo_smile", updateContent: "Fix bug and to be better for you", version: "2.1.1", size: 42.2, showMore: false),
    UpdateModel(appName: "Guazi Car", updateDate: "Yesterday", iconImageStr: "logo_car", updateContent: "Sometimes, a polish is all you need. No big chages, just a shine", version: "1.5.0", size: 28.0, showMore: false),
    UpdateModel(appName: "Fly-chat", updateDate: "2019/08/02", iconImageStr: "logo_jump", updateContent: "This update includes bug fixed and user interface improvements", version: "1.5.6", size: 33.0, showMore: false),
]
