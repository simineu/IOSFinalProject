//
//  MessageTableViewCell.swift
//  JobPortal
//
//  Created by Simi Foss on 4/28/18.
//  Copyright © 2018 Simi Foss. All rights reserved.
//

import UIKit


class MessageTableViewCell: UITableViewCell {

    @IBOutlet weak var sender: UILabel!
    
    
    @IBOutlet weak var message: UITextView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
