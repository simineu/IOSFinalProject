//
//  User.swift
//  JobPortal
//
//  Created by Simi Foss on 4/28/18.
//  Copyright © 2018 Simi Foss. All rights reserved.
//

import UIKit

class User: NSObject {
    
    var email : String = ""
    var userId: String = ""
    
    init(email: String, userId: String){
    self.email = email
    self.userId = userId
    
    }
}
