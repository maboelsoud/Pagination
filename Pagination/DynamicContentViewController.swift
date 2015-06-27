//
//  DynamicContentViewController.swift
//  Pagination
//
//  Created by Mohamed Abdalla on 2015-06-21.
//  Copyright (c) 2015 Mohamed Abdalla. All rights reserved.
//

import UIKit
import MediaPlayer

class DynamicContentViewController: UIViewController, VidCallbacks{
    
    var views = [String:UIView]()
    
//    @IBOutlet weak var imageView: UIImageView!
//    @IBOutlet weak var titleLabel: UILabel!
//    
    var pageIndex: Int!
//    var titleText: String!
//    var imageFile: String!
    
    var data = Dictionary<String,Any>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
//        for item in data{
//            addItem(item["type"] as! ContentTypes, data: item)
//        }
        addItem(data["type"] as! ContentTypes, data: data)
        
//        self.titleLabel.text = self.titleText
//        self.imageView.image = UIImage(named: self.imageFile)
//        imageView.alpha = 0.5
    }
    
    
    enum ContentTypes : Int {
        case Text
        case Photo
        case Video
        case View
    }
    func addItem(type: ContentTypes, data: Dictionary<String,Any>){
        // determine the type of content in the item
        switch type{
        case .Text:
            addText(data["text"] as! String, textColor: data["textColor"] as! UIColor
                , background: data["background"] as! UIColor, size: data["size"] as! CGRect)
        case .Photo:
            addPhoto(data["name"] as! String, size: data["size"] as! CGRect)
        case .Video:
            addVideo(data["name"] as! String)
        case .View:
            addView("jdio83m389fj3nf398", viewItem: data["view"] as! UIView, size: data["size"] as! CGRect)
        default:
            debugPrintln("incorrect type")
        }
    }
    
    func addText(text: String, textColor: UIColor, background: UIColor, size: CGRect){
        
        var textItem = UITextView()
        textItem.text = text
        textItem.textColor = textColor
        textItem.backgroundColor = background
        addView("j2c8b8n3b7", viewItem: textItem, size: size)
    }
    
    func addButton(title: String, target: String, color: UIColor,size: CGRect){
        
        var button = UIButton()
        button.setTitle(title, forState: .Normal)
        button.setTitleColor(color, forState: .Normal)
        addView("s91j73v4i9d3", viewItem: button,size: size)
        addTarget(button,target: target)
    }
    
    func addPhoto(name: String,size: CGRect){
        var image = UIImageView()
        image.image = UIImage(named: name)
        image.contentMode = .ScaleAspectFit
        image.clipsToBounds = true
        //addView("y3i5v92m5v4l",viewItem: image, size: size)
        
        
//        var origImage: UIImage = UIImage(named: name)!
//        image.image = self.squareCropImageToSideLength(origImage, sideLength: 200)
        addView("y3i5v92m5v4l",viewItem: image, size: size)
    }
    
    private func squareCropImageToSideLength(let sourceImage: UIImage,
        let sideLength: CGFloat) -> UIImage {
            // input size comes from image
            let inputSize: CGSize = sourceImage.size
            
            // round up side length to avoid fractional output size
            let sideLength: CGFloat = ceil(sideLength)
            
            // output size has sideLength for both dimensions
            let outputSize: CGSize = CGSizeMake(sideLength, sideLength)
            
            // calculate scale so that smaller dimension fits sideLength
            let scale: CGFloat = max(sideLength / inputSize.width,
                sideLength / inputSize.height)
            
            // scaling the image with this scale results in this output size
            let scaledInputSize: CGSize = CGSizeMake(inputSize.width * scale,
                inputSize.height * scale)
            
            // determine point in center of "canvas"
            let center: CGPoint = CGPointMake(outputSize.width/2.0,
                outputSize.height/2.0)
            
            // calculate drawing rect relative to output Size
            let outputRect: CGRect = CGRectMake(center.x - scaledInputSize.width/2.0,
                center.y - scaledInputSize.height/2.0,
                scaledInputSize.width,
                scaledInputSize.height)
            
            // begin a new bitmap context, scale 0 takes display scale
            UIGraphicsBeginImageContextWithOptions(outputSize, true, 0)
            
            // optional: set the interpolation quality.
            // For this you need to grab the underlying CGContext
            let ctx: CGContextRef = UIGraphicsGetCurrentContext()
            CGContextSetInterpolationQuality(ctx, kCGInterpolationHigh)
            
            // draw the source image into the calculated rect
            sourceImage.drawInRect(outputRect)
            
            // create new image from bitmap context
            let outImage: UIImage = UIGraphicsGetImageFromCurrentImageContext()
            
            // clean up
            UIGraphicsEndImageContext()
            
            // pass back new image
            return outImage
    }
    
    func addView(identifier: String, viewItem: UIView,size: CGRect){
        
        if (self.views[identifier] == nil){
            self.views[identifier] = viewItem
        } else {
            debugPrintln("you must create a unique key to add a view")
        }
        
        viewItem.frame = size
        self.view.addSubview(viewItem)
        
    }
    
    func addTarget(button: UIButton,target: String){
        button.addTarget(self, action: Selector(target), forControlEvents: UIControlEvents.TouchUpInside)
    }
    
    func attachVideoToView(view: UIView) {
        // change the id to support multiple videos in one app
        addView("o3j4s3h42ci",viewItem: view, size: vidSize)
    }
    
    var vidSize: CGRect {
        get{
            return self.vidSize
        }
        set(size){
            self.vidSize = size
        }
    }
    
    func addVideo(name: String){
        var moviePlayer = VideoPlayer(name: name, callback: self)
        
    }
    
}

class VideoPlayer: NSObject {
    var moviePlayer : MPMoviePlayerController!
    var videoName: String
    var playerCallback: VidCallbacks
    
    
    init(name: String, callback: VidCallbacks) {
        videoName = name
        playerCallback = callback
    }
    
    
    func playVideo() {
        if let
            path = NSBundle.mainBundle().pathForResource(self.videoName, ofType:"m4v"),
            url = NSURL(fileURLWithPath: path),
            moviePlayer = MPMoviePlayerController(contentURL: url) {
                self.moviePlayer = moviePlayer
                moviePlayer.prepareToPlay()
                moviePlayer.scalingMode = .AspectFill
                playerCallback.attachVideoToView(moviePlayer.view)
        } else {
            debugPrintln("Ops, something wrong when playing video.m4v")
        }
    }
}

protocol VidCallbacks: NSObjectProtocol {
    var vidSize: CGRect {get set}
    func attachVideoToView(view: UIView) -> Void
}


