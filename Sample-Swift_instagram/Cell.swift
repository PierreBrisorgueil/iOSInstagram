//
//  Cell.swift
//  Sample-Swift_instagram
//
//  Created by RYPE on 14/05/2015.
//  Copyright (c) 2015 weareopensource. All rights reserved.
//

import UIKit

class Cell: UITableViewCell {
    
    
    /*************************************************/
    // Main
    /*************************************************/
    
    // Boulet
    /*************************/

    @IBOutlet weak var myImageView: UIImageView!
    @IBOutlet weak var myLabel: UILabel!
    @IBOutlet weak var myLabel2: UILabel!
    @IBOutlet weak var myView: UIView!
    
    
    // Base
    /*************************/
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        if(selected) {
            myView.backgroundColor = UIColor(netHex: GlobalConstants.BackgroundColorTableViewDetailView).colorWithAlphaComponent(0.5)
        }
    }
    
    override func setHighlighted(highlighted: Bool, animated: Bool) {
        super.setHighlighted(highlighted, animated: animated)
        
        if(highlighted) {
            myView.backgroundColor = UIColor(netHex: GlobalConstants.BackgroundColorTableViewDetailView).colorWithAlphaComponent(0.5)
        }
    }
    
}
