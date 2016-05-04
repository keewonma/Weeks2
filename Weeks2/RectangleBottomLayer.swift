//
//  RectangleBottomLayer.swift
//  Weeks2
//
//  Created by Jonathan Ma on 5/4/16.
//  Copyright © 2016 Jonathan Ma. All rights reserved.
//

import UIKit

class RectangleBottomLayer: CAShapeLayer {
    
    override init() {
        super.init()
        fillColor = Colors.orange.CGColor
        lineWidth = 5.0
        path = rectanglePathFull.CGPath
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var rectanglePathFull: UIBezierPath {
        let defaults = NSUserDefaults.standardUserDefaults()
        let width = defaults.objectForKey("width") as? CGFloat ?? CGFloat()
        let height = defaults.objectForKey("height") as? CGFloat ?? CGFloat()
        let userAge = defaults.objectForKey("userAge") as? Int ?? Int()
        
        var percent90d = 0.0
        percent90d = (0 + (Double(userAge) / 90))
        
        let widthd = Double(width)
        let heightd = Double(height) * percent90d
        
        let rectanglePath = UIBezierPath()
            rectanglePath.moveToPoint(CGPoint(x: 0.0, y: 0.0))
            rectanglePath.addLineToPoint(CGPoint(x: 0.0, y: heightd * 0.99 ))
            rectanglePath.addLineToPoint(CGPoint(x: widthd, y: heightd * 0.99))
            rectanglePath.addLineToPoint(CGPoint(x: widthd, y: heightd))
            rectanglePath.addLineToPoint(CGPoint(x: 0.0, y: heightd))
            rectanglePath.closePath()
            rectanglePath.closePath()
        return rectanglePath
    }
    
    func animateStrokeWithColor(color: UIColor) {
        strokeColor = color.CGColor
        let strokeAnimation: CABasicAnimation = CABasicAnimation(keyPath: "strokeEnd")
        strokeAnimation.fromValue = 0.0
        strokeAnimation.toValue = 1.0
        strokeAnimation.duration = 1.0
        addAnimation(strokeAnimation, forKey: nil)
    }
}
