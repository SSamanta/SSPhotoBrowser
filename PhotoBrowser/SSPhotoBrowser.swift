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
    
    var dataSource = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.dataSource = ["1.png","2.png","3.png"]
        self.loadBrowser()
        
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    func loadBrowser(){
        let layout = UICollectionViewFlowLayout()
        let gridNib = UINib(nibName: "GridViewCell", bundle: nil) as UINib
        self.collectionView.registerNib(gridNib, forCellWithReuseIdentifier: "GridViewCell")
        layout.scrollDirection = .Vertical
        let column = UI_USER_INTERFACE_IDIOM() == .Pad ? 4 : 3
        let itemWidth = floor((view.bounds.size.width - CGFloat(column - 1)) / CGFloat(column))
        layout.minimumInteritemSpacing = 0.0
        layout.minimumLineSpacing = 0.0
        layout.itemSize = CGSizeMake(itemWidth,itemWidth)
        
    }
    //MARK : Collection view layout
    func numberOfSectionsInCollectionView(collectionView: UICollectionView!) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView!,numberOfItemsInSection section: Int) -> Int {
        return self.dataSource.count
    }
    
    func collectionView(collectionView: UICollectionView!,cellForItemAtIndexPath indexPath: NSIndexPath!) ->UICollectionViewCell! {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("GridViewCell",forIndexPath: indexPath) as! GridViewCell
        let image = UIImage(named: self.dataSource[indexPath.row])
        cell.imageView.image = image
        return cell
    }
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath){
        let galleryVc = GalleryVC()
        self.navigationController?.pushViewController(galleryVc, animated: false)
    }
}
