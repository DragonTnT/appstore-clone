//
//  TodayAnimationTransition.swift
//  AppStoreDemo
//
//  Created by Allen long on 2019/7/31.
//  Copyright © 2019 Utimes. All rights reserved.
//

import UIKit

fileprivate let transitonDuration: TimeInterval = 1.0


enum AnimationType {
    case present
    case dismiss
}

class TodayAnimationTransition: NSObject {
    let animationType: AnimationType!
    
    init(animationType: AnimationType) {
        self.animationType = animationType
        super.init()
    }
}

extension TodayAnimationTransition: UIViewControllerAnimatedTransitioning {
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return transitonDuration
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        if animationType == .present {
            animationForPresent(using: transitionContext)
        } else {
            animationForDismiss(using: transitionContext)
        }
    }
    
    func animationForPresent(using transitionContext: UIViewControllerContextTransitioning) {
        let containerView = transitionContext.containerView
        //1.Get fromVC and toVC
        guard let fromVC = transitionContext.viewController(forKey: .from) as? UITabBarController else { return }
        guard let tableViewController = fromVC.viewControllers?.first as? TodayViewController else { return }
        guard let toVC = transitionContext.viewController(forKey: .to) as? CardDetailViewController else { return }
        guard let selectedCell = tableViewController.selectedCell else { return }
        
        let frame = selectedCell.convert(selectedCell.bgBackView.frame, to: fromVC.view)        
        //2.Set presentation original size.
        toVC.view.frame = frame
        toVC.scrollView.imageView.frame.size.width = GlobalConstants.todayCardSize.width
        toVC.scrollView.imageView.frame.size.height = GlobalConstants.todayCardSize.height
        
        containerView.addSubview(toVC.view)
        containerView.addSubview(fromVC.tabBar)
        
        //3.Change original size to final size with animation.
        UIView.animate(withDuration: transitonDuration, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0, options: [], animations: {
            toVC.view.frame = UIScreen.main.bounds
            toVC.scrollView.imageView.frame.size.width = kScreenW
            toVC.scrollView.imageView.frame.size.height = GlobalConstants.cardDetailTopImageH
            toVC.closeBtn.alpha = 1
            fromVC.tabBar.frame = CGRect(x: 0, y: kScreenH, width: kScreenW, height: fromVC.tabBar.frame.height)
        }) { (completed) in
            transitionContext.completeTransition(completed)
        }
    }
    
    func animationForDismiss(using transitionContext: UIViewControllerContextTransitioning) {
        guard let fromVC = transitionContext.viewController(forKey: .from) as? CardDetailViewController else { return }
        guard let toVC = transitionContext.viewController(forKey: .to) as? UITabBarController else { return }
        guard let tableViewController = toVC.viewControllers?.first as? TodayViewController else { return }
        guard let selectedCell = tableViewController.selectedCell else { return }
        
        UIView.animate(withDuration: transitonDuration - 0.3, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: [], animations: {
            let frame = selectedCell.convert(selectedCell.bgBackView.frame, to: toVC.view)
            fromVC.view.frame = frame
            fromVC.view.layer.cornerRadius = GlobalConstants.toDayCardCornerRadius
            fromVC.scrollView.imageView.frame.size.width = GlobalConstants.todayCardSize.width
            fromVC.scrollView.imageView.frame.size.height = GlobalConstants.todayCardSize.height
            fromVC.closeBtn.alpha = 0
            
            toVC.tabBar.frame = CGRect(x: 0, y: kScreenH - toVC.tabBar.frame.height, width: kScreenW, height: toVC.tabBar.frame.height)

        }) { (completed) in
            transitionContext.completeTransition(completed)
            toVC.view.addSubview(toVC.tabBar)
        }
    }
    
    
    //有关tabbar的动画：
    //在present动画时，将tabbar加入到containerView中，并增加它的origin.y，让它移除屏幕
    //在dismiss动画时，减少tabbar的origin.y,将它移回屏幕下方，并添加回tabbarcontroller的view里，
}
