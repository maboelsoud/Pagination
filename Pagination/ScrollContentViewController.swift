//
//  ScrollContentViewController.swift
//  Pagination
//
//  Created by Mohamed Abdalla on 2015-06-28.
//  Copyright (c) 2015 Mohamed Abdalla. All rights reserved.
//

import UIKit
//import MediaPlayer

class ScrollContentViewController: UIViewController {
    
    @IBOutlet var content: CompoundStoryView!
    var pageIndex: Int!
    
    enum parts {
        case cover
        case article_photo
        case article_title
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        changeCover(.cover, index: pageIndex)
        
    }
    
    
    override func viewDidAppear(animated: Bool) {
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
//    required init(coder aDecoder: NSCoder) {
//        super.init(coder: aDecoder)
//    }
    
    func unPackageImage(){
        
    }
    
    func changeCover(part: parts, index: Int){
        
        if(part == .cover) {
            // changes the cover to the appropriate photo
            var imageView = content.viewWithTag(1) as! UIImageView
            imageView.image = UIImage(named: CoverData.images[index])
            
            // changes the detail photo to the appropriate photo
            var detailImageView = content.viewWithTag(2) as! UIImageView
            detailImageView.image = UIImage(named: CoverData.details[index])
            
            var color = CoverData.colors[index]
            
            // changes the bar and stripes to the appropriate photo
            var topBar = content.viewWithTag(3)
            topBar?.backgroundColor = color
            
            var stripe1 = content.viewWithTag(4)
            stripe1?.backgroundColor = color
            
            var stripe2 = content.viewWithTag(5)
            stripe2?.backgroundColor = color
        }
    }
    
    
}



struct CoverData {
    
    static var images = ["photo1","photo2","photo3","photo4","photo5"]
    static var details = ["detail1","detail2","detail3","detail4","detail5"]
    static var colors = [UIColor.blueColor(), UIColor.brownColor(), UIColor.greenColor(), UIColor.redColor(),UIColor.yellowColor()]
    static var count:Int
        {
        get {
            return images.count
        }
    }
    
}
