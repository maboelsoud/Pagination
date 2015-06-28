//
//  ImageContentViewController.swift
//  Pagination
//
//  Created by Mohamed Abdalla on 2015-06-28.
//  Copyright (c) 2015 Mohamed Abdalla. All rights reserved.
//

import UIKit

class ImageContentViewController: UIViewController {

    @IBOutlet weak var body: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func imageChange(index: Int) {
        body.image = UIImage(named: "detail\(index)")
    }

}
