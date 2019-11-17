//
//  GPACalculatorVC.swift
//  Harmanpreet_C0765590_gpaAPP
//
//  Created by Harmanpreet Kaur on 2019-11-14.
//  Copyright © 2019 Harmanpreet Kaur. All rights reserved.
//

import UIKit
import AVFoundation

class GPACalculatorVC: UIViewController {
    
    
    @IBOutlet var txtCourses: [UITextField]!
    @IBOutlet var courseNames: [UILabel]!
    @IBOutlet weak var labelResult: UILabel!
    @IBOutlet weak var calculate: UIButton!
    
    var audioPlayer: AVAudioPlayer!
    var curSem: Int?
    var curStudent: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(viewTapped))
        self.view.addGestureRecognizer(tapGesture)
        
        for index in Student.students[curStudent!].semesters[curSem!].courses.indices{
            courseNames[index].text = "\(Student.students[curStudent!].semesters[curSem!].courses[index].courseName)"
            
            let marks = Student.students[curStudent!].semesters[curSem!].courses[index].marksObtained
            if marks != nil{
                txtCourses[index].text = "\(marks!)"
            }
            
            let gpa = Student.students[curStudent!].semesters[curSem!].grades
            if gpa != nil{
                labelResult.text = String(format: "%.2f / 4" , gpa!)
            }
            else{
                labelResult.text = "ex. 0/4"
            }
//            print("GPACalc...... ",courseNames[index].text)
        }
    }
    
    @objc func viewTapped(){
        for index in txtCourses.indices{
            txtCourses[index].resignFirstResponder()
        }
    }
    
    
    @IBAction func btnCalculate(_ sender: UIButton) {
        
        var courses = [String]()
        
        for index in txtCourses.indices{
            courses.append(txtCourses[index].text!)
            
            guard !courses[index].isEmpty else {
                okAlert(title: "Warning!!", message: "None of the fields can be empty")
                return
            }
            
            let input = Int(courses[index])
            print("\(input)")
            if input! < 0 || input! > 100{
                okAlert(title: "Warning!!", message: "Marks can only be between 0 and 100")
                return
            }
            
        }
        
        
        for index in courses.indices{
            
            Student.students[curStudent!].semesters[curSem!].courses[index].marksObtained = Double(courses[index])!
        }
        
        let calculatedGPA = Student.students[curStudent!].semesters[curSem!].grades!
        labelResult.text =  String(format: "%.2f / 4" , calculatedGPA)
        if calculatedGPA > 2.8{
            let soundURL = Bundle.main.url(forResource: "Clapping", withExtension: "wav")
            audioPlayer = try! AVAudioPlayer(contentsOf: soundURL!)
            audioPlayer.play()
            
        }
        
        self.view.endEditing(true)
    }
    
    
    func okAlert(title: String, message: String){
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        
        alertController.addAction(okAction)
        self.present(alertController, animated: true, completion: nil)
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
