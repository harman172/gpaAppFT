//
//  GPACalculatorVC.swift
//  Harmanpreet_C0765590_gpaAPP
//
//  Created by Harmanpreet Kaur on 2019-11-14.
//  Copyright © 2019 Harmanpreet Kaur. All rights reserved.
//

import UIKit

class GPACalculatorVC: UIViewController {

    @IBOutlet var txtCourses: [UITextField]!
    @IBOutlet var courseNames: [UILabel]!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
    }
    
    
    @IBAction func btnCalculate(_ sender: UIButton) {
        
        var courses = [String]()
        
        for index in txtCourses.indices{
            courses.append(txtCourses[index].text!)
            
            guard !courses[index].isEmpty else {
                okAlert(title: "Warning!!", message: "None of the fields can be empty")
                return
            }
        }
        
        var hours = [Int]()
        for value in courseNames{
            let hour = value.text![value.text!.endIndex]
            print(hour)
//            hours.append()
        }
        
        var grades = [Double]()
        
        for index in courses.indices{
            let c = Double(courses[index]) ?? 0.0
            grades.append( getGradePoints(course: c))
        }
        
        
    }
    
    func getGradePoints(course: Double) -> Double{
        var gradePoint = 0.0
        
        switch course {
            case 94...100:
                gradePoint = 4.0
                break
            case 87...93:
                gradePoint = 3.7
                break
            case 80...86:
                gradePoint = 3.5
                break
            case 77...79:
                gradePoint = 3.2
                break
            case 73...76:
                gradePoint = 3.0
                break
            case 70...72:
                gradePoint = 2.7
                break
            case 67...69:
                gradePoint = 2.3
                break
            case 63...66:
                gradePoint = 2.0
                break
            case 60...62:
                gradePoint = 1.7
                break
            case 50...59:
                gradePoint = 1.0
                break
            default:
                gradePoint = 0.0
        }
        
        return gradePoint
    }
    
    func okAlert(title: String, message: String){
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        okAction.setValue(UIColor.brown, forKey: "titleTextColor")
        
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
