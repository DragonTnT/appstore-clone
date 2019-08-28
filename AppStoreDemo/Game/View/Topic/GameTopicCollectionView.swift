//
//  GameTopicCollectionView.swift
//  AppStoreDemo
//
//  Created by Allen long on 2019/8/6.
//  Copyright © 2019 Utimes. All rights reserved.
//

import UIKit

class GameTopicCollectionView: UICollectionView {

    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
        config()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func config() {
        backgroundColor = .white
        
        decelerationRate = UIScrollView.DecelerationRate.fast
        ut_registerNibCell(GameTopicCollectionViewCell.self)
        showsHorizontalScrollIndicator = false
    }

}
