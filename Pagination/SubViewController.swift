//
//  SubViewController.swift
//  Pagination
//
//  Created by Mohamed Abdalla on 2015-06-23.
//  Copyright (c) 2015 Mohamed Abdalla. All rights reserved.
//

import UIKit

class SubViewController:
//  PageContainerViewController {
    HousingViewController {

    
    
//    override func viewLoading() {
//        
//        var pageTitles = NSArray(objects: "Explore", "Today Widget")
//        var pageImages = NSArray(objects: "page1","page2")
//        
//        //468
//        var size = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
////        var size = CGRect(x: 7, y: 60, width: view.frame.width - 14, height: view.frame.height - 120)
//        
//        var item1 = [String:Any]()
//        item1["type"] = DynamicContentViewController.ContentTypes.Photo
//        item1["name"] = "photo1"
//        item1["size"] = size
//        
//        var item2 = [String:Any]()
//        item2["type"] = DynamicContentViewController.ContentTypes.Photo
//        item2["name"] = "photo2"
//        item2["size"] = size
//        
//        var item3 = [String:Any]()
//        item3["type"] = DynamicContentViewController.ContentTypes.Photo
//        item3["name"] = "photo3"
//        item3["size"] = size
//        
//        var item4 = [String:Any]()
//        item4["type"] = DynamicContentViewController.ContentTypes.Photo
//        item4["name"] = "photo4"
//        item4["size"] = size
//        
//        var item5 = [String:Any]()
//        item5["type"] = DynamicContentViewController.ContentTypes.Photo
//        item5["name"] = "photo5"
//        item5["size"] = size
//        
//        var bundle = [Dictionary<String,Any>]()
//        
//        bundle.append(item1)
//        bundle.append(item2)
//        bundle.append(item3)
//        bundle.append(item4)
//        bundle.append(item5)
////        self.implementer = PVCImplementer(storyBoard: self.storyboard!, pageTitles: pageTitles, pageImages: pageImages)
//        
//        self.implementer = PVCImplementer(storyBoard: self.storyboard!, data: bundle)
//    }
    
    
    
    
    override func viewLoading() {
        
        
        self.integrator = PVCIntegrator(storyBoard: self.storyboard!, size: CoverData.count)
    }

}
