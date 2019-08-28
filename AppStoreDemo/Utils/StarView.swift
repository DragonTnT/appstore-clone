//
//  StarView.swift
//  AppStoreDemo
//
//  Created by Allen long on 2019/8/8.
//  Copyright © 2019 Utimes. All rights reserved.
//

import UIKit

class StarView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        self.backgroundColor = UIColor.clear
        var points: [CGPoint] = []
        let context = UIGraphicsGetCurrentContext()
        context?.setStrokeColor(UIColor.clear.cgColor)
        let grayColor = UIColor(red: 123/255.0, green: 124/255.0, blue: 128/255.0, alpha: 1)
        context?.setFillColor(grayColor.cgColor)
        context?.setLineWidth(1)
        let radius = Float(self.bounds.width / 2)
        let angel = Double.pi * 2 / 5
        for i in 1...5 { //这里是获取五角星的五个定点的坐标点位置
            let x = Float(self.bounds.width / 2) - sinf(Float(i) * Float(angel)) * radius
            let y = Float(self.bounds.height / 2) - cosf(Float(i) * Float(angel)) * radius
            points.append(CGPoint(x: CGFloat(x), y: CGFloat(y)))
        }
        context?.move(to: points.first!)
        for i in 1...5 {
            let index = (2 * i) % 5
            context?.addLine(to: points[index])
        }
        context?.closePath()
        context?.drawPath(using: CGPathDrawingMode.fillStroke)
    }

}
