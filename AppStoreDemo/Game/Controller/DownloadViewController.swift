//
//  DownloadViewController.swift
//  AppStoreDemo
//
//  Created by Allen long on 2019/9/5.
//  Copyright © 2019 Utimes. All rights reserved.
//

import UIKit

class DownloadViewController: UIViewController {
    
    var model: GameTopicModel?
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nil, bundle: nil)
        modalPresentationStyle = .custom
        transitioningDelegate = self        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setStatusBarColor(UIColor.white.withAlphaComponent(0))
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        setStatusBarColor(.white)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let model = model {
            bottomView.model = model
        }
        
        view.addSubview(bottomView)
        
        if #available(iOS 13.0, *) {
            //在iOS13上，获取keywindow后，并不能将clickView加到屏幕最上方，因此将它加到view上。但这时的弹出动画就与系统不一样了。
            //如果有知道如何做的朋友，麻烦给我提个issue，谢了
            view.addSubview(clickView)
        } else {
            keyWindow.addSubview(clickView)
        }
        
        
        
    }
    
    private lazy var bottomView: DownloadBottomView = {
        let view = DownloadBottomView.loadViewFromNib()
        let height = 260 + tabbarExtraH
        view.frame = CGRect(x: 0, y: kScreenH - height, width: kScreenW, height: height)
        view.delegate = self
        return view
    }()
    
    lazy var clickView: DownloadClickView = {
        let view = DownloadClickView.loadViewFromNib()
        view.frame = CGRect(x: kScreenW, y: 168, width: GlobalConstants.doubleClickViewW, height: 110)
        return view
    }()
    
}

extension DownloadViewController: DownloadBottomViewDelegate {
    func downloadBottomViewDidClickCancel(_ bottomView: DownloadBottomView) {
        dismiss(animated: true, completion: nil)
    }
}

extension DownloadViewController: UIViewControllerTransitioningDelegate {
    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        if presented == self {
            return DownloadPresentationController(presentedViewController: presented, presenting: presenting)
        }
        return nil
    }

    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return DownloadTransitioning(isPresenting: true, transitionDuration: 0.3)
    }

    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return DownloadTransitioning(isPresenting: false, transitionDuration: 0.3)
    }
}
