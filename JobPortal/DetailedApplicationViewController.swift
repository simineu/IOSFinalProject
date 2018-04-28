//
//  DetailedApplicationViewController.swift
//  JobPortal
//
//  Created by Simi Foss on 4/28/18.
//  Copyright © 2018 Simi Foss. All rights reserved.
//

import UIKit

class DetailedApplicationViewController: UIViewController {

    var getApplication:Applications!
    @IBOutlet weak var namelbl: UILabel!
    @IBOutlet weak var educationLbl: UILabel!
    
    @IBOutlet weak var dateLbl: UILabel!
    
    @IBOutlet weak var locationLbl: UILabel!
    
    
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        namelbl.text = getApplication.employeeName
        educationLbl.text = getApplication.education
        dateLbl.text = getApplication.availableFrom
        locationLbl.text = getApplication.relocation
        imageView.image = UIImage(named:
            "resume");
        //let data = NSData(contentsOf: (getApplication.resumeURL as? URL)!)
        //imageView.image = UIImage(data: data! as Data)
        
        let url2 = NSURL(string: getApplication.resumeURL)  //postPhoto URL
        let data = NSData(contentsOf: url2! as URL) // this URL convert into Data
        if data != nil {  //Some time Data value will be nil so we need to validate such things
            imageView.image = UIImage(data: data! as Data)
        }
        // Do any additional setup after loading the view.
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
