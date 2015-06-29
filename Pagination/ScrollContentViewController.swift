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
            // changes the cover based on what you want
            var imageView = content.viewWithTag(1) as! UIImageView
            imageView.image = UIImage(named: CoverData.images[index])
            
        }
    }
    
    
}



struct CoverData {
    
    static var images = ["photo1","photo2","photo3","photo4","photo5"]
    static var count:Int
        {
        get {
            return images.count
        }
    }
    
}

struct example {
    static var prop = 38
}



//class ContentViewController: UIViewController {
//    
//    @IBOutlet weak var imageView: UIImageView!
//    @IBOutlet weak var titleLabel: UILabel!
//    
//    var pageIndex: Int!
//    var titleText: String!
//    var imageFile: String!
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        
//        self.titleLabel.text = self.titleText
//        self.imageView.image = UIImage(named: self.imageFile)
//        //self.imageView.sizeThatFits(CGRectMake(16, 151, 10, 333).size)//= CGRectMake(16, 151, 368, 333)
//        imageView.alpha = 0.5
//    }
//    
//}
