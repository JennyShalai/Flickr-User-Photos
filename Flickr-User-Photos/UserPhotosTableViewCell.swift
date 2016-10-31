//
//  UserPhotosTableViewCell.swift
//  Flickr-User-Photos
//
//  Created by Flatiron School on 10/31/16.
//  Copyright © 2016 jennyshalai. All rights reserved.
//

import UIKit

class UserPhotosTableViewCell: UITableViewCell {

        
        @IBOutlet weak var photo: UIImageView!
        @IBOutlet weak var name: UILabel!
        @IBOutlet weak var date: UILabel!
        
        override func awakeFromNib() {
            super.awakeFromNib()
            // Initialization code
        }
        
        override func setSelected(_ selected: Bool, animated: Bool) {
            super.setSelected(selected, animated: animated)
            
            // Configure the view for the selected state
        }
        
}
