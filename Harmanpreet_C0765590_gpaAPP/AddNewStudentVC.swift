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
            
                let s = Student(firstName: fname, lastName: lname, id: id)
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
    }
    
    func okAlert(title: String, message: String){
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        okAction.setValue(UIColor.brown, forKey: "titleTextColor")
        
        alertController.addAction(okAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    func confirmationAlert(title: String, message: String, studentName: String) -> Bool{
        var confirm = false
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .actionSheet)
        let noAction = UIAlertAction(title: "No Way!", style: .cancel, handler: nil)
        let yesAction = UIAlertAction(title: "Yes, I'm Sure!", style: .default) { (yesaction) in
            confirm = true
            self.okAlert(title: "New Contact Saved", message: " is now a student")
        }
        
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
