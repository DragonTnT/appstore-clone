//
//  DetailTopInfoCell.swift
//  AppStoreDemo
//
//  Created by Allen long on 2019/8/8.
//  Copyright © 2019 Utimes. All rights reserved.
//

import UIKit

class DetailTopInfoCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }
    
    private func setupUI() {
        for index in 0...3 {
            let star = StarView(frame: CGRect(x: index * (15 + 3), y: 0, width: 15, height: 15))
            starBackView.addSubview(star)
        }
    }

    @IBOutlet weak var starBackView: UIView!
    
}
