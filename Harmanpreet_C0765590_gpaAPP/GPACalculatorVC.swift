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
    @IBOutlet weak var labelResult: UILabel!
    
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
            let hour = String(value.text![value.text!.index(before: value.text!.endIndex)])
            
            hours.append(Int(hour) ?? 0)
        }
        
        var grades = [Double]()
        for index in courses.indices{
            let c = Double(courses[index]) ?? 0.0
            grades.append( getGradePoints(course: c))
        }
        
       
        labelResult.text =  String(format: "%.1f / 4" , (calculateGPA(hours: hours, grades: grades)))
        
    }
    
    func getGradePoints(course: Double) -> Double{
        
        switch course {
            case 94...100:
                return 4.0
            case 87...93:
                return 3.7
            case 80...86:
                return 3.5
            case 77...79:
                return 3.2
            case 73...76:
                return 3.0
            case 70...72:
                return 2.7
            case 67...69:
                return 2.3
            case 63...66:
                return 2.0
            case 60...62:
                return 1.7
            case 50...59:
                return 1.0
            default:
                return 0.0
        }
    }
    
    func calculateGPA(hours: [Int], grades: [Double]) -> Double{
        
        var totalHours = 0
        var GPA = 0.0
        
        for hour in hours{
            for grade in grades{
                GPA += (Double(hour) ?? 0.0) * grade
                totalHours += hour
            }
        }
        
        return GPA / Double(totalHours)
        
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
