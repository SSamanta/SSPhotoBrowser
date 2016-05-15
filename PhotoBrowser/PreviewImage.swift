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
    var image : UIImage?
    var pageIndex : Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        self.imageView.image = image
        self.addTapGestureOnImage()
        self.scrollView.minimumZoomScale = 1.0;
        self.scrollView.maximumZoomScale = 6.0;
        
    }
    override func viewWillAppear(animated: Bool) {
        self.view.alpha = 0.0
        UIView.animateWithDuration(0.4) {
            self.view.alpha = 1.0
        }
    }
    override func viewWillDisappear(animated: Bool) {
        UIView.animateWithDuration(0.4) {
            self.view.alpha = 0.0
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    func loadImage(image :UIImage) {
        self.image = image
    }
    func viewForZoomingInScrollView(scrollView: UIScrollView) -> UIView? {
        return self.imageView
    }
    func scrollViewWillBeginZooming(scrollView: UIScrollView, withView view: UIView?) {
    }
    func scrollViewDidEndZooming(scrollView: UIScrollView, withView view: UIView?, atScale scale: CGFloat) {
    }
    func addTapGestureOnImage(){
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.handleImageTap(_:)))
        self.imageView.userInteractionEnabled = true
        self.imageView.addGestureRecognizer(tapGestureRecognizer)
    }
    func handleImageTap(sender : UITapGestureRecognizer) {
        self.dismissViewControllerAnimated(false, completion: nil)
    }
}
