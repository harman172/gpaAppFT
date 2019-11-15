//
//  SemestersListTVC.swift
//  Harmanpreet_C0765590_gpaAPP
//
//  Created by Harmanpreet Kaur on 2019-11-15.
//  Copyright © 2019 Harmanpreet Kaur. All rights reserved.
//

import UIKit

class SemestersListTVC: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        Semesters.semesters = []
        
        let sem1 = Semesters(semester: "Semester 1", courses: ["MAD 3004","MAD 2303", "MAD 3463", "MAD 3115", "MAD 3125"])
        let sem2 = Semesters(semester: "Semester 2", courses: ["MAD 3001","MAD 2234", "MAD 2115", "MAD 3632", "MAD 4115"])
        let sem3 = Semesters(semester: "Semester 3", courses: ["MAD 2003","MAD 2016", "MAD 3006", "MAD 3215", "MAD 3022"])
        
        Semesters.semesters.append(sem1)
        Semesters.semesters.append(sem2)
        Semesters.semesters.append(sem3)
        
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
        return Semesters.semesters.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // Configure the cell...
        if let cell = tableView.dequeueReusableCell(withIdentifier: "semCell"){
            cell.textLabel?.text = Semesters.semesters[indexPath.row].semester
            
            var GPA = " "
            if !Student.students[Student.curStudentIndex].grades.isEmpty{
                GPA = "\(Student.students[Student.curStudentIndex].grades[Semesters.semesters[indexPath.row].semester] ?? 0.0)"
            }
            cell.detailTextLabel?.text = GPA
            return cell
        }
        return UITableViewCell()
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

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        if let dest = segue.destination as? GPACalculatorVC{
            if let tableCell = sender as? UITableViewCell{
                if let index = tableView.indexPath(for: tableCell)?.row{
                    dest.curSem = index
                }
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }

}
