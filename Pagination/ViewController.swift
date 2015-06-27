//
//  ViewController.swift
//  Pagination
//
//  Created by Mohamed Abdalla on 2015-06-21.
//  Copyright (c) 2015 Mohamed Abdalla. All rights reserved.
//

import UIKit

class ViewController: PageContainerViewController
{

    override func viewLoading() {
        
        var pageTitles = NSArray(objects: "Explore", "Today Widget")
        var pageImages = NSArray(objects: "page1","page2")
        self.implementer = PVCImplementer(storyBoard: self.storyboard!, pageTitles: pageTitles, pageImages: pageImages)
    }
    
    override func viewDidAppear(animated: Bool) {
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func restartAction(sender: AnyObject) {
        implementer.viewLoaded()
    }
    


    
}