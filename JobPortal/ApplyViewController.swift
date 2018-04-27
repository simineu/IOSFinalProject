//
//  ApplyViewController.swift
//  JobPortal
//
//  Created by Simi Foss on 4/26/18.
//  Copyright © 2018 Simi Foss. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class ApplyViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    var ref: DatabaseReference!
    var getJob:JobList?
    
   
    
    @IBOutlet weak var pickerView: UIPickerView!
    
    @IBOutlet weak var availableDatePicker: UIDatePicker!
    
    @IBOutlet weak var relocateSegment: UISegmentedControl!
    
    @IBOutlet weak var resume: UIImageView!
    
    
    var x:String = "";
    var edu = ["Masters", "Bacholers", "Doctorate", "High School", "Profesional"]
    
    @IBOutlet weak var selectFile: UIButton!
    
    
    @IBOutlet weak var nameTxtField: UITextField!
    
    @IBOutlet weak var applyBtn: UIButton!
    
    let imagePickerController = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(getJob?.jobId)
       pickerView.delegate = self
        pickerView.dataSource = self
        imagePickerController.delegate = self
        self.availableDatePicker.minimumDate = Date()
        ref = Database.database().reference()
        // Do any additional setup after loading the view.
        
//        let imageTap = UITapGestureRecognizer(target: self, action: "tapped image")
//        resume.isUserInteractionEnabled = true
//        resume.addGestureRecognizer(imageTap)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
    return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return edu.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        x = edu[row]
        //print("Selected Cust",edu[row])
        return edu[row]
    }
    
    
    @IBAction func selectFile(_ sender: Any) {
        imagePickerController.sourceType = .photoLibrary
        self.present(imagePickerController, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let chosenImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        resume.contentMode = .scaleAspectFit
        resume.image = chosenImage
        dismiss(animated:true, completion: nil)
    }

func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
    picker.dismiss(animated: true, completion: nil)
}
    
    
    @IBAction func applyBtn(_ sender: Any) {
        var reloc:String!
        if relocateSegment.selectedSegmentIndex == 0 {
            reloc = "Yes";
        }
        else
        {
            reloc = "No"
        }
         let uid = Auth.auth().currentUser?.uid
        let jobId = getJob?.jobId
        
        let dateformatter = DateFormatter()
        
        dateformatter.dateFormat = "MM-DD-YYYY"
        
        let now = dateformatter.string(from: availableDatePicker.date)
        
        print("NAME", nameTxtField.text!);
        self.ref.child("applications").childByAutoId().setValue(["appliedBy": uid, "applied for": jobId, "posted by": getJob?.postedBy, "education Level": x, "available from": now, "willing to relocate": reloc, "Name AppliedBy": nameTxtField.text!])
        
        let alertView = UIAlertView();
        alertView.addButton(withTitle: "OK");
        alertView.title = "Alert";
        alertView.message = "Applied Successfully";
        alertView.show();
    }
    
//    func uploadResume(_ image:UIImage, completion: @escaping ((_ url:String)->())){
//        let uid = Auth.auth().currentUser?.uid
//        let storageRef = Storage.storage().reference().child("user/\(uid)")
//
//        let imgData = UIImageJPEGRepresentation(image, 0.75)
//        let metaData = StorageMetadata()
//
//        metaData.contentType = "image/jpg"
//
//        storageRef.putData(imgData!, metadata: metaData){ metaData, error in
//            if error == nil, metaData != nil{
//                if let url = metaData?.down
//                    completion(url)
//                }else{
//                   completion(nil)
//                }
//            } else{
//
//            }
//        }
 //   }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
