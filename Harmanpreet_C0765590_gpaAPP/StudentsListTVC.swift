//
//  StudentsListTVC.swift
//  Harmanpreet_C0765590_gpaAPP
//
//  Created by Harmanpreet Kaur on 2019-11-13.
//  Copyright © 2019 Harmanpreet Kaur. All rights reserved.
//

import UIKit

class StudentsListTVC: UITableViewController, UISearchResultsUpdating {
    
    let searchController = UISearchController(searchResultsController: nil)
    
    var filteredData: [Student]!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        searchController.searchResultsUpdater = self
        self.navigationItem.searchController = searchController
        searchController.dimsBackgroundDuringPresentation = false
        
        filteredData = Student.students
        
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        
        if let searchText = searchController.searchBar.text{
            
            filteredData = searchText.isEmpty ? Student.students : Student.students.filter({ (student) -> Bool in
                let name = student.firstName + " " + student.lastName
                return name.lowercased().contains(searchText.lowercased())
            })
            
            
        }
        
        tableView.reloadData()
    }

    // MARK: - Table view data source

    /*
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }
 
 */
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
    
        return filteredData.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

//      Configure the cell...

        if let cell = tableView.dequeueReusableCell(withIdentifier: "studentCell"){
            
            cell.textLabel?.text = filteredData[indexPath.row].firstName + " " + filteredData[indexPath.row].lastName
            if let cgpa = filteredData[indexPath.row].cgpa{
                cell.detailTextLabel?.text = String(format: "%.2f", cgpa)
            }
            
            return cell
        }
        return UITableViewCell()
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        Student.curStudentIndex = indexPath.row
    }
    
    override func viewWillAppear(_ animated: Bool) {
        filteredData = Student.students
        tableView.reloadData()
    }
    
     // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       // Get the new view controller using segue.destination.
       // Pass the selected object to the new view controller.
       
       if let destSemList = segue.destination as? SemestersListTVC{
           
           if let tableCell = sender as? UITableViewCell{
               if let index = tableView.indexPath(for: tableCell)?.row{
    //                    destSemList.curStudentIndex = index
                   destSemList.curStudentID = filteredData[index].id
               }
           }
       }
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
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
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

    
  
   

}
