//
//  PostController.swift
//
//
//  Created by RYPE on 14/05/2015.
//
//


import UIKit

class PostController: UIViewController {
    
    /*************************************************/
    // Main
    /*************************************************/
    
    // Boulet
    /*************************/
    @IBOutlet weak var myImage: UIImageView!
    @IBOutlet weak var myText: UITextView!
    @IBOutlet weak var myScrollView: UIScrollView!
    
    
    // Var
    /*************************/
    var post: Post?

    
    // init
    /*************************/
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    // Base
    /*************************/
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // custom
        // ---------------------
        // back button text
        let backButton = UIBarButtonItem(
            title: "",
            style: UIBarButtonItemStyle.Plain,
            target: nil,
            action: nil
        );
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
        
        // back uiColor
        myScrollView.backgroundColor = UIColor(netHex:GlobalConstants.BackgroundColor)
        // police Color
        myText.textColor = UIColor(netHex:GlobalConstants.FontColor)
        // ---------------------
        
        // Set Data
        myImage.image = UIImage(data: NSData(contentsOfURL: NSURL(string: self.post!.img)!)!)
        // resize image
        let size = CGSizeMake(self.view.bounds.width, self.view.bounds.width)
        myImage.image! = imageResize(image: myImage.image!,sizeChange: size)
        
        myText.text = self.post?.text
        // resize height of text view
        myText.scrollEnabled = false
        var contentSize = myText.sizeThatFits(CGSizeMake(myText.frame.size.width, CGFloat.max))
        for c in myText.constraints() {
            if c.isKindOfClass(NSLayoutConstraint) {
                var constraint = c as! NSLayoutConstraint
                if constraint.firstAttribute == NSLayoutAttribute.Height {
                    constraint.constant = contentSize.height
                    break
                }
            }
        }
        
    }
    
    /*************************************************/
    // Functions
    /*************************************************/
    
    // Other
    /*************************/
    func imageResize (#image:UIImage, sizeChange:CGSize)-> UIImage{
        
        let hasAlpha = true
        let scale: CGFloat = 0.0 // Use scale factor of main screen
        
        UIGraphicsBeginImageContextWithOptions(sizeChange, !hasAlpha, scale)
        image.drawInRect(CGRect(origin: CGPointZero, size: sizeChange))
        
        let scaledImage = UIGraphicsGetImageFromCurrentImageContext()
        return scaledImage
    }

}
