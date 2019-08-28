//
//  GameRecommandTableViewCell.swift
//  AppStoreDemo
//
//  Created by Allen long on 2019/8/6.
//  Copyright © 2019 Utimes. All rights reserved.
//

import UIKit

class GameRecommandTableViewCell: UITableViewCell {
    
    var detailClosure: (()->())?

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        contentView.addSubview(recommandCollectionView)
    }
    
    private lazy var recommandCollectionView: GameRecommandCollectionView = {
        let itemSize = CGSize(width: kScreenW - 2 * GlobalConstants.leftMargin, height: GlobalConstants.recommandHeight)
        let frame = CGRect(x: 0, y: 0, width: kScreenW, height: GlobalConstants.recommandHeight)
        let layout = CommonCollectionFlowLayout(itemSize: itemSize)
        let collectionView = GameRecommandCollectionView(frame: frame, collectionViewLayout: layout)
        collectionView.dataSource = self
        collectionView.delegate = self
        return collectionView
    }()

}

extension GameRecommandTableViewCell: UICollectionViewDataSource,UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == recommandCollectionView {
            return RecommandDataSource.count
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == recommandCollectionView {
            let cell = collectionView.ut_dequeueReusable(RecommandCollectionViewCell.self, for: indexPath)
            cell.model = RecommandDataSource[indexPath.row]
            return cell
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        detailClosure?()
    }
}

fileprivate let RecommandDataSource: [GameRecommandModel] = [
    GameRecommandModel(feature: "MAJOR UPDATE", name: "Onmyoji", desc: "Cards", coverImageName: "cover_1"),
    GameRecommandModel(feature: "NEW GAME", name: "Clash Royale", desc: "Strategy", coverImageName: "cover_2"),
    GameRecommandModel(feature: "REDISCOVER THIS", name: "Fantasy Westward Journey", desc: "Adventure", coverImageName: "cover_3")
]

