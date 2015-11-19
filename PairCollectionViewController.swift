//
//  PairCollectionViewController.swift
//  week6
//
//  Created by Jay Maloney on 11/18/15.
//  Copyright © 2015 Jay Maloney. All rights reserved.
//

import UIKit

class PairCollectionViewController: UIViewController {
    
    @IBAction func randomTapped(sender: AnyObject) {
        ItemController.sharedController.items.shuffleInPlace()
    }
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
}

//got collection view working, still trying to format correctly

extension PairCollectionViewController: UICollectionViewDataSource, UICollectionViewDelegate,UICollectionViewDelegateFlowLayout {
    
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("resultsCell", forIndexPath: indexPath) as! PairCollectionCell
        
        let item = ItemController.sharedController.items[indexPath.row]
        cell.titleLabel?.text = item.title
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return ItemController.sharedController.items.count

    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return CGSize(width: self.view.frame.size.width/2, height: self.view.frame.size.height/4-1)
    }
    
}

