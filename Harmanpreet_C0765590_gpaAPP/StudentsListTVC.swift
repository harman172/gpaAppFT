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
    var filteredData: [Student] = []
    
    var isSearchBarEmpty: Bool {
      return searchController.searchBar.text?.isEmpty ?? true
    }
    var isFiltering: Bool {
      return searchController.isActive && !isSearchBarEmpty
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        searchController.searchResultsUpdater = self
        self.navigationItem.searchController = searchController

        
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        
        if let searchText = searchController.searchBar.text{
            
            filteredData = Student.students.filter{ (student) -> Bool in
                let name = student.firstName + " " + student.lastName
                return name.lowercased().contains(searchText.lowercased())
            }
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
        
        if isFiltering{
            return filteredData.count
        }
        
        return Student.students.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

//      Configure the cell...

        if let cell = tableView.dequeueReusableCell(withIdentifier: "studentCell"){
            
            let name: String
            if isFiltering{
                name = filteredData[indexPath.row].firstName + " " + filteredData[indexPath.row].lastName
            } else{
                name = Student.students[indexPath.row].firstName + " " + Student.students[indexPath.row].lastName
            }
            cell.textLabel?.text = name
            
            if !Student.students[indexPath.row].grades.isEmpty{
                calculateCGPA(index: indexPath.row)
                cell.detailTextLabel?.text = "\(Student.students[indexPath.row].CGPA)"
            }
           
          
            return cell
        }
        return UITableViewCell()
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        Student.curStudentIndex = indexPath.row
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    
    func calculateCGPA(index: Int){
        var numberOfSem = 0
        var totalGrades = 0.0
        for grades in Student.students[index].grades.values{
            numberOfSem += 1
            totalGrades += grades
        }
        
        Student.students[index].CGPA = (totalGrades / Double(numberOfSem))
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
