//
//  PostJobViewController.swift
//  JobPortal
//
//  Created by Simi Foss on 4/24/18.
//  Copyright © 2018 Simi Foss. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class PostJobViewController: UIViewController {
    var ref: DatabaseReference!
    
    @IBOutlet weak var companyNameTxtField: UITextField!
    
    @IBOutlet weak var jobTitleTxtField: UITextField!
    
    @IBOutlet weak var departmentTxtField: UITextField!
    
    @IBOutlet weak var jobTypeSegment: UISegmentedControl!
    
    @IBOutlet weak var locationTxtField: UITextField!
    
    @IBOutlet weak var descriptionTxtField: UITextView!
    
    @IBOutlet weak var createBtn: UIButton!
    
    
    var uid = Auth.auth().currentUser?.uid;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ref = Database.database().reference()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    @IBAction func createBtn(_ sender: Any) {
        if companyNameTxtField.text == "" || jobTitleTxtField.text == "" || descriptionTxtField.text == "" || departmentTxtField.text == "" || locationTxtField.text == "" {
            let alertView = UIAlertView();
            alertView.addButton(withTitle: "OK");
            alertView.title = "Alert";
            alertView.message = "All Fields are required";
            alertView.show();        }
        else{
       var type:String!
        if jobTypeSegment.selectedSegmentIndex == 0 {
            type = "Fulltime";
        }
        else
        {
            type = "Internship"
        }
        
        self.ref.child("jobs").childByAutoId().setValue(["postedBy": uid, "companyName": companyNameTxtField.text, "jobTitle": jobTitleTxtField.text, "department": departmentTxtField.text, "jobType":type, "location": locationTxtField.text, "description": descriptionTxtField.text])
            
            companyNameTxtField.text = "";
            jobTitleTxtField.text = "";
            descriptionTxtField.text = "";
            departmentTxtField.text = "";
            locationTxtField.text = ""
            
            let alertView = UIAlertView();
            alertView.addButton(withTitle: "OK");
            alertView.title = "Alert";
            alertView.message = "Job Posted Successfully";
            alertView.show();
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
