//
//  UIColor+Extension.swift
//  AppStoreDemo
//
//  Created by Allen long on 2019/8/5.
//  Copyright © 2019 Utimes. All rights reserved.
//

import UIKit

extension UIColor {
    convenience init(r: CGFloat, g: CGFloat, b: CGFloat, alpha: CGFloat = 1.0) {
        self.init(red: r/255.0, green: g/255.0, blue: b/255.0, alpha: alpha)
    }
}
