//
//  EmployerJobTableViewCell.swift
//  JobPortal
//
//  Created by Simi Foss on 4/24/18.
//  Copyright © 2018 Simi Foss. All rights reserved.
//

import UIKit

class EmployerJobTableViewCell: UITableViewCell {

    
    @IBOutlet weak var companyNameLbl: UILabel!
    
    
    @IBOutlet weak var jobPositionLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
