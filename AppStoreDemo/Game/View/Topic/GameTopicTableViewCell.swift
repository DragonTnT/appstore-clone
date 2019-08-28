//
//  GameTopicTableViewCell.swift
//  AppStoreDemo
//
//  Created by Allen long on 2019/8/6.
//  Copyright © 2019 Utimes. All rights reserved.
//

import UIKit

class GameTopicTableViewCell: UITableViewCell {
    
    var detailClosure: (()->())?

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        contentView.addSubview(headerView)
        contentView.addSubview(topicCollectionView)
    }
    
    private lazy var headerView: CommonSectionHeaderView = {
        let frame = CGRect(x: 0, y: 0, width: kScreenW, height: 42)
        let it = CommonSectionHeaderView(frame: frame)
        it.changeSectionTitle(with: "What We're Playing")
        return it
    }()
    
    private lazy var topicCollectionView: GameTopicCollectionView = {
        let itemSize = CGSize(width: kScreenW - 2 * GlobalConstants.leftMargin, height: 80)
        let frame = CGRect(x: 0, y: 42, width: kScreenW, height: 80 * 3)
        let layout = CommonCollectionFlowLayout(itemSize: itemSize)
        let collectionView = GameTopicCollectionView(frame: frame, collectionViewLayout: layout)
        collectionView.dataSource = self
        collectionView.delegate = self
        return collectionView
    }()
}

extension GameTopicTableViewCell: UICollectionViewDataSource,UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == topicCollectionView {
            return TopicDataSource.count
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == topicCollectionView {
            let cell = collectionView.ut_dequeueReusable(GameTopicCollectionViewCell.self, for: indexPath)
            cell.model = TopicDataSource[indexPath.row]
            cell.lineView.isHidden = (((indexPath.row + 1) % 3 == 0) || (indexPath.row == TopicDataSource.count - 1))
            return cell
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        detailClosure?()
    }
}

fileprivate let TopicDataSource: [GameTopicModel] = [
    GameTopicModel(name: "Bullet Hell", desc: "Casual", iconImageName: "logo_broadcast"),
    GameTopicModel(name: "Hot Wheels", desc: "Strategy", iconImageName: "logo_car"),
    GameTopicModel(name: "SpellForce - Heroes", desc: "Card", iconImageName: "logo_jump"),
    GameTopicModel(name: "Farm Punks", desc: "Role-Playing", iconImageName: "logo_smile"),
    GameTopicModel(name: "Super Spinball", desc: "A musical journey awaits", iconImageName: "logo_weibo"),
]
