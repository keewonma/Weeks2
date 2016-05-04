//
//  ContainerView.swift
//  Weeks2
//
//  Created by Jonathan Ma on 5/2/16.
//  Copyright © 2016 Jonathan Ma. All rights reserved.
//


import UIKit

protocol HolderViewDelegate:class {
    func animateLabel()
}

class HolderView: UIView {
    
    let redRectangleLayer = RectangleLayer()
    let blackRectangleLayer = RectangleLayer()
    let arcLayer = ArcLayer()
    let arcWeek = ArcWeek()
    
    var parentFrame :CGRect = CGRectZero
    weak var delegate: HolderViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = Colors.clear
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func addRect() {
        NSTimer.scheduledTimerWithTimeInterval(0.1,
                                               target: self,
                                               selector: #selector(HolderView.drawRedAnimatedRectangle),
                                               userInfo: nil, repeats: false)
        NSTimer.scheduledTimerWithTimeInterval(0.3,
                                               target: self,
                                               selector: #selector(HolderView.drawBlackAnimatedRectangle),
                                               userInfo: nil, repeats: false)

    }
    
    func drawRedAnimatedRectangle() {
        layer.addSublayer(redRectangleLayer)
        redRectangleLayer.animateStrokeWithColor(Colors.red)
        NSTimer.scheduledTimerWithTimeInterval(0.55, target: self, selector: #selector(HolderView.drawArc),
            userInfo: nil, repeats: false)
        
    }
    
    func drawBlackAnimatedRectangle() {
        layer.addSublayer(blackRectangleLayer)
        blackRectangleLayer.animateStrokeWithColor(Colors.darkgray)
    }
    

    func drawArc() {
        layer.addSublayer(arcLayer)
        arcLayer.animate()
        NSTimer.scheduledTimerWithTimeInterval(1.00, target: self, selector: #selector(HolderView.drawArcWeek),
                                               userInfo: nil, repeats: false)
    }
    
    func drawArcWeek() {
        layer.addSublayer(arcWeek)
        arcWeek.animate()
    }


}