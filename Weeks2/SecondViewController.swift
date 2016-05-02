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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = Colors.lightgray

        // Do any additional setup after loading the view.
    }
    
    // MARK: set how many images in collection view
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return  4
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 13
    }
    
    // MARK: add images to collection view
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        collectionView.backgroundColor = Colors.lightgray
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("cell", forIndexPath: indexPath) as! CollectionViewCell90
        let image = UIImage(named: "blackteardrop")
        
        cell.imageView?.image = image
//        if indexPath.row >= 10
//        {
//            cell.imageView.image = UIImage(named: "blackteardrop")
//            return cell
//        }
//        else
//        {
//            cell.imageView.image = UIImage(named: "blackteardrop")
//            return cell
//        }
        return cell
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
