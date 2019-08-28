//
//  DetailPreviewCell.swift
//  AppStoreDemo
//
//  Created by Allen long on 2019/8/8.
//  Copyright © 2019 Utimes. All rights reserved.
//

import UIKit

class DetailPreviewCell: UITableViewCell {
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        contentView.addSubview(headerView)
        contentView.addSubview(collectionView)
    }
    
    private lazy var headerView: CommonSectionHeaderView = {
        let frame = CGRect(x: 0, y: 0, width: kScreenW, height: 42)
        let it = CommonSectionHeaderView(frame: frame)
        it.changeSectionTitle(with: "Review")
        it.lineView.isHidden = true
        return it
    }()
    
    private lazy var collectionView: DetailPreviewCollectionView = {
        let itemSize = CGSize(width: kScreenW - 2 * GlobalConstants.leftMargin, height: GlobalConstants.detailPreviewImageH)
        let frame = CGRect(x: 0, y: 52, width: kScreenW, height: GlobalConstants.detailPreviewImageH)
        let layout = CommonCollectionFlowLayout(itemSize: itemSize)
        let collectionView = DetailPreviewCollectionView(frame: frame, collectionViewLayout: layout)
        collectionView.dataSource = self
        collectionView.delegate = self
        return collectionView
    }()

}

extension DetailPreviewCell: UICollectionViewDataSource,UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.ut_dequeueReusable(DetailPreviewCollectionViewCell.self, for: indexPath)
        cell.coverImageView.image = UIImage(named: dataSource[indexPath.item])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
}

fileprivate let dataSource: [String] = [
    "cover_detail1",
    "cover_detail2",
    "cover_detail"
]
