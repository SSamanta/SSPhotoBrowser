//
//  PreviewImage.swift
//  WovaxIOSApp
//
//  Created by Susim Samanta on 11/05/16.
//  Copyright © 2016 SusimSamanta. All rights reserved.
//

import UIKit

class PreviewImage: UIViewController,UIScrollViewDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var imageView: UIImageView!
    var isShowingFullScreen =  false
    var image : UIImage?
    var pageIndex : Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loadUI()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    func loadImage(image :UIImage) {
        self.image = image
    }
    func loadUI(){
        self.imageView.image = image
        self.scrollView.minimumZoomScale = 1.0;
        self.scrollView.maximumZoomScale = 6.0;
        self.addTapGestureOnImage()
    }
    func viewForZoomingInScrollView(scrollView: UIScrollView) -> UIView? {
        return self.imageView
    }
    func addTapGestureOnImage(){
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.handleImageTap(_:)))
        self.imageView.userInteractionEnabled = true
        self.imageView.addGestureRecognizer(tapGestureRecognizer)
    }
    func handleImageTap(sender : UITapGestureRecognizer) {
        isShowingFullScreen = !isShowingFullScreen
        self.navigationController?.setNavigationBarHidden(isShowingFullScreen, animated: true)
        self.navigationController?.setToolbarHidden(isShowingFullScreen, animated: true)
    }
}
