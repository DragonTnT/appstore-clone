//
//  DownloadTransitioning.swift
//  AppStoreDemo
//
//  Created by Allen long on 2019/9/5.
//  Copyright © 2019 Utimes. All rights reserved.
//

import UIKit

class DownloadTransitioning: NSObject {
    
    let isPresenting: Bool
    
    let transitionDuration: TimeInterval
    
    //a height make animation more smoother when dismissing
    let dismissHeight: CGFloat?
    
    init(isPresenting: Bool, transitionDuration: TimeInterval, dismissHeight: CGFloat? = nil) {
        self.isPresenting = isPresenting
        self.transitionDuration = transitionDuration
        self.dismissHeight = dismissHeight
        super.init()
    }
    
}

extension DownloadTransitioning: UIViewControllerAnimatedTransitioning {
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return transitionDuration
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
        if isPresenting {
            animationForPresent(using: transitionContext)
        } else {
            animationForDismiss(using: transitionContext)
        }
    }
}

// MARK: - Helper
extension DownloadTransitioning {
    
    private func animationForPresent(using transitionContext: UIViewControllerContextTransitioning) {
        
        guard let presentedVC = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.to) as? DownloadViewController else { return }
        guard let presentedView = transitionContext.view(forKey: UITransitionContextViewKey.to) else { return }
        let containerView = transitionContext.containerView
        // Position the presented view off the top of the container view
        presentedView.frame = transitionContext.finalFrame(for: presentedVC)
        presentedView.center.y += containerView.bounds.size.height
        
        containerView.addSubview(presentedView)
        
        
        UIView.animate(withDuration: transitionDuration, animations: {
            presentedView.center.y -= containerView.bounds.size.height
            presentedVC.clickView.frame.origin.x -= clickViewShowH
        }) { (completed) in
            transitionContext.completeTransition(completed)
        }
        
        delay(0.5) {
            presentedVC.clickView.startMoving()
        }
    }
    
    private func animationForDismiss(using transitionContext: UIViewControllerContextTransitioning) {
        guard let presentedVC = transitionContext.viewController(forKey: .from) as? DownloadViewController else { return }
        guard let presentedView = transitionContext.view(forKey: UITransitionContextViewKey.from) else { return }
        
        let containerView = transitionContext.containerView
        
        UIView.animate(withDuration: transitionDuration, animations: {
            
            if let height = self.dismissHeight {
                presentedView.center.y += height
            } else {
                presentedView.center.y += containerView.bounds.size.height
            }
            
            presentedVC.clickView.frame.origin.x += clickViewShowH
        }) { (completed) in
            transitionContext.completeTransition(completed)
            presentedVC.clickView.removeFromSuperview()
        }
        
        presentedVC.clickView.endMoving()
    }
}

fileprivate let clickViewShowH: CGFloat = GlobalConstants.doubleClickViewW - GlobalConstants.clickBarWidth


