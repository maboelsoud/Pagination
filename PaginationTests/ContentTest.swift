//
//  ContentTest.swift
//  Pagination
//
//  Created by Mohamed Abdalla on 2015-06-25.
//  Copyright (c) 2015 Mohamed Abdalla. All rights reserved.
//

import UIKit
import XCTest

class ContentTest: XCTestCase {

    var vc: ContentViewController!
    var dcvc: DynamicContentViewController!
    var storyBoard: UIStoryboard!
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        var pageTitles = NSArray(objects: "Explore", "Today Widget")
        var pageImages = NSArray(objects: "page1","page2")

        dcvc = DynamicContentViewController()
//        storyBoard = UIStoryboard(name: "Main", bundle: nil)
        
//        var vc: ContentViewController =
//        self.storyBoard.instantiateViewControllerWithIdentifier("ContentViewController") as! ContentViewController
        
        var item1 = [String:Any]()
        item1["type"] = DynamicContentViewController.ContentTypes.Photo
        item1["name"] = "image1"
        item1["size"] = CGRect(x: 16, y: 88, width: 568, height: 492)
        
//        dcvc.data.append(item1)
        
//        vc.imageFile = pageImages[1] as! String
//        vc.titleText = pageTitles[1] as! String
//        vc.pageIndex = 1
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testExample() {
        // This is an example of a functional test case.
        XCTAssert(true, "Pass")
    }

//    func testPerformanceExample() {
//        // This is an example of a performance test case.
//        self.measureBlock() {
//            // Put the code you want to measure the time of here.
//        }
//    }
    
    func testContent() {
        dcvc.loadView()
        XCTAssert(true, dcvc.description)
    }

}
