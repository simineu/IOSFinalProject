//
//  EmployerSendMessageViewController.swift
//  JobPortal
//
//  Created by Simi Foss on 4/28/18.
//  Copyright © 2018 Simi Foss. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class EmployerSendMessageViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource{
    var ref:DatabaseReference?
    var databaseHandler: DatabaseHandle?
    
    var usr = ["ab@co.in","xy@co.in","qw@co.in","pooja@gmail.com"];
    
    var x:String?
    
    @IBOutlet weak var pickerView: UIPickerView!
    
    @IBOutlet weak var message: UITextView!
    @IBOutlet weak var sendMessage: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        pickerView.delegate = self
        pickerView.dataSource = self
        pickerView.reloadAllComponents()
    }

    
   
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
        func numberOfComponents(in pickerView: UIPickerView) -> Int {
            return 1
        }
    
    
    
    var t:String?;

        func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
            return usr.count
        }

        func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
           x = usr[row]
            return usr[row]
        }

    
    @IBAction func sendBtn(_ sender: Any) {
        self.ref?.child("message").childByAutoId().setValue(["sender" : (Auth.auth().currentUser?.email)!, "message": message.text!, "to": x!])
        let alertView = UIAlertView();
        alertView.addButton(withTitle: "OK");
        alertView.title = "Alert";
        alertView.message = "Message sent Successfully";
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
//    let id = String(describing: Auth.auth().currentUser?.uid);
//    let email = Auth.auth().currentUser?.email
//    //let toid = x.
//    @IBAction func sendMessage(_ sender: Any) {
//        self.ref?.child("message").childByAutoId().setValue(["from" : id, "fromEmail": email, "to": x.id?])
  //  }
    

}
