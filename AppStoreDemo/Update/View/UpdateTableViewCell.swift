//
//  UpdateTableViewCell.swift
//  AppStoreDemo
//
//  Created by Allen long on 2019/8/5.
//  Copyright © 2019 Utimes. All rights reserved.
//

import UIKit

class UpdateTableViewCell: UITableViewCell {

    // MARK: - IBOutlets
    @IBOutlet weak var topLeftLabel: UILabel!
    @IBOutlet weak var updateAllBtn: UIButton!
    @IBOutlet weak var contentLabel: UILabel!
    @IBOutlet weak var showMoreBtn: UIButton!
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var versionAndSizeLabel: UILabel!
    
    
    // MARK: - Constraint
    @IBOutlet weak var iconImageViewTopMargin: NSLayoutConstraint!
    @IBOutlet weak var contentLabelBottomMargin: NSLayoutConstraint!
    
    
    
    // MARK: - Properties
    // if the cell is the first cell in tableView, it would show more content than other cells
    var isFirstCell: Bool = false {
        didSet {
            iconImageViewTopMargin.constant = isFirstCell ? 48 : 16
            topLeftLabel.isHidden = !isFirstCell
            updateAllBtn.isHidden = !isFirstCell
        }
    }
    var model: UpdateModel! {
        didSet {
            iconImageView.image = UIImage(named: model.iconImageStr)
            nameLabel.text = model.appName
            dateLabel.text = model.updateDate
            contentLabel.text = model.updateContent
            versionAndSizeLabel.text = "Version " + model.version + " · " + String(model.size) + " MB"
            
            showMoreBtn.isHidden = model.showMore
            contentLabel.numberOfLines = model.showMore ? 0 : 1
            contentLabelBottomMargin.constant = model.showMore ? 60 : 20
            versionAndSizeLabel.isHidden = !model.showMore
        }
    }
    
    var updateClosure: (()->())?
    
    
    // MARK: - IBAction
    @IBAction func updateAllBtnAction(_ sender: UIButton) {
        
    }
    @IBAction func showMoreBtnAction(_ sender: UIButton) {
        updateClosure?()
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
}
