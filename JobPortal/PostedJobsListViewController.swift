//
//  PostedJobsListViewController.swift
//  JobPortal
//
//  Created by Simi Foss on 4/24/18.
//  Copyright © 2018 Simi Foss. All rights reserved.
//

import UIKit
import FirebaseDatabase
import Firebase



class PostedJobsListViewController: UITableViewController, UISearchResultsUpdating {
     var ref:DatabaseReference?
    var databaseHandler: DatabaseHandle?
    
    var jobList = [Jobs]();
    
    var filteredJobs = [Jobs]();
    
    var searchController = UISearchController(searchResultsController: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        jobList = [];

        ref = Database.database().reference();
        
        // Do any additional setup after loading the view.
        
        databaseHandler = ref?.child("jobs").observe(.childAdded, with: { (snapshot) in
                let temp = snapshot.value as? NSDictionary
            
            let companyName = temp!["companyName"] as? String ?? ""
            let jobType = temp!["jobType"] as? String ?? ""
            let location = temp!["location"] as? String ?? ""
            let desc = temp!["description"] as? String ?? ""
            let jobTitle = temp!["jobTitle"] as? String ?? ""
            let department = temp!["department"] as? String ?? ""
            let postedBy = temp!["postedBy"] as? String ?? ""
                            print(department)
            
            if Auth.auth().currentUser?.uid == postedBy {
            var j = Jobs(jobType: jobType, location: location, desc: desc, companyName: companyName, jobTitle: jobTitle, department: department, postedBy: postedBy)
            
                            self.jobList.append(j)
            }
                            print(self.jobList.count)
                            for i in self.jobList{
                                print(i.companyName)
                            }
                           // print(self.jobData)
            self.filteredJobs = self.jobList
                           self.tableView.reloadData()
            
        })
        
//        databaseHandler = ref?.child("jobs").observe(.childAdded, with: { (snapshot) in
//
//            for child in snapshot.children{
//                let snap = child as! DataSnapshot
//
//                let temp = snap.value as! NSDictionary
//
//                let companyName = temp["companyName"] as? String ?? ""
//                let jobType = temp["jobType"] as? String ?? ""
//                let location = temp["location"] as? String ?? ""
//                let desc = temp["description"] as? String ?? ""
//                let jobTitle = temp["jobTitle"] as? String ?? ""
//                let department = temp["department"] as? String ?? ""
//                print(department)
//
//                var j = Jobs(jobType: jobType, location: location, desc: desc, companyName: companyName, jobTitle: jobTitle, department: department)
//
//                self.jobList.append(j)
//                print(self.jobList.count)
//                for i in self.jobList{
//                    print(i.companyName)
//                }
//               // print(self.jobData)
//               self.tableView.reloadData()
//            }
//
//
//        }){ (error) in
//            print(error.localizedDescription)
//        }
        
    
        tableView.reloadData()
        
        searchController.searchResultsUpdater = self
        searchController.hidesNavigationBarDuringPresentation = false
        searchController.dimsBackgroundDuringPresentation = false
        
        tableView.tableHeaderView = searchController.searchBar
        
        super.viewDidLoad()
    }

    func updateSearchResults(for searchController: UISearchController) {
        tableView.reloadData()
        if let searchText = searchController.searchBar.text, !searchText.isEmpty {
            filteredJobs = jobList.filter({
                (eachJob : Jobs) -> Bool in return
                (eachJob.jobTitle.lowercased().contains(searchText.lowercased()))
            })
        }
        else {
            filteredJobs = jobList
        }
        tableView.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        
        print("Count++",jobList.count)
        return filteredJobs.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        for i in jobList{
            print("Hello",i.companyName);
        }
        print("INSIDE TABLE VIEW ")
        let cellIdentifier = "EmployerJobTableViewCell"
        //        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "RoomTableViewCell")
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? EmployerJobTableViewCell else {
            fatalError("The dequeued cell is not an instance of RoomTableViewCell.")
        }
        
        let jb = filteredJobs[indexPath.row]
        cell.companyNameLbl.text = String(describing: jb.companyName);
        cell.jobPositionLbl.text = String(describing: jb.jobTitle)
        // Configure the cell...
        
        return cell
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
