//
//  StoryView.swift
//  Pagination
//
//  Created by Mohamed Abdalla on 2015-06-27.
//  Copyright (c) 2015 Mohamed Abdalla. All rights reserved.
//

import UIKit


@IBDesignable class StoryView: UIView, namedClass {
    
//    
//    @IBOutlet weak var titleLabel: UILabel!
//    @IBOutlet weak var myImage: UIImageView!
//    @IBOutlet weak var myButton: UIButton!
      var view:UIView!

    var named: namedClass
//    @IBInspectable var mytitleLabelText: String?{
//        get{ return titleLabel.text
//        }
//        set(mytitleLabelText) {
//            titleLabel.text = mytitleLabelText
//        }
//    }
//    @IBInspectable var myCustomImage:UIImage?{
//        get {
//            return myImage.image
//        }
//        set(myCustomImage) {
//            myImage.image = myCustomImage
//        }
//    }
    
    
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
    // Drawing code
    
    var context = UIGraphicsGetCurrentContext();
    
    var color: UIColor = UIColor(red: 0.114, green: 0.114, blue: 1, alpha: 1)
    
    CGContextSetFillColorWithColor(context, color.CGColor);
    
    CGContextFillRect(context, self.bounds);
    
    }
    */
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
//        secretContent = "Its not a secret"
        
        setup()
    }

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        loadClass()
        
        println( _stdlib_getDemangledTypeName(self))
        setup()
    }
    
    func loadClass(){

        var str = "Hello, playground"
 
        let rangeOfHello = Range(start: str.startIndex,
                         end: advance(str.startIndex, 5))
        let helloStr = str.substringWithRange(rangeOfHello)
        
        helloStr //"Hello"
        
        // supposed to be overridden
        //namedClass = self//"StoryView"
    }

    
    func setup()
    {
        view = loadViewFromNib()


        view.frame = bounds
        view.autoresizingMask = UIViewAutoresizing.FlexibleWidth | UIViewAutoresizing.FlexibleHeight
        addSubview(view)
    }
    
    func loadViewFromNib() -> UIView
    {
        let bundle = NSBundle(forClass:self.dynamicType)
        let nib = UINib(nibName: namedClass.getName(self)(), bundle: bundle)
        let view = nib.instantiateWithOwner(self, options: nil)[0] as! UIView
        
        return view
    }
    
    func getName() -> String {
        return "StoryView"
    }
    
}

protocol namedClass {
    func getName() -> String
}