//
//  ArcLayer.swift
//  Weeks2
//
//  Created by Jonathan Ma on 5/2/16.
//  Copyright © 2016 Jonathan Ma. All rights reserved.
//


import UIKit

class ArcLayer: CAShapeLayer {
    
    let animationDuration: CFTimeInterval = 0.20
    
    override init() {
        super.init()
        fillColor = Colors.orange.CGColor
        path = arcPathStarting.CGPath
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var arcPathPre: UIBezierPath {
        let defaults = NSUserDefaults.standardUserDefaults()
        let width = defaults.objectForKey("width") as? CGFloat ?? CGFloat()
        let height = defaults.objectForKey("height") as? CGFloat ?? CGFloat()
        
        let widthd = Double(width)
        let heightd = Double(height)

        let arcPath = UIBezierPath()
        arcPath.moveToPoint(CGPoint(x: 0.0, y: heightd))
        arcPath.addLineToPoint(CGPoint(x: 0.0, y: heightd - 1))
        arcPath.addLineToPoint(CGPoint(x: widthd, y: heightd - 1))
        arcPath.addLineToPoint(CGPoint(x: widthd, y: heightd))
        arcPath.addLineToPoint(CGPoint(x: 0.0, y: heightd))
        arcPath.closePath()
        return arcPath
    }
    
    var arcPathStarting: UIBezierPath {
        let defaults = NSUserDefaults.standardUserDefaults()
        let width = defaults.objectForKey("width") as? CGFloat ?? CGFloat()
        let height = defaults.objectForKey("height") as? CGFloat ?? CGFloat()
        let userAge = defaults.objectForKey("userAge") as? Int ?? Int()
        
        var percent90d = 0.0
        percent90d = (0 + (Double(userAge) / 90))
        let widthd = Double(width)
        let heightd = Double(height) * percent90d
        let heightn = Double(height)
        
        let arcPath = UIBezierPath()
        arcPath.moveToPoint(CGPoint(x: 0.0, y: heightn))
        arcPath.addLineToPoint(CGPoint(x: 0.0, y: (heightn-(heightd * 0.20))))
        arcPath.addCurveToPoint(CGPoint(                        x: widthd,        y: (heightn-(heightd * 0.20))),
                                        controlPoint1: CGPoint( x: widthd * 0.30, y: (heightn-(heightd * 0.25))),
                                        controlPoint2: CGPoint( x: widthd * 0.40, y: (heightn-(heightd * 0.10))))
        arcPath.addLineToPoint(CGPoint(x: widthd, y: heightn))
        arcPath.addLineToPoint(CGPoint(x: 0.0, y: heightn))
        arcPath.closePath()
        return arcPath
    }
    
    var arcPathLow: UIBezierPath {
        let defaults = NSUserDefaults.standardUserDefaults()
        let width = defaults.objectForKey("width") as? CGFloat ?? CGFloat()
        let height = defaults.objectForKey("height") as? CGFloat ?? CGFloat()
        let userAge = defaults.objectForKey("userAge") as? Int ?? Int()
        
        var percent90d = 0.0
        percent90d = (0 + (Double(userAge) / 90))
        let widthd = Double(width)
        let heightd = Double(height) * percent90d
        let heightn = Double(height)

        let arcPath = UIBezierPath()
        arcPath.moveToPoint(CGPoint(x: 0.0, y: heightn))
        arcPath.addLineToPoint(CGPoint(x: 0.0, y: (heightn-(heightd * 0.40))))
        arcPath.addCurveToPoint(CGPoint(                 x: widthd,        y: (heightn-(heightd * 0.40))),
                                controlPoint1: CGPoint(  x: widthd * 0.35, y: (heightn-(heightd * 0.35))),
                                controlPoint2: CGPoint(  x: widthd * 0.55, y: (heightn-(heightd * 0.50))))
        arcPath.addLineToPoint(CGPoint(x: widthd, y: heightn))
        arcPath.addLineToPoint(CGPoint(x: 0.0, y: heightn))
        arcPath.closePath()
        return arcPath
    }
    
    var arcPathMid: UIBezierPath {
        let defaults = NSUserDefaults.standardUserDefaults()
        let width = defaults.objectForKey("width") as? CGFloat ?? CGFloat()
        let height = defaults.objectForKey("height") as? CGFloat ?? CGFloat()
        let userAge = defaults.objectForKey("userAge") as? Int ?? Int()
        
        var percent90d = 0.0
        percent90d = (0 + (Double(userAge) / 90))
        let widthd = Double(width)
        let heightd = Double(height) * percent90d
        let heightn = Double(height)
        
        let arcPath = UIBezierPath()
        arcPath.moveToPoint(CGPoint(x: 0.0, y: heightn))
        arcPath.addLineToPoint(CGPoint(x: 0.0, y: (heightn-(heightd * 0.60))))
        arcPath.addCurveToPoint(CGPoint(                 x: widthd,        y: (heightn-(heightd * 0.60))),
                                controlPoint1: CGPoint(  x: widthd * 0.30, y: (heightn-(heightd * 0.65))),
                                controlPoint2: CGPoint(  x: widthd * 0.40, y: (heightn-(heightd * 0.55))))
        arcPath.addLineToPoint(CGPoint(x: widthd, y: heightn))
        arcPath.addLineToPoint(CGPoint(x: 0.0, y: heightn))
        arcPath.closePath()
        return arcPath
    }
    
    var arcPathHigh: UIBezierPath {
        let defaults = NSUserDefaults.standardUserDefaults()
        let width = defaults.objectForKey("width") as? CGFloat ?? CGFloat()
        let height = defaults.objectForKey("height") as? CGFloat ?? CGFloat()
        let userAge = defaults.objectForKey("userAge") as? Int ?? Int()
        
        var percent90d = 0.0
        percent90d = (0 + (Double(userAge) / 90))
        let widthd = Double(width)
        let heightd = Double(height) * percent90d
        let heightn = Double(height)
        
        let arcPath = UIBezierPath()
        arcPath.moveToPoint(CGPoint(x: 0.0, y: heightn))
        arcPath.addLineToPoint(CGPoint(x: 0.0, y: (heightn-(heightd * 0.80))))
        arcPath.addCurveToPoint(CGPoint(                x: widthd,        y: (heightn-(heightd * 0.80))),
                                controlPoint1: CGPoint( x: widthd * 0.30, y: (heightn-(heightd * 0.70))),
                                controlPoint2: CGPoint( x: widthd * 0.40, y: (heightn-(heightd * 0.90))))
        arcPath.addLineToPoint(CGPoint(x: widthd, y: heightn))
        arcPath.addLineToPoint(CGPoint(x: 0.0, y: heightn))
        arcPath.closePath()
        return arcPath
    }
    
    var arcPathComplete: UIBezierPath {
        let defaults = NSUserDefaults.standardUserDefaults()
        let width = defaults.objectForKey("width") as? CGFloat ?? CGFloat()
        let height = defaults.objectForKey("height") as? CGFloat ?? CGFloat()
        let userAge = defaults.objectForKey("userAge") as? Int ?? Int()

        var percent90d = 0.0
        percent90d = (0 + (Double(userAge) / 90))
        let widthd = Double(width)
        let heightd = Double(height) * percent90d
        let heightn = Double(height)

        let arcPath = UIBezierPath()
        arcPath.moveToPoint(CGPoint(x: 0.0, y: heightn))
        arcPath.addLineToPoint(CGPoint(x: 0.0, y: heightd))
        arcPath.addLineToPoint(CGPoint(x:  widthd, y: heightd))
        arcPath.addLineToPoint(CGPoint(x:  widthd, y: heightn))
        arcPath.addLineToPoint(CGPoint(x: 0.0, y: heightn))
        arcPath.closePath()
        return arcPath
    }
    
    func animate() {
        let arcAnimationPre: CABasicAnimation = CABasicAnimation(keyPath: "path")
        arcAnimationPre.fromValue = arcPathPre.CGPath
        arcAnimationPre.toValue = arcPathStarting.CGPath
        arcAnimationPre.beginTime = 0.0
        arcAnimationPre.duration = animationDuration
        
        let arcAnimationLow: CABasicAnimation = CABasicAnimation(keyPath: "path")
        arcAnimationLow.fromValue = arcPathStarting.CGPath
        arcAnimationLow.toValue = arcPathLow.CGPath
        arcAnimationLow.beginTime = arcAnimationPre.beginTime + arcAnimationPre.duration
        arcAnimationLow.duration = animationDuration
        
        let arcAnimationMid: CABasicAnimation = CABasicAnimation(keyPath: "path")
        arcAnimationMid.fromValue = arcPathLow.CGPath
        arcAnimationMid.toValue = arcPathMid.CGPath
        arcAnimationMid.beginTime = arcAnimationLow.beginTime + arcAnimationLow.duration
        arcAnimationMid.duration = animationDuration
        
        let arcAnimationHigh: CABasicAnimation = CABasicAnimation(keyPath: "path")
        arcAnimationHigh.fromValue = arcPathMid.CGPath
        arcAnimationHigh.toValue = arcPathHigh.CGPath
        arcAnimationHigh.beginTime = arcAnimationMid.beginTime + arcAnimationMid.duration
        arcAnimationHigh.duration = animationDuration
        
        let arcAnimationComplete: CABasicAnimation = CABasicAnimation(keyPath: "path")
        arcAnimationComplete.fromValue = arcPathHigh.CGPath
        arcAnimationComplete.toValue = arcPathComplete.CGPath
        arcAnimationComplete.beginTime = arcAnimationHigh.beginTime + arcAnimationHigh.duration
        arcAnimationComplete.duration = animationDuration

        
        let arcAnimationGroup: CAAnimationGroup = CAAnimationGroup()
        arcAnimationGroup.animations = [arcAnimationPre, arcAnimationLow, arcAnimationMid,
                    arcAnimationHigh, arcAnimationComplete]
        arcAnimationGroup.duration = arcAnimationComplete.beginTime + arcAnimationComplete.duration
        arcAnimationGroup.fillMode = kCAFillModeForwards
        arcAnimationGroup.removedOnCompletion = false
        addAnimation(arcAnimationGroup, forKey: nil)
    }
}
