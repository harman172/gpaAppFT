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
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(viewTapped))
        self.view.addGestureRecognizer(tapGesture)

        // Do any additional setup after loading the view.
    }
    
    @objc func viewTapped(){
        txtFirstName.resignFirstResponder()
        txtLastName.resignFirstResponder()
        txtID.resignFirstResponder()
    }
    
    
    @IBAction func textFieldDoneEditing(_ sender: UITextField) {
        txtFirstName.resignFirstResponder()
    }
    
    
    @IBAction func btnSave(_ sender: UIButton) {
        var alreadyExists = false
        
        let fname = txtFirstName.text!
        let lname = txtLastName.text!
        let id = txtID.text!
        
        guard !fname.isEmpty && !lname.isEmpty && !id.isEmpty else {
            okAlert(title: "Warning!!", message: "None of the fields can be empty.")
            return
        }
        
        for students in Student.students{
            if students.id == id{
                alreadyExists = true
                break
            }
        }
        
        if alreadyExists{
            okAlert(title: "Already registered", message: "The student has already been registered.")
        }
        else{
            
            
            let alertController = UIAlertController(title: "Are you sure?", message: "", preferredStyle: .actionSheet)
            let noAction = UIAlertAction(title: "No Way!", style: .cancel, handler: nil)
            let yesAction = UIAlertAction(title: "Yes, I'm Sure!", style: .default) { (yesaction) in
            
                
                
                let s = Student(firstName: fname, lastName: lname, id: id, semesters: self.addSemestersCourses())
                
                Student.students.append(s)
                self.okAlert(title: "New Contact Saved", message: "\(fname) is now a student")
                self.txtFirstName.text = ""
                self.txtLastName.text = ""
                self.txtID.text = ""
            }
            
            alertController.addAction(noAction)
            alertController.addAction(yesAction)
            
            self.present(alertController, animated: true, completion: nil)
            
        }
        
        self.view.endEditing(true)
    }
    
    
    
    func addSemestersCourses() -> [Semester]{
        
        let coursesSem1 = [Course(courseName: "MADT 3004", marksObtained: nil),
                        Course(courseName: "MADT 2303", marksObtained: nil),
                        Course(courseName: "MADT 3463", marksObtained: nil),
                        Course(courseName: "MADT 3115", marksObtained: nil),
                        Course(courseName: "MADT 3125", marksObtained: nil)]
        let coursesSem2 = [Course(courseName: "MADT 3001", marksObtained: nil),
                        Course(courseName: "MADT 2234", marksObtained: nil),
                        Course(courseName: "MADT 2115", marksObtained: nil),
                        Course(courseName: "MADT 3632", marksObtained: nil),
                        Course(courseName: "MADT 4115", marksObtained: nil)]
        let coursesSem3 = [Course(courseName: "MADT 2003", marksObtained: nil),
                        Course(courseName: "MADT 2016", marksObtained: nil),
                        Course(courseName: "MADT 3006", marksObtained: nil),
                        Course(courseName: "MADT 3215", marksObtained: nil),
                        Course(courseName: "MADT 3022", marksObtained: nil)]
        
        let sem1 = Semester(semesterName: "Semester 1", courses: coursesSem1)
        let sem2 = Semester(semesterName: "Semester 2", courses: coursesSem2)
        let sem3 = Semester(semesterName: "Semester 3", courses: coursesSem3)
        
        return [sem1, sem2, sem3]
    }
    
    
    func okAlert(title: String, message: String){
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
//        okAction.setValue(UIColor.brown, forKey: "titleTextColor")
        
        alertController.addAction(okAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    
    func confirmationAlert(title: String, message: String, studentName: String) -> Bool{
        var confirm = false
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .actionSheet)
//        alertController.setValue(UIColor.black, forKey: "attributedTitle")
        
        let noAction = UIAlertAction(title: "No Way!", style: .destructive, handler: nil)
        let yesAction = UIAlertAction(title: "Yes, I'm Sure!", style: .default) { (yesaction) in
            confirm = true
            self.okAlert(title: "New Contact Saved", message: " is now a student")
        }
//        yesAction.setValue(UIColor.orange, forKey: "titleTextColor")
        
        alertController.addAction(noAction)
        alertController.addAction(yesAction)
        
        self.present(alertController, animated: true, completion: nil)
        return confirm
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
