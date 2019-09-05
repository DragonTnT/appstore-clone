//
//  GameTableViewController.swift
//  AppStoreDemo
//
//  Created by Allen long on 2019/8/6.
//  Copyright © 2019 Utimes. All rights reserved.
//

import UIKit


class GameTableViewController: UITableViewController {
    

    override func viewDidLoad() {
        super.viewDidLoad()        
        setNavigationBarBottomLineHidden(true)
        addIconButtonOnNavigationBar()
        registerCells()
    }
    
    private func registerCells() {
        tableView.ut_registerClassCell(GameRecommandTableViewCell.self)
        tableView.ut_registerClassCell(GameTopicTableViewCell.self)
        tableView.ut_registerClassCell(GameLinkTableViewCell.self)
    }
    
    private func pushToDetailController() {
        navigationController?.pushViewController(DetailViewController(), animated: true)
    }

    // MARK: - Table view data source and delegate
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return GlobalConstants.recommandHeight
        } else if indexPath.section == 1 {
            return GlobalConstants.topicHeight
        } else if indexPath.section == 2 {
            return GlobalConstants.linkHeight
        }
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if section == 0 || section == 1 || section == 2 {
            return 1
        }
        return 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.ut_dequeueReusable(GameRecommandTableViewCell.self, for: indexPath)
            cell.detailClosure = {
                self.pushToDetailController()
            }
            return cell
        } else if indexPath.section == 1 {
            let cell = tableView.ut_dequeueReusable(GameTopicTableViewCell.self, for: indexPath)
            cell.detailClosure = {
                self.pushToDetailController()
            }
            cell.downloadClosure = { model in
                let vc = DownloadViewController()
                vc.model = model
                self.present(vc, animated: true, completion: nil)
            }
            return cell
        } else if indexPath.section == 2 {
            let cell = tableView.ut_dequeueReusable(GameLinkTableViewCell.self, for: indexPath)
            return cell
        }
        return UITableViewCell()
    }

    override func scrollViewDidScroll(_ scrollView: UIScrollView) {

        if scrollView.contentOffset.y > 0 {
            setNavigationBarBottomLineHidden(false)
        } else {
            setNavigationBarBottomLineHidden(true)
        }        
    }
}

