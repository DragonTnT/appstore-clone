//
//  SearchTableViewController.swift
//  AppStoreDemo
//
//  Created by Allen long on 2019/8/2.
//  Copyright © 2019 Utimes. All rights reserved.
//

import UIKit

class SearchTableViewController: UITableViewController {
    
    private var searchController: UISearchController!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setNavigationBarBottomLineHidden(true)
        setupSearchController()
        
        tableView.ut_registerClassCell(SearchTableViewCell.self)
    }
    
    private func setupSearchController() {
        
        searchController = UISearchController(searchResultsController: nil)
        searchController.searchBar.autocapitalizationType = .none
        searchController.searchBar.placeholder = "App Store"
        searchController.isActive = true
        definesPresentationContext = true
        
        if #available(iOS 11.0, *) {
            // For iOS 11 and later, place the search bar in the navigation bar.
            navigationItem.searchController = searchController
            
            // Make the search bar always visible.
            navigationItem.hidesSearchBarWhenScrolling = false
        } else {
            // For iOS 10 and earlier, place the search controller's search bar in the table view's header.
            tableView.tableHeaderView = searchController.searchBar
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.ut_dequeueReusable(SearchTableViewCell.self, for: indexPath)
        cell.textLabel?.text = dataList[indexPath.row]
        cell.canChangeHightlighted = (indexPath.row != 0)
        
        return cell
    }

}

fileprivate let dataList: [String] = [
    "Hot Search",
    "Daily life",
    "League of Legends",
    "Wechat",
    "Game of Thrones",
    "Hupu JRS",
    "Game Center",
    "QQ Music"
]
