//
//  CatViewerTableViewCell.swift
//  The CatTasticals
//
//  Created by Louis Tur on 5/11/15.
//  Copyright (c) 2015 Louis Tur. All rights reserved.
//

import UIKit

class CatViewerTableViewCell: PFTableViewCell {

    @IBOutlet weak var catImageView:UIImageView?
    @IBOutlet weak var catNameLabel:UILabel?
    @IBOutlet weak var catVotesLabel:UILabel?
    @IBOutlet weak var catCreditLabel:UILabel?
    @IBOutlet weak var catPawIcon:UIImageView?
    
    var parseObject:PFObject?
    
    override func awakeFromNib() {
        let gesture = UITapGestureRecognizer(target: self, action: Selector("onDoubleTap:"))
        gesture.numberOfTapsRequired = 2
        
        contentView.addGestureRecognizer(gesture)
        catPawIcon?.hidden = true
        super.awakeFromNib()
        
        // Initialization code
    }
    
    func onDoubleTap(sender: AnyObject){
        
        if (parseObject != nil){
            if var votes:Int? = parseObject!.objectForKey("votes") as? Int{
                votes!++
                
                parseObject!.setObject(votes!, forKey: "votes")
                parseObject!.saveInBackground()
                catVotesLabel?.text = "\(votes!) votes"
            }
        }
        
        catPawIcon?.hidden = false
        catPawIcon?.alpha = 1.0
        
        UIView.animateKeyframesWithDuration(1.0, delay: 1.0, options: nil, animations: {
            
            self.catPawIcon?.alpha = 0
            
            }, completion: {
                (value:Bool) in
                self.catPawIcon?.hidden = true
        })
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
