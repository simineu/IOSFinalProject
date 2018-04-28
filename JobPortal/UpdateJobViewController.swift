//
//  UpdateJobViewController.swift
//  JobPortal
//
//  Created by Simi Foss on 4/27/18.
//  Copyright © 2018 Simi Foss. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class UpdateJobViewController: UIViewController {

    var ref: DatabaseReference!
    
    @IBOutlet weak var companyNameTxtField: UITextField!
    
    @IBOutlet weak var departmentTxtField: UITextField!
    
    @IBOutlet weak var jobTitleTextField: UITextField!
    
    @IBOutlet weak var jobTypeSegment: UISegmentedControl!
    
    
    @IBOutlet weak var jobLocationTxtField: UITextField!
    
    var key:String?
    
    @IBOutlet weak var jobDescTextView: UITextView!
    var uid = Auth.auth().currentUser?.uid;
    var getJob:JobList!
    override func viewDidLoad() {
        super.viewDidLoad()
        ref = Database.database().reference()
        companyNameTxtField.text = getJob.companyName
        
        jobTitleTextField.text = getJob.jobTitle
        
        departmentTxtField.text = getJob.department
        
        if getJob.jobType == "Fulltime"{
        jobTypeSegment.selectedSegmentIndex == 0
        }
        else{
            jobTypeSegment.selectedSegmentIndex == 1
        }
        jobLocationTxtField.text = getJob.location
        
        jobDescTextView.text = getJob.desc
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var update: UIButton!
    
    
    @IBAction func updateBtn(_ sender: Any) {
        var type:String!
        if jobTypeSegment.selectedSegmentIndex == 0 {
            type = "Fulltime";
        }
        else
        {
            type = "Internship"
        }
        let updtJob = ["postedBy": uid, "companyName": companyNameTxtField.text, "jobTitle": jobTitleTextField.text, "department": departmentTxtField.text, "jobType":type, "location": jobLocationTxtField.text, "description": jobDescTextView.text]
        
        key =  String(describing:(getJob?.jobId)!)
        print("Job ID", key!)
        
        let updtRef = ref.child("/jobs/\(key!)")
        updtRef.updateChildValues((updtJob as? [AnyHashable : Any])!)
        let alertView = UIAlertView();
        alertView.addButton(withTitle: "OK");
        alertView.title = "Alert";
        alertView.message = "Job Updated Successfully";
        alertView.show();
        _ = navigationController?.popToRootViewController(animated: true)
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
