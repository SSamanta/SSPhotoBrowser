//
//  GalleryVC.swift
//  PhotoBrowser
//
//  Created by Susim Samanta on 15/05/16.
//  Copyright © 2016 Susim Samanta. All rights reserved.
//

import UIKit

class GalleryVC: UIViewController,UIPageViewControllerDataSource {
    var isShowingFullScreen =  true
    var pageViewController : UIPageViewController?
    var dataSource = [String]()
    var currentIndex : Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        self.dataSource = ["1.png","2.png","3.png"]
        self.createMainPages()
        //self.createBottomToolBarItems()
        self.addToolBar()
        self.addTapGestureOnImage()
    }
    func createBottomToolBarItems(){
        let gridBarButtonItem = UIBarButtonItem(image: UIImage(named: "grid"), style: .Done, target: self, action: #selector(gridButtonTapped))
        self.navigationController?.setToolbarItems([gridBarButtonItem], animated: true)
    }
    
    func addToolBar(){
        self.navigationController?.toolbarHidden = false
        var items = [UIBarButtonItem]()
        items.append(
            UIBarButtonItem(barButtonSystemItem: .FlexibleSpace, target: self, action: nil)
        )
        items.append(
            UIBarButtonItem(image: UIImage(named: "grid"), style: .Done, target: self, action: #selector(gridButtonTapped))
        )
        self.setToolbarItems(items, animated: true)
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    func createMainPages(){
        pageViewController = UIPageViewController(transitionStyle: .Scroll, navigationOrientation: .Horizontal, options: nil)
        pageViewController!.dataSource = self
        
        let startingViewController: PreviewImage = PreviewImage()
        let image = UIImage(named: self.dataSource[0])
        startingViewController.loadImage(image!)
        let viewControllers = [startingViewController]
        pageViewController!.setViewControllers(viewControllers , direction: .Forward, animated: false, completion: nil)
        pageViewController!.view.frame = CGRectMake(0, 0, view.frame.size.width, view.frame.size.height-1);
        pageViewController?.view.backgroundColor = UIColor.clearColor()
        addChildViewController(pageViewController!)
        view.addSubview(pageViewController!.view)
        pageViewController!.didMoveToParentViewController(self)
    }
    
    //MARK: Page Control Data Source
    func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController? {
        var index = (viewController as! PreviewImage).pageIndex
        if (index == 0) || (index == NSNotFound) {
            return nil
        }
        index -= 1
        return viewControllerAtIndex(index)
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController?{
        var index = (viewController as! PreviewImage).pageIndex
        if index == NSNotFound {
            return nil
        }
        index += 1
        if (index == self.dataSource.count) {
            return nil
        }
        return viewControllerAtIndex(index)
    }
    
    func viewControllerAtIndex(index: Int) -> PreviewImage? {
        if self.dataSource.count == 0 || index >= self.dataSource.count {
            return nil
        }
        // Create a new view controller and pass suitable data.
        let pageContentViewController : PreviewImage = PreviewImage()
        pageContentViewController.pageIndex = index
        currentIndex = index
        let image = UIImage(named: self.dataSource[index])
        pageContentViewController.loadImage(image!)
        return pageContentViewController
    }
    @IBAction func gridButtonTapped(sender : UIBarButtonItem) {
        self.navigationController?.popViewControllerAnimated(false)
    }
    func addTapGestureOnImage(){
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.handleImageTap(_:)))
        self.view.userInteractionEnabled = true
        self.view.addGestureRecognizer(tapGestureRecognizer)
    }
    func handleImageTap(sender : UITapGestureRecognizer) {
        isShowingFullScreen = !isShowingFullScreen
        self.navigationController?.setNavigationBarHidden(isShowingFullScreen, animated: true)
        self.navigationController?.setToolbarHidden(isShowingFullScreen, animated: true)
    }

}
