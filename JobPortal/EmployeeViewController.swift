//
//  LogoutViewController.swift
//  JobPortal
//
//  Created by Simi Foss on 4/16/18.
//  Copyright © 2018 Simi Foss. All rights reserved.
//

import UIKit
import Firebase

class EmployeeViewController: UIViewController {

    @IBOutlet weak var trailing: NSLayoutConstraint!
    
    @IBOutlet weak var leading: NSLayoutConstraint!
    
    var menuShowing = false
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func logout(_ sender: Any) {
        let firebaseAuth = Auth.auth()
        do {
            try firebaseAuth.signOut()
        } catch let signOutError as NSError {
            print ("Error signing out: %@", signOutError)
        }
        self.dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func showSideView(_ sender: Any) {
        if (menuShowing){
            leading.constant = 0
            trailing.constant = 0
        }
        else{
        leading.constant = 120
        trailing.constant = 120
        }
        
        UIView.animate(withDuration: 0.3, animations: {self.view.layoutIfNeeded()})
         menuShowing = !menuShowing
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
