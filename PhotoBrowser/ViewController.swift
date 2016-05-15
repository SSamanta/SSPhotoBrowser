//
//  ViewController.swift
//  PhotoBrowser
//
//  Created by Susim Samanta on 11/01/16.
//  Copyright © 2016 Susim Samanta. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    @IBAction func showPhotoBrowser(){
       /* let photoBrowser = self.storyboard?.instantiateViewControllerWithIdentifier("SSPhotoBrowser") as! SSPhotoBrowser
        self.navigationController?.pushViewController(photoBrowser, animated: true)*/
        let galleryVc = GalleryVC()
        self.navigationController?.pushViewController(galleryVc, animated: true)
    }
    
}

