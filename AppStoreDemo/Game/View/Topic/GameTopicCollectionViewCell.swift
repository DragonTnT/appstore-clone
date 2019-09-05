//
//  GameTopicCollectionViewCell.swift
//  AppStoreDemo
//
//  Created by Allen long on 2019/8/6.
//  Copyright © 2019 Utimes. All rights reserved.
//

import UIKit

protocol GameTopicCollectionViewCellDelegate: class {
    func gameTopicCollectionViewCellDidClickGet(_ topicCell: GameTopicCollectionViewCell)
}

class GameTopicCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    @IBOutlet weak var lineView: UIView!
    
    weak var delegate: GameTopicCollectionViewCellDelegate?
    
    var model: GameTopicModel! {
        didSet {
            iconImageView.image = UIImage(named: model.iconImageName)
            nameLabel.text = model.name
            descLabel.text = model.desc
        }
    }
    
    
    @IBAction func getAction(_ sender: UIButton) {
        delegate?.gameTopicCollectionViewCellDidClickGet(self)
    }
}
