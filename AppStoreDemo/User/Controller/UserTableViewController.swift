//
//  UserTableViewController.swift
//  AppStoreDemo
//
//  Created by Allen long on 2019/8/5.
//  Copyright © 2019 Utimes. All rights reserved.
//

import UIKit

class UserTableViewController: UITableViewController {

    @IBAction func completeAction(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBarBottomLineHidden(true)
    }

    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return (section == 0 ? 36 : 29)
    }
    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.1
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
