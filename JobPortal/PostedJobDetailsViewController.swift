//
//  PostedJobDetailsViewController.swift
//  JobPortal
//
//  Created by Simi Foss on 4/27/18.
//  Copyright © 2018 Simi Foss. All rights reserved.
//

import UIKit

class PostedJobDetailsViewController: UIViewController, UITextViewDelegate {

    
    var getJob:JobList!
    
    @IBOutlet weak var companyNameLbl: UILabel!
    
    @IBOutlet weak var departmentLbl: UILabel!
    
    @IBOutlet weak var jobTitleLbl: UILabel!
    
    @IBOutlet weak var jobTypeLbl: UILabel!
    
    @IBOutlet weak var jobLocationLbl: UILabel!
    
    @IBOutlet weak var jobDesc: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()

        companyNameLbl.text = getJob.companyName
        departmentLbl.text = getJob.department
        jobTitleLbl.text = getJob.jobTitle
        jobTypeLbl.text = getJob.jobType
        jobLocationLbl.text = getJob.location
        jobDesc.text = getJob.desc
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: (Any)?) {
        if segue.identifier == "updateSegue" {
            if let destinationVC = segue.destination as? UpdateJobViewController {
                destinationVC.getJob = getJob
            }
        }
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
