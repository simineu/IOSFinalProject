//
//  ApplicationViewViewController.swift
//  JobPortal
//
//  Created by Simi Foss on 4/27/18.
//  Copyright © 2018 Simi Foss. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class ApplicationViewViewController: UIViewController {

    var getApplication:Applications!
    
    @IBOutlet weak var nameLbl: UILabel!
    
    @IBOutlet weak var educationLbl: UILabel!
    
    @IBOutlet weak var availableLbl: UILabel!
    
    @IBOutlet weak var relocationLbl: UILabel!
    
    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLbl.text = getApplication.employeeName
        educationLbl.text = getApplication.education
        availableLbl.text = getApplication.availableFrom
        relocationLbl.text = getApplication.relocation
        imageView.image = UIImage(named:
            "resume");
        //let data = NSData(contentsOf: (getApplication.resumeURL as? URL)!)
        //imageView.image = UIImage(data: data! as Data)
        
        let url2 = NSURL(string: getApplication.resumeURL)  //postPhoto URL
        let data = NSData(contentsOf: url2! as URL) // this URL convert into Data
        if data != nil {  //Some time Data value will be nil so we need to validate such things
            imageView.image = UIImage(data: data! as Data)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
