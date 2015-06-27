//
//  ContentViewController.swift
//  Pagination
//
//  Created by Mohamed Abdalla on 2015-06-21.
//  Copyright (c) 2015 Mohamed Abdalla. All rights reserved.
//

import UIKit

class ContentViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    var pageIndex: Int!
    var titleText: String!
    var imageFile: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.titleLabel.text = self.titleText
        self.imageView.image = UIImage(named: self.imageFile)
        //self.imageView.sizeThatFits(CGRectMake(16, 151, 10, 333).size)//= CGRectMake(16, 151, 368, 333)
        imageView.alpha = 0.5
    }

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

