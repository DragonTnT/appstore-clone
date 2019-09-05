//
//  TodayViewController.swift
//  AppStoreDemo
//
//  Created by Allen long on 2019/7/31.
//  Copyright © 2019 Utimes. All rights reserved.
//

import UIKit

class TodayViewController: UITableViewController {
    
    var selectedCell: TodayTableViewCell?
    
    var statusBarShouldBeHidden = false
    //we need to set `View controller-based status bar appearance = YES` in info.plist.
    //so we can be able to hide statusBar.
    override var prefersStatusBarHidden: Bool {
        return statusBarShouldBeHidden
    }
    
    override var preferredStatusBarUpdateAnimation: UIStatusBarAnimation {
        return .slide
    }
    
    lazy var headerView: TodayTableHeaderView = {
        let frame = CGRect(x: 0, y: 0, width: kScreenW, height: 96)
        let view = TodayTableHeaderView(frame: frame)
        view.iconButtonClosure = { [weak self] in
            guard let StrongSelf = self else { return }
            StrongSelf.presentUserTableViewController()
        }
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
        
        
    }

    private func setupTableView() {
        tableView.ut_registerClassCell(TodayTableViewCell.self)
        tableView.separatorStyle = .none
        tableView.rowHeight = GlobalConstants.toDayCardRowH
        tableView.tableHeaderView = headerView
    }
    
    private func updateStatusBarAndTabbarFrame(visible: Bool) {
        statusBarShouldBeHidden = !visible
        UIView.animate(withDuration: 0.25) {
            self.setNeedsStatusBarAppearanceUpdate()
        }
    }


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.ut_dequeueReusable(TodayTableViewCell.self, for: indexPath)
        cell.selectionStyle = .none
        if indexPath.row == 0 {
            cell.bgImageView.image = #imageLiteral(resourceName: "cover_4")
        } else {
            cell.bgImageView.image = #imageLiteral(resourceName: "cover_5")
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didHighlightRowAt indexPath: IndexPath) {
        guard let row = tableView.cellForRow(at: indexPath) as? TodayTableViewCell else { return }
        UIView.animate(withDuration: 0.1) {
            row.bgBackView.transform = CGAffineTransform(scaleX: 0.95, y: 0.95)
        }
    }
    
    override func tableView(_ tableView: UITableView, didUnhighlightRowAt indexPath: IndexPath) {
        guard let row = tableView.cellForRow(at: indexPath) as? TodayTableViewCell else { return }
        UIView.animate(withDuration: 0.3) {
            row.bgBackView.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        }
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        guard let cell = tableView.cellForRow(at: indexPath) as? TodayTableViewCell else { return }
        selectedCell = cell
        
        let detailVC = CardDetailViewController(cell: cell)
        
        detailVC.dismissClosure = { [weak self] in
            guard let StrongSelf = self else { return }
            StrongSelf.updateStatusBarAndTabbarFrame(visible: true)
        }
        
        updateStatusBarAndTabbarFrame(visible: false)
        
        present(detailVC, animated: true, completion: nil)        

    }
}


