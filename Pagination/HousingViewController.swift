//
//  HousingViewController.swift
//  Pagination
//
//  Created by Mohamed Abdalla on 2015-06-28.
//  Copyright (c) 2015 Mohamed Abdalla. All rights reserved.
//

import UIKit

class HousingViewController: UIViewController {
    
    var integrator: PVCIntegrator!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewLoading()
        // call the attachment to the view controller
        attach(integrator.pageViewController)
    }
    
    func viewLoading(){
        // supposed to be overridden
        // do stuff here
        // at the end, call the attachment to the view controller
    }
    
    func attach(pageViewController: UIPageViewController) {
        
        self.integrator.viewLoaded()
        pageViewController.view.frame = CGRectMake(0, 0, view.frame.width, view.frame.size.height)
        self.addChildViewController(pageViewController)
        self.view.addSubview(pageViewController.view)
        pageViewController.didMoveToParentViewController(self)
    }

}




class PVCIntegrator: NSObject, UIPageViewControllerDataSource
    //, viewCallbacks
{
    
    var storyBoard: UIStoryboard!
    var pageImages: NSArray!
    var pageViewController: UIPageViewController!
    
    init(storyBoard: UIStoryboard, pageImages: NSArray) {
        self.storyBoard = storyBoard
        self.pageImages = pageImages
        self.pageViewController = storyBoard.instantiateViewControllerWithIdentifier("PageViewController") as! UIPageViewController
        
    }
    
    func viewLoaded() {
        pageViewController.dataSource = self
        restart()
    }
    
    func viewControllerAtIndex(index: Int)-> UIViewController
    {
        
        if((self.pageImages.count == 0) || (index >= self.pageImages.count)){
            return ContentViewController()
        }
            
        var vc: ContentViewController =
        self.storyBoard.instantiateViewControllerWithIdentifier("ContentViewController") as! ContentViewController
            
        vc.imageFile = self.pageImages[index] as! String
            
        vc.pageIndex = index
            
        // this will trigger the content view controller initialization
        return vc
    }
    
    func restart(){
        
        var startVC:AnyObject
        
            
        startVC = self.viewControllerAtIndex(0) as! ContentViewController
        
        var viewControllers = NSArray(object: startVC)
        
        self.pageViewController.setViewControllers(viewControllers as [AnyObject]
            , direction: .Forward
            , animated: true, completion: nil)
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController? {
        
        // TODO: change
        
        var index: Int
        
        var vc = viewController as! ContentViewController
        index = vc.pageIndex as Int
            
        
        
        if (index == 0 || index == NSNotFound)
        {
            return nil
        }
        
        index--
        return self.viewControllerAtIndex(index)
        
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
        
        var index: Int
        
        var vc = viewController as! ContentViewController
        index = vc.pageIndex as Int
        
        
        if (index == NSNotFound)
        {
            return nil
        }
        
        index++
        
        if (index == self.pageImages.count){
            return nil
        }
        
        return self.viewControllerAtIndex(index)
        
        
    }
}