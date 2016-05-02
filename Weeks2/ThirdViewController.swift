//
//  ThirdViewController.swift
//  Weeks2
//
//  Created by Jonathan Ma on 5/2/16.
//  Copyright © 2016 Jonathan Ma. All rights reserved.
//
import UIKit

class ThirdViewController: UIViewController, HolderViewDelegate {
    
    var holderView = HolderView(frame: CGRectZero)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = Colors.lightgray
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        addHolderView()
        holderView.addRect()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    func addHolderView() {
        let defaults = NSUserDefaults.standardUserDefaults()
        
//        holderView.frame = CGRect(x: view.bounds.width / 2 - boxSize / 2,
//            y: view.bounds.height / 2 - boxSize / 2,
//            width: boxSize,
//            height: boxSize)
        let boxSizeWidth = view.bounds.width - 100
        let boxSizeHeight = view.bounds.height - 100
        
        holderView.frame = CGRect(x: view.bounds.width / 2 - boxSizeWidth / 2,
            y: view.bounds.height / 2 - boxSizeHeight / 2,
            width: boxSizeWidth,
            height: boxSizeHeight)
        holderView.parentFrame = view.frame
        holderView.delegate = self
        view.addSubview(holderView)
        
        defaults.setValue(boxSizeWidth, forKey: "width")
        defaults.setValue(boxSizeHeight, forKey: "height")
    }
    
    func animateLabel() {
        // 1
        holderView.removeFromSuperview()
        view.backgroundColor = Colors.lightgray
        
        // 2
        let label: UILabel = UILabel(frame: view.frame)
        label.textColor = Colors.black
        label.font = UIFont(name: "Impact-Regular", size: 170.0)
        label.textAlignment = NSTextAlignment.Center
        label.text = "WEEKS"
        label.transform = CGAffineTransformScale(label.transform, 0.25, 0.25)
        view.addSubview(label)
        
        // 3
        UIView.animateWithDuration(0.4, delay: 0.0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.1, options: UIViewAnimationOptions.CurveEaseInOut,
            animations: ({
                label.transform = CGAffineTransformScale(label.transform, 4.0, 4.0)
            }), completion: { finished in
                self.addButton()
        })
    }
    
    func addButton() {
        let button = UIButton()
        button.frame = CGRectMake(0.0, 0.0, view.bounds.width, view.bounds.height)
        button.addTarget(self, action: "buttonPressed:", forControlEvents: .TouchUpInside)
        view.addSubview(button)
    }
    
    func buttonPressed(sender: UIButton!) {
        view.backgroundColor = Colors.white
        //    view.subviews.map({ $0.removeFromSuperview() })
        holderView = HolderView(frame: CGRectZero)
        addHolderView()
    }
}
