//
//  rootNavigationController.swift
//  Weeks2
//
//  Created by Jonathan Ma on 5/2/16.
//  Copyright © 2016 Jonathan Ma. All rights reserved.
//

import UIKit

class rootNavigationController: UINavigationController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let nav = self.navigationController?.navigationBar
        nav?.barStyle = UIBarStyle.Black
        nav?.tintColor = Colors.darkgrey
        nav?.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor()]
        self.title = "WEEKS"
        nav?.titleTextAttributes = [NSFontAttributeName: "Impact"]
    }

    
    
}
