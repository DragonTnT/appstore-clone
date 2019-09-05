//
//  DownloadBottomView.swift
//  AppStoreDemo
//
//  Created by Allen long on 2019/9/5.
//  Copyright © 2019 Utimes. All rights reserved.
//

import UIKit

protocol DownloadBottomViewDelegate: class {
    func downloadBottomViewDidClickCancel(_ bottomView: DownloadBottomView)
}

class DownloadBottomView: UIView,NibLoadable {

    weak var delegate: DownloadBottomViewDelegate?
    
    
    @IBAction func cancelAction(_ sender: UIButton) {
        delegate?.downloadBottomViewDidClickCancel(self)
    }
    
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    @IBOutlet weak var iconImageView: UIImageView!
    
    var model: GameTopicModel! {
        didSet {
            nameLabel.text = model.name
            descLabel.text = model.desc
            iconImageView.image = UIImage(named: model.iconImageName)
        }
    }
    
}
