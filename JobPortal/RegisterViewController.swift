//
//  RegisterViewController.swift
//  JobPortal
//
//  Created by Simi Foss on 4/15/18.
//  Copyright © 2018 Simi Foss. All rights reserved.
//

import UIKit
import FirebaseDatabase
import Firebase

class RegisterViewController: UIViewController {
    var ref: DatabaseReference!
    
   
    @IBOutlet weak var registerEmail: UITextField!
    
    @IBOutlet weak var registerPswd: UITextField!
    
    @IBOutlet weak var userSegment: UISegmentedControl!
    
    var type:String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ref = Database.database().reference()
        // Do any additional setup after loading the view.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    @IBOutlet weak var registerBtn: UIButton!
    
    @IBAction func registerButton(_ sender: UIButton) {
        if userSegment.selectedSegmentIndex == 0 {
            type = "Employer"
        }
        else if userSegment.selectedSegmentIndex == 1 {
            type = "Employee"
        }
        if let email = registerEmail.text, let password = registerPswd.text {
            Auth.auth().createUser(withEmail: email, password: password) { (user, error) in
                if let u = user {
                    self.ref.child("users").childByAutoId().setValue(["username": email, "type": self.type!])
                    if self.type! == "Employer" {
                    self.performSegue(withIdentifier: "Employer", sender: self)
                    }
                    else if self.type == "Employee" {
                        self.performSegue(withIdentifier: "Employee", sender: self)
                    }
                    
                }
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
