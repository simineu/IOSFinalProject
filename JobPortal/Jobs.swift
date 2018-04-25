//
//  Jobs.swift
//  JobPortal
//
//  Created by Simi Foss on 4/24/18.
//  Copyright © 2018 Simi Foss. All rights reserved.
//

import UIKit

class Jobs: NSObject {
    var jobType : String
    var location : String
    var desc : String
    var companyName : String
    var jobTitle : String
    var department : String
    
    
    
    
    init(jobType : String, location : String, desc : String, companyName : String, jobTitle : String, department : String) {
        self.jobType   = jobType
        self.location = location
        self.desc  = desc
        self.companyName   = companyName
        self.jobTitle = jobTitle
        self.department  = department
    }
    
    
}
