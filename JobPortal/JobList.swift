//
//  JobList.swift
//  JobPortal
//
//  Created by Simi Foss on 4/27/18.
//  Copyright © 2018 Simi Foss. All rights reserved.
//

import UIKit

class JobList: NSObject {
    var jobType : String
    var location : String
    var desc : String
    var companyName : String
    var jobTitle : String
    var department : String
    var postedBy : String
    var jobId : String
    
    
    init(jobType : String, location : String, desc : String, companyName : String, jobTitle : String, department : String, postedBy : String, jobId: String) {
        self.jobType   = jobType
        self.location = location
        self.desc  = desc
        self.companyName = companyName
        self.jobTitle = jobTitle
        self.department  = department
        self.postedBy  = postedBy
        self.jobId = jobId
    }
}
