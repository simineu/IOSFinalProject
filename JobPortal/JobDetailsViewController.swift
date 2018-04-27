//
//  JobDetailsViewController.swift
//  JobPortal
//
//  Created by Simi Foss on 4/26/18.
//  Copyright © 2018 Simi Foss. All rights reserved.
//

import UIKit

class JobDetailsViewController: UIViewController, UITextViewDelegate {

    var getJob:JobList?
    
    @IBOutlet weak var departmentLbl: UILabel!
    
    @IBOutlet weak var companyNameLbl: UILabel!
    
    @IBOutlet weak var jobTitleLbl: UILabel!
    
    
    @IBOutlet weak var jobTypeLbl: UILabel!
    
    @IBOutlet weak var jobLocationLbl: UILabel!
  
    @IBOutlet weak var descriptionTextView: UITextView!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        departmentLbl.text = getJob?.department
        jobTitleLbl.text = getJob?.jobTitle
        jobTypeLbl.text = getJob?.jobType
        jobLocationLbl.text = getJob?.location
        descriptionTextView.text = getJob?.desc
        companyNameLbl.text = getJob?.companyName
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: (Any)?) {
        if segue.identifier == "ShowCounterSegue" {
            if let destinationVC = segue.destination as? ApplyViewController {
                destinationVC.getJob = getJob
            }
        }
    
//    @IBAction func applyBtn(_ sender: Any) {
//        let applyiewController = ApplyViewController()
//        applyiewController.getJob = getJob
//        applyiewController.view.reloadInputViews()
////        navigationController?.show(applyiewController, sender: (Any).self)
//        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
//        let applyView = storyboard?.instantiateViewController(withIdentifier: "ApplyViewController")
//        self.navigationController?.pushViewController(applyView!, animated: true)
////        navigationController?.present((storyboard?.instantiateViewController(withIdentifier: "ApplyViewController"))!, animated: true, completion: nil)
//
////        letlet storyBoard storyBoard::UIStoryboardUIStoryboard  ==  UIStoryboardUIStoryboard((namename::  "Main""Main",, bundle bundle::  nilnil))
////        letlet viewController2  viewController2 == storyBoard storyBoard..instantiateViewControllerinstantiateViewController((withIdentifierwithIdentifier::  "ViewController2""ViewController2"))
////        selfself..navigationControllernavigationController?.?.pushViewControllerpushViewController((viewController2viewController2,, animated animated::  truetrue))
//
//    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    }
}
