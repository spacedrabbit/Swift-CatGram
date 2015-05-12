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
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
