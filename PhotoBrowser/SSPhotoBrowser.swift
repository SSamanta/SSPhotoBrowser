//
//  SSPhotoBrowser.swift
//  PhotoBrowser
//
//  Created by Susim Samanta on 11/01/16.
//  Copyright © 2016 Susim Samanta. All rights reserved.
//

import UIKit

class SSPhotoBrowser: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    var isShowingGrid = true
    override func viewDidLoad() {
        super.viewDidLoad()
        self.reloadBrowser()
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "backbtn"), style: .Done, target: self, action: "backTapped")
    }
    func backTapped(){
        if isShowingGrid {
            self.navigationController?.popViewControllerAnimated(true)
        }else {
            self.isShowingGrid = true
            self.reloadBrowser()
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    func reloadBrowser(){
        let layout = UICollectionViewFlowLayout()
        if isShowingGrid {
            let gridNib = UINib(nibName: "GridViewCell", bundle: nil) as UINib
            self.collectionView.registerNib(gridNib, forCellWithReuseIdentifier: "GridViewCell")
            layout.scrollDirection = .Vertical
            let column = UI_USER_INTERFACE_IDIOM() == .Pad ? 4 : 3
            let itemWidth = floor((view.bounds.size.width - CGFloat(column - 1)) / CGFloat(column))
            layout.minimumInteritemSpacing = 0.0
            layout.minimumLineSpacing = 0.0
            layout.itemSize = CGSizeMake(itemWidth,itemWidth)
        }else {
            let singleNib = UINib(nibName: "SingleViewCell", bundle: nil) as UINib
            self.collectionView.registerNib(singleNib, forCellWithReuseIdentifier: "SingleViewCell")
            layout.scrollDirection = .Horizontal
            layout.minimumInteritemSpacing = 0.0
            let column = UI_USER_INTERFACE_IDIOM() == .Pad ? 1: 1
            let itemWidth = floor((view.bounds.size.width - CGFloat(column - 1)) / CGFloat(column))
            layout.itemSize = CGSizeMake(itemWidth, itemWidth)
        }
        self.collectionView.setCollectionViewLayout(layout, animated: false) { (isAnimated) -> Void in
            self.collectionView.reloadData()
        }
        
    }
    //MARK : Collection view layout
    func numberOfSectionsInCollectionView(collectionView: UICollectionView!) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView!,numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(collectionView: UICollectionView!,cellForItemAtIndexPath indexPath: NSIndexPath!) ->UICollectionViewCell! {
        if isShowingGrid {
            let cell = collectionView.dequeueReusableCellWithReuseIdentifier("GridViewCell",forIndexPath: indexPath) as! GridViewCell
            let image = UIImage(named: "nature")
            cell.imageView.image = image
            return cell
        }else {
            let cell = collectionView.dequeueReusableCellWithReuseIdentifier("SingleViewCell",forIndexPath: indexPath) as! SingleViewCell
            let image = UIImage(named: "nature")
            cell.imageView.image = image
            return cell
        }
    }
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath){
        if isShowingGrid {
            isShowingGrid = false
            self.reloadBrowser()
        }
    }
    //MARK: Show in Grid format
    
    @IBAction func showInGrid(){
        self.isShowingGrid = true
        self.reloadBrowser()
    }
    
}
