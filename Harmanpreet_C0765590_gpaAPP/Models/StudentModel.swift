//
//  StudentModel.swift
//  Harmanpreet_C0765590_gpaAPP
//
//  Created by Harmanpreet Kaur on 2019-11-13.
//  Copyright © 2019 Harmanpreet Kaur. All rights reserved.
//

import Foundation

struct Student{
    var firstName: String
    var lastName: String
    var id: String
    
//    var grades = [String: Double]()
//    var CGPA: Double?
    
    var semesters: [Semester]
    
    var cgpa: Double?{
        get{
            var gpa = 0.0

            for grades in semesters{
                guard grades.grades != nil else {
                    return nil
                }
                gpa += grades.grades!
            }

            print("semester count......\(semesters.count)")
            return (gpa / Double(semesters.count))
        }
    }
    
   
    static var students = [Student]()

    
    
}
