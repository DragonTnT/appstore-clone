//
//  UITableView+Extension.swift
//  AppStoreDemo
//
//  Created by Allen long on 2019/8/5.
//  Copyright © 2019 Utimes. All rights reserved.
//

import UIKit

extension UITableView {
    // 注册有nib的cell
    func ut_registerNibCell<T>(_ cellType: T.Type) where T: UITableViewCell {
        let nib = UINib(nibName: "\(cellType)", bundle: nil)
        let identifier = "\(cellType)"
        register(nib, forCellReuseIdentifier: identifier)
    }
    // 注册无nib的cell
    func ut_registerClassCell<T>(_ cellType: T.Type) where T: UITableViewCell {
        let identifier = "\(cellType)"
        register(cellType, forCellReuseIdentifier: identifier)
    }
    // 从缓存池池出队已经存在的 cell
    func ut_dequeueReusable<T: UITableViewCell>(_ cell: T.Type, for indexPath: IndexPath) -> T {
        let cell = dequeueReusableCell(withIdentifier: "\(T.self)", for: indexPath) as! T
        return cell
    }
    
    // 注册有nib的headerFooterView
    func ut_registerNibHeaderFooterView<T>(_ viewType: T.Type) where T: UITableViewHeaderFooterView {
        let nib = UINib(nibName: "\(viewType)", bundle: nil)
        let identifier = "\(viewType)"
        register(nib, forHeaderFooterViewReuseIdentifier: identifier)
    }
    
    // 注册无nib的headerFooterView
    func ut_registerClassHeaderFooterView<T>(_ viewType: T.Type) where T: UITableViewHeaderFooterView {
        let identifier = "\(viewType)"
        register(viewType, forHeaderFooterViewReuseIdentifier: identifier)
    }
    
    // 从缓存池里取出已注册的headerFooterView
    func ut_dequeueReusableHeaderFooterView<T: UITableViewHeaderFooterView>(_ view: T.Type) -> T {
        let headerFooterView = dequeueReusableHeaderFooterView(withIdentifier: "\(T.self)") as! T
        return headerFooterView
    }
}

extension UICollectionView {
    // 注册有nib的cell
    func ut_registerNibCell<T>(_ cellType: T.Type) where T: UICollectionViewCell {
        let nib = UINib(nibName: "\(cellType)", bundle: nil)
        let identifier = "\(cellType)"
        register(nib, forCellWithReuseIdentifier: identifier)
    }
    // 注册无nib的cell
    func ut_registerClassCell<T>(_ cellType: T.Type) where T: UICollectionViewCell {
        let identifier = "\(cellType)"
        register(cellType, forCellWithReuseIdentifier: identifier)
    }
    // 从缓存池池出队已经存在的 cell
    func ut_dequeueReusable<T: UICollectionViewCell>(_ cell: T.Type, for indexPath: IndexPath) -> T {
        let cell = dequeueReusableCell(withReuseIdentifier: "\(T.self)", for: indexPath) as! T
        return cell
    }
}
