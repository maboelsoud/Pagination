//
//  PageContainerViewController.swift
//  Pagination
//
//  Created by Mohamed Abdalla on 2015-06-23.
//  Copyright (c) 2015 Mohamed Abdalla. All rights reserved.
//

import UIKit

class PageContainerViewController: UIViewController, viewAttach {

    var implementer: PVCImplementer!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewLoading()
        // call the attachment to the view controller
        attach(implementer.pageViewController)
    }
    
    func viewLoading(){
        // supposed to be overridden
        // do stuff here
        // at the end, call the attachment to the view controller
    }

    func attach(pageViewController: UIPageViewController) {
        
        self.implementer.viewLoaded()
//        pageViewController.view.frame = CGRectMake(0, 60, view.frame.width, view.frame.size.height - 90)
        pageViewController.view.frame = CGRectMake(0, 0, view.frame.width, view.frame.size.height)
        self.addChildViewController(pageViewController)
        self.view.addSubview(pageViewController.view)
        pageViewController.didMoveToParentViewController(self)
    }
}

protocol viewAttach{
    func attach(pageViewController: UIPageViewController)
}


class PVCImplementer: NSObject, UIPageViewControllerDataSource
    //, viewCallbacks
{
    
    var storyBoard: UIStoryboard!
    var pageTitles: NSArray!
    var pageImages: NSArray!
    var data: [Dictionary<String,Any>]!
    var pageViewController: UIPageViewController!
    
    init(storyBoard: UIStoryboard, pageTitles: NSArray, pageImages: NSArray) {
        self.storyBoard = storyBoard
        self.pageTitles = pageTitles
        self.pageImages = pageImages
        self.pageViewController = storyBoard.instantiateViewControllerWithIdentifier("PageViewController") as! UIPageViewController
        
    }
    
    init(storyBoard: UIStoryboard, data: [Dictionary<String,Any>]) {
        self.storyBoard = storyBoard
        self.data = data
        self.pageViewController = storyBoard.instantiateViewControllerWithIdentifier("PageViewController") as! UIPageViewController
        
    }
    
    func viewLoaded() {
        pageViewController.dataSource = self
        restart()
    }
    
    func viewControllerAtIndex(index: Int)-> UIViewController
    {
        
        
        if (self.pageImages != nil){
            
            if((self.pageTitles.count == 0) || (index >= self.pageTitles.count)){
                return ContentViewController()
            }
            
            var vc: ContentViewController =
            self.storyBoard.instantiateViewControllerWithIdentifier("ContentViewController") as! ContentViewController
            
            vc.imageFile = self.pageImages[index] as! String
            vc.titleText = self.pageTitles[index] as! String
            
            vc.pageIndex = index
            
            // this will trigger the content view controller initialization
            return vc
        }
        else if (self.data != nil){
            
            if (self.data.count == 0){
                return DynamicContentViewController()
            }
            
            var dcvc: DynamicContentViewController =
            self.storyBoard.instantiateViewControllerWithIdentifier("DynamicContentViewController") as! DynamicContentViewController
            
            dcvc.data = self.data[index]
            dcvc.pageIndex = index
            
            // this will trigger the content view controller initialization
            return dcvc
        }
        return ContentViewController()
    }
    
    func restart(){
        
        var startVC:AnyObject
        
        if (self.pageImages != nil){
            
            startVC = self.viewControllerAtIndex(0) as! ContentViewController
        }
        else {
            
            startVC = self.viewControllerAtIndex(0) as! DynamicContentViewController
        }
        var viewControllers = NSArray(object: startVC)
        
        self.pageViewController.setViewControllers(viewControllers as [AnyObject]
            , direction: .Forward
            , animated: true, completion: nil)
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController? {
        
        // TODO: change

        var index: Int
        if (self.pageImages != nil){
            var vc = viewController as! ContentViewController
            index = vc.pageIndex as Int
            
        } else if (self.data != nil) {
            var vc = viewController as! DynamicContentViewController
            index = vc.pageIndex as Int
            
        } else {
            index = 0
        }
        
        if (index == 0 || index == NSNotFound)
        {
            return nil
        }
        index--
        return self.viewControllerAtIndex(index)
        
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
        
        var index: Int
        if (self.pageImages != nil){
            var vc = viewController as! ContentViewController
            index = vc.pageIndex as Int
            
        } else if (self.data != nil) {
            var vc = viewController as! DynamicContentViewController
            index = vc.pageIndex as Int
            
        } else {
            index = 0
        }
        
        if (index == NSNotFound)
        {
            return nil
        }
        
        index++
        
        if (self.pageImages != nil){
            if (index == self.pageTitles.count){
                return nil
            }
        } else {
            if (index == self.data.count){
                return nil
            }
        }
        
        return self.viewControllerAtIndex(index)
        
        
    }
    
//    func presentationCountForPageViewController(pageViewController: UIPageViewController) -> Int {
//        // TODO: change
//        if (self.pageImages != nil){
//            return self.pageTitles.count
//        } else {
//            return self.data.count
//        }
//    }
//    
//    
//    func presentationIndexForPageViewController(pageViewController: UIPageViewController) -> Int {
//        return 0
//    }
}