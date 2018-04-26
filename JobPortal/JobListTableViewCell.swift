//
//  JobListTableViewCell.swift
//  JobPortal
//
//  Created by Simi Foss on 4/25/18.
//  Copyright © 2018 Simi Foss. All rights reserved.
//

import UIKit

class JobListTableViewCell: UITableViewCell {

    
    @IBOutlet weak var positionLbl: UILabel!
    
    @IBOutlet weak var locationLbl: UILabel!
    
    @IBOutlet weak var companyLbl: UILabel!
    
    
    @IBOutlet weak var submit: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    @IBAction func submitResumeBtn(_ sender: Any) {
    }
    
}
