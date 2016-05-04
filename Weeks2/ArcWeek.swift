//
//  ArcWeek.swift
//  Weeks2
//
//  Created by Jonathan Ma on 5/5/16.
//  Copyright © 2016 Jonathan Ma. All rights reserved.
//

import UIKit

class ArcWeek: CAShapeLayer {
    
    let animationDuration: CFTimeInterval = 0.05
    
    override init() {
        super.init()
        fillColor = Colors.red.CGColor
        path = arcPathComplete.CGPath
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var arcPathComplete: UIBezierPath {
        let defaults = NSUserDefaults.standardUserDefaults()
        let width = defaults.objectForKey("width") as? CGFloat ?? CGFloat()
        let height = defaults.objectForKey("height") as? CGFloat ?? CGFloat()
        let userAge = defaults.objectForKey("userAge") as? Int ?? Int()
        
        let userWeeksTilNextBirthday = defaults.objectForKey("userWeeksTilNextBirthday") as? Int ?? Int()
        
        var percent90d = 0.0
        let widthd = Double(width)
        
        let percent52d = ((52.0 - Double(userWeeksTilNextBirthday)) / 52.0) * widthd
        percent90d = (0 + (Double(userAge) / 90))
        let heightd = Double(height) * percent90d
        
        print(percent52d)
        print(userWeeksTilNextBirthday)
        print(percent52d * widthd)
        
        if percent52d == 52
        {
            let arcPath = UIBezierPath()
            arcPath.moveToPoint(CGPoint(x: 0.0, y: heightd))
            arcPath.addLineToPoint(CGPoint(x: 0.0, y: heightd - 10))
            arcPath.addLineToPoint(CGPoint(x:  10, y: heightd - 10))
            arcPath.addLineToPoint(CGPoint(x:  10, y: heightd))
            arcPath.addLineToPoint(CGPoint(x: 0.0, y: heightd))
            arcPath.closePath()
            return arcPath
        }
        else
        {
            let arcPath = UIBezierPath()
            arcPath.moveToPoint(CGPoint(x: 0.0, y: heightd))
            arcPath.addLineToPoint(CGPoint(x: 0.0, y: heightd - 5))
            arcPath.addLineToPoint(CGPoint(x:  percent52d, y: heightd - 5))
            arcPath.addLineToPoint(CGPoint(x:  percent52d, y: heightd))
            arcPath.addLineToPoint(CGPoint(x: 0.0, y: heightd))
            arcPath.closePath()
            return arcPath
        }
    }
    
    func animate() {
        
        let arcAnimationComplete: CABasicAnimation = CABasicAnimation(keyPath: "path")
        arcAnimationComplete.fromValue = arcPathComplete.CGPath
        arcAnimationComplete.toValue = arcPathComplete.CGPath
        arcAnimationComplete.beginTime = arcAnimationComplete.beginTime + arcAnimationComplete.duration
        arcAnimationComplete.duration = animationDuration
        
        let arcAnimationGroup: CAAnimationGroup = CAAnimationGroup()
        arcAnimationGroup.animations = [arcAnimationComplete]
        arcAnimationGroup.duration = arcAnimationComplete.beginTime + arcAnimationComplete.duration
        arcAnimationGroup.fillMode = kCAFillModeForwards
        arcAnimationGroup.removedOnCompletion = false
        addAnimation(arcAnimationGroup, forKey: nil)
    }
    
    
}