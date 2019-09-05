//
//  DetailViewController.swift
//  AppStoreDemo
//
//  Created by Allen long on 2019/8/7.
//  Copyright © 2019 Utimes. All rights reserved.
//

import UIKit

fileprivate let navigationViewH: CGFloat = statusBarH + navigationBarH
fileprivate let tableViewTopInset: CGFloat = 200
fileprivate let topImageViewHeight: CGFloat = 288
fileprivate let originalContentOffSetY: CGFloat = tableViewTopInset + statusBarH
fileprivate let alphaChangeProgress: CGFloat = (hasTopNotch() ? 112 : 84)

class DetailViewController: UIViewController {
    
    lazy var navigationView: DetailNavigationView = {
        let it = DetailNavigationView()
        it.frame = CGRect(x: 0, y: 0, width: kScreenW, height: navigationViewH)
        return it
    }()
    
    lazy var tableView: UITableView = {
        let it = UITableView()
        it.frame = CGRect(x: 0, y: -statusBarH, width: kScreenW, height: kScreenH + statusBarH)
        it.backgroundColor = .white
        it.delegate = self
        it.dataSource = self
        it.contentInset = UIEdgeInsets(top: tableViewTopInset, left: 0, bottom: 0, right: 0)
        it.separatorInset = UIEdgeInsets(top: 0, left: GlobalConstants.leftMargin, bottom: 0, right: GlobalConstants.leftMargin)
        it.ut_registerNibCell(DetailTopInfoCell.self)
        it.ut_registerNibCell(DetailNewFeaturesCell.self)
        it.ut_registerClassCell(DetailPreviewCell.self)
        it.ut_registerClassCell(DetailInformationCell.self)
        return it
    }()
    
    lazy var topImageView: UIImageView = {
        let it = UIImageView()
        it.image = #imageLiteral(resourceName: "cover_detail")
        it.contentMode = .scaleAspectFill
        it.frame = CGRect(x: 0, y: -(topImageViewHeight) , width: kScreenW, height: topImageViewHeight)
        it.layer.masksToBounds = true
        return it
    }()
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.interactivePopGestureRecognizer?.delegate = nil
        tableView.addSubview(topImageView)
        view.addSubview(tableView)
        
        view.addSubview(navigationView)
        navigationView.goBackClosure = { [weak self] in
            guard let StrongSelf = self else { return }
            StrongSelf.navigationController?.popViewController(animated: true)
        }
    }
    

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)
        setStatusBarColor(UIColor.white.withAlphaComponent(0))
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        setStatusBarColor(.white)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        navigationController?.interactivePopGestureRecognizer?.isEnabled = true
    }
    
    
    
}

extension DetailViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            let cell = tableView.ut_dequeueReusable(DetailTopInfoCell.self, for: indexPath)
            cell.selectionStyle = .none
            return cell
        case 1:
            let cell = tableView.ut_dequeueReusable(DetailNewFeaturesCell.self, for: indexPath)
            cell.selectionStyle = .none
            return cell
        case 2:
            let cell = tableView.ut_dequeueReusable(DetailPreviewCell.self, for: indexPath)
            cell.selectionStyle = .none
            return cell
        case 3:
            let cell = tableView.ut_dequeueReusable(DetailInformationCell.self, for: indexPath)
            cell.selectionStyle = .none
            return cell
        default:
            return UITableViewCell()
        }
    }
}

extension DetailViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case 0:
            return 230
        case 1:
            return 168
        case 2:
            return 227
        case 3:
            return 520
        default:
            return 0
        }
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        var offSetY = scrollView.contentOffset.y

        // change topImageView frame
        if offSetY < -originalContentOffSetY {
            topImageView.frame.origin.y = offSetY - (hasTopNotch() ? 44 : 64)
            topImageView.frame.size.height = -(offSetY - (hasTopNotch() ? 44 : 64))
        }
        
        // change navigationView backgroundColor and goBackBtn color
        //deal with offsetY to make sure alpha from 0 to 1
        if offSetY > -(originalContentOffSetY - alphaChangeProgress) {
            offSetY = -(originalContentOffSetY - alphaChangeProgress)
        } else if offSetY < -originalContentOffSetY {
            offSetY = -originalContentOffSetY
        }
        
        let calculateY = offSetY + originalContentOffSetY
        
        navigationView.backgroundColor = UIColor.white.withAlphaComponent(calculateY/alphaChangeProgress)
        
        // values of targetRed and targetGreen are from GlobalConstants.textBlueColor
        // blue is still 255.0, so we do not neet to change it
        let targetRed: CGFloat = 0
        let targetGreen: CGFloat = 122
        
        let color = UIColor(red: (255 - ((255.0 - targetRed)/alphaChangeProgress) * calculateY) / 255.0, green: (255 - ((255.0 - targetGreen)/alphaChangeProgress) * calculateY) / 255.0, blue: 255.0/255.0, alpha: 1)
        
        navigationView.goBackBtn.setTitleColor(color, for: .normal)
        navigationView.goBackBtn.tintColor = color
    }
}
