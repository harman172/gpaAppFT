//
//  SemestersListTVC.swift
//  Harmanpreet_C0765590_gpaAPP
//
//  Created by Harmanpreet Kaur on 2019-11-15.
//  Copyright © 2019 Harmanpreet Kaur. All rights reserved.
//

import UIKit

class SemestersListTVC: UITableViewController {
    
    var curStudentIndex = -1
    var curStudentID: String?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        
        for index in Student.students.indices{
            if Student.students[index].id == curStudentID{
                curStudentIndex = index
                break
            }
        }
        
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
        
        return Student.students[curStudentIndex].semesters.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // Configure the cell...
        if let cell = tableView.dequeueReusableCell(withIdentifier: "semCell"){
            
            cell.textLabel?.text = Student.students[curStudentIndex].semesters[indexPath.row].semesterName
            
            if let gpa = Student.students[curStudentIndex].semesters[indexPath.row].grades{
                cell.detailTextLabel?.text = String(format: "%.2f", gpa)
            }
            
            return cell
        }
        return UITableViewCell()
    }
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        if let dest = segue.destination as? GPACalculatorVC{
            if let tableCell = sender as? UITableViewCell{
                if let index = tableView.indexPath(for: tableCell)?.row{
                    dest.curSem = index
                    dest.curStudent = curStudentIndex
                }
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
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
