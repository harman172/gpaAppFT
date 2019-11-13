//
//  AddNewStudentVC.swift
//  Harmanpreet_C0765590_gpaAPP
//
//  Created by Harmanpreet Kaur on 2019-11-13.
//  Copyright © 2019 Harmanpreet Kaur. All rights reserved.
//

import UIKit

class AddNewStudentVC: UIViewController {

    @IBOutlet weak var txtFirstName: UITextField!
    @IBOutlet weak var txtLastName: UITextField!
    @IBOutlet weak var txtID: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnSave(_ sender: UIButton) {
        var alreadyExists = false
        
        let fname = txtFirstName.text!
        let lname = txtLastName.text!
        let id = txtID.text!
        
        guard !fname.isEmpty && !lname.isEmpty && !id.isEmpty else {
            print(fname.isEmpty)
            return
        }
        
        for students in Student.students{
            if students.id == id{
                alreadyExists = true
                break
            }
        }
        
        if alreadyExists{
            print("Already taken")
        }
        else{
            let s = Student(firstName: fname, lastName: lname, id: id)
            Student.students.append(s)
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
