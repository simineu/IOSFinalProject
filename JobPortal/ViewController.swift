//
//  ViewController.swift
//  JobPortal
//
//  Created by Simi Foss on 4/14/18.
//  Copyright © 2018 Simi Foss. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class ViewController: UIViewController {
    var ref: DatabaseReference!
    
    
    @IBOutlet weak var signInEmailText: UITextField!
    
    @IBOutlet weak var signInPasswordText: UITextField!
    
    
    
    @IBOutlet weak var signInBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        ref = Database.database().reference()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @IBAction func signInButton(_ sender: Any) {
        var type:String = ""
        if let email = signInEmailText.text, let password = signInPasswordText.text {
            Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
                if let u = user {
                    
                   
                    let userID = Auth.auth().currentUser?.uid
                    self.ref.child("users").child(userID!).observeSingleEvent(of: .value, with: { (snapshot) in
                        // Get user value
                        let value = snapshot.value as? NSDictionary
                        type = value?["type"] as? String ?? ""
                        print(type);
                        if type == "Employer" {
                            self.performSegue(withIdentifier: "signedEmployer", sender: self)
                        }
                        else if type == "Employee" {
                            self.performSegue(withIdentifier: "signedEmplyee", sender: self)
                        }                        // ...
                    }) { (error) in
                        print(error.localizedDescription)
                    }
                    
                    
                }
            }
        }
        
        
        
    }
    

}

