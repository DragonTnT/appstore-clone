//
//  RecommandCollectionViewCell.swift
//  AppStoreDemo
//
//  Created by Allen long on 2019/8/6.
//  Copyright © 2019 Utimes. All rights reserved.
//

import UIKit

class RecommandCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var featureLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    @IBOutlet weak var coverImageView: UIImageView!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    var model: GameRecommandModel! {
        didSet {
            featureLabel.text = model.feature
            nameLabel.text = model.name
            descLabel.text = model.desc
            coverImageView.image = UIImage(named: model.coverImageName)
        }
    }
}
