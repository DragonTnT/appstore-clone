//
//  DownloadClickView.swift
//  AppStoreDemo
//
//  Created by Allen long on 2019/9/5.
//  Copyright © 2019 Utimes. All rights reserved.
//

import UIKit

class DownloadClickView: UIView,NibLoadable {
    
    var timer: Timer?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    func startMoving() {
        timer = Timer(timeInterval: 1.5, repeats: true, block: { _ in
            self.animations()
        })
        timer?.fire()
        RunLoop.main.add(timer!, forMode: .default)
    }
    
    func endMoving() {
        timer?.invalidate()
        timer = nil
    }
    
    private func animations() {
        UIView.animateKeyframes(withDuration: 1, delay: 0, options: [], animations: {
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.25, animations: {
                self.frame.origin.x -= GlobalConstants.clickBarWidth
            })
            UIView.addKeyframe(withRelativeStartTime: 0.25, relativeDuration: 0.5, animations: {
                self.frame.origin.x += GlobalConstants.clickBarWidth
            })
            UIView.addKeyframe(withRelativeStartTime: 0.5, relativeDuration: 0.75, animations: {
                self.frame.origin.x -= GlobalConstants.clickBarWidth
            })
            UIView.addKeyframe(withRelativeStartTime: 0.75, relativeDuration: 1.0, animations: {
                self.frame.origin.x += GlobalConstants.clickBarWidth
            })
        }, completion: nil)

    }

}
