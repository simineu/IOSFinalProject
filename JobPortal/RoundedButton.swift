//
//  RoundedButton.swift
//  JobPortal
//
//  Created by Simi Foss on 4/17/18.
//  Copyright © 2018 Simi Foss. All rights reserved.
//

import UIKit

@IBDesignable
class RoundedButton: UIButton {

    @IBInspectable var cornerRadius:CGFloat = 0 {
        didSet {
            self.layer.cornerRadius = cornerRadius
        }
    }
    
    @IBInspectable var borderWidth:CGFloat = 0 {
        didSet {
            self.layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable var borderColor:UIColor = UIColor.clear {
        didSet {
            self.layer.borderColor = borderColor.cgColor
        }
    }
    
}
