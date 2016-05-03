//
//  SecondViewController.swift
//  Weeks2
//
//  Created by Jonathan Ma on 4/29/16.
//  Copyright © 2016 Jonathan Ma. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    @IBOutlet weak var collectionView90: UICollectionView!
    @IBOutlet weak var age: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    // MARK: set Navigation Title Properties
        self.view.backgroundColor = Colors.lightgray
        let nav = self.navigationController?.navigationBar
        nav?.barStyle = UIBarStyle.Black
        nav?.tintColor = Colors.darkgrey
        nav?.titleTextAttributes = [NSForegroundColorAttributeName: Colors.lightgray]
        self.navigationItem.title = "WEEKS"

    
    //MARK: Add age to label
        let defaults = NSUserDefaults.standardUserDefaults()
        let userAge = defaults.objectForKey("userAge") as? String ?? String()
        age.text = userAge
        age.textColor = Colors.darkgrey
    }
    
    // MARK: set how many images in collection view
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return  52
    }
    
    // MARK: add images to collection view
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        collectionView.backgroundColor = Colors.lightgray
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("cell", forIndexPath: indexPath) as! CollectionViewCell90
        let imageblack = UIImage(named: "blackteardrop")
        let imageorange = UIImage(named: "orangeteardrop")
        let imagered = UIImage(named: "redteardrop")
        
        if indexPath.row <= 10
        {
            cell.imageView.image = imageblack
            return cell
        }
        else if indexPath.row == 11
        {
            cell.imageView.image = imagered
            return cell
        }
        else
        {
            cell.imageView.image = imageorange
            return cell
        }
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
