//
//  Applications.swift
//  JobPortal
//
//  Created by Simi Foss on 4/27/18.
//  Copyright © 2018 Simi Foss. All rights reserved.
//

import UIKit

class Applications: NSObject {
    var employeeName : String
    var relocation : String
    var education : String
    var applicationId : String
    var appliedBy: String
    var appliedFor: String
    var availableFrom : String
    var resumeURL : String
    var postedBy: String
    var position: String
    
    init(employeeName : String, relocation : String, education : String, applicationId : String, appliedBy: String,
         appliedFor: String, availableFrom : String, resumeURL : String, postedBy: String, position: String) {
        self.employeeName = employeeName
        self.relocation = relocation
        self.education = education
        self.applicationId = applicationId
        self.appliedBy = appliedBy
        self.appliedFor = appliedFor
        self.availableFrom = availableFrom
        self.resumeURL = resumeURL
        self.postedBy = postedBy
        self.position = position
    }
    
}
