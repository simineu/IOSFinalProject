//
//  Message.swift
//  JobPortal
//
//  Created by Simi Foss on 4/28/18.
//  Copyright © 2018 Simi Foss. All rights reserved.
//

import UIKit

class Message: NSObject {
    var from : String = ""
    var to : String = ""
    var message: String = ""
    
    init(from: String, to: String,  message: String){
        self.from = from
        self.to = to
        self.message = message
    }
}
