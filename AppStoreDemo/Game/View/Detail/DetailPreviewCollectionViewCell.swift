//
//  DetailPreviewCollectionViewCell.swift
//  AppStoreDemo
//
//  Created by Allen long on 2019/8/8.
//  Copyright © 2019 Utimes. All rights reserved.
//

import UIKit

class DetailPreviewCollectionViewCell: UICollectionViewCell {
    
    let coverImageView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        coverImageView.frame = CGRect(x: 0, y: 0, width: self.frame.width, height: GlobalConstants.detailPreviewImageH)
        coverImageView.cornerRadius = 14.0
        coverImageView.contentMode = .scaleAspectFill
        contentView.addSubview(coverImageView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
