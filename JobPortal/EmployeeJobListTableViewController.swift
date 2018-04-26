//
//  EmployeeJobListTableViewController.swift
//  JobPortal
//
//  Created by Simi Foss on 4/25/18.
//  Copyright © 2018 Simi Foss. All rights reserved.
//

import UIKit
import FirebaseDatabase
import Firebase

class EmployeeJobListTableViewController: UITableViewController, UISearchResultsUpdating {

    var ref:DatabaseReference?
    var databaseHandler: DatabaseHandle?
    
    var jobList = [Jobs]();
    var filteredJobs = [Jobs]();
    
    var searchController = UISearchController(searchResultsController: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        jobList = [];
        
        ref = Database.database().reference();
        
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
            
            var j = Jobs(jobType: jobType, location: location, desc: desc, companyName: companyName, jobTitle: jobTitle, department: department, postedBy: postedBy)
            
            self.jobList.append(j)
            print(self.jobList.count)
            for i in self.jobList{
                print(i.companyName)
            }
            
            // print(self.jobData)
            self.filteredJobs = self.jobList
            self.tableView.reloadData()
            
        })
        
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

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return filteredJobs.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        for i in jobList{
            print("Hello",i.companyName);
        }
        print("INSIDE TABLE VIEW ")
        let cellIdentifier = "jobList"
        //        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "RoomTableViewCell")
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? JobListTableViewCell else {
            fatalError("The dequeued cell is not an instance of RoomTableViewCell.")
        }
        
        let jb = filteredJobs[indexPath.row]
        cell.companyLbl.text = String(describing: jb.companyName);
        cell.positionLbl.text = String(describing: jb.jobTitle)
        cell.locationLbl.text = String(describing: jb.location)
        // Configure the cell...
        
        return cell
    }
 

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
