//
//  EmployerApplicationViewTableViewCell.swift
//  JobPortal
//
//  Created by Simi Foss on 4/27/18.
//  Copyright © 2018 Simi Foss. All rights reserved.
//

import UIKit

class EmployerApplicationViewTableViewCell: UITableViewCell {

    
    @IBOutlet weak var appliedBy: UILabel!
    
    
    @IBOutlet weak var position: UILabel!
    
    
    @IBOutlet weak var education: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
