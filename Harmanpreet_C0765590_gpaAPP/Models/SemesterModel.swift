//
//  SemesterModel.swift
//  Harmanpreet_C0765590_gpaAPP
//
//  Created by Harmanpreet Kaur on 2019-11-15.
//  Copyright © 2019 Harmanpreet Kaur. All rights reserved.
//

import Foundation

struct Semester{
    var semesterName: String
    var courses: [Course]
            
            
            
            
//            switch semesterName {
//            case "Semester 1":
//                print("------inside semester--------")
//                courses = [Course(courseName: "MADT 3004", marksObtained: 0.0),
//                Course(courseName: "MADT 2303", marksObtained: 0.0),
//                Course(courseName: "MADT 3463", marksObtained: 0.0),
//                Course(courseName: "MADT 3115", marksObtained: 0.0),
//                Course(courseName: "MADT 3125", marksObtained: 0.0)]
//
//            case "Semester 2":
//                courses = [Course(courseName: "MADT 3001", marksObtained: 0.0),
//                Course(courseName: "MADT 2234", marksObtained: 0.0),
//                Course(courseName: "MADT 2115", marksObtained: 0.0),
//                Course(courseName: "MADT 3632", marksObtained: 0.0),
//                Course(courseName: "MADT 4115", marksObtained: 0.0)]
//
//            case "Semester 3":
//                courses = [Course(courseName: "MADT 2003", marksObtained: 0.0),
//                Course(courseName: "MADT 2016", marksObtained: 0.0),
//                Course(courseName: "MADT 3006", marksObtained: 0.0),
//                Course(courseName: "MADT 3215", marksObtained: 0.0),
//                Course(courseName: "MADT 3022", marksObtained: 0.0)]
//
//            default:
//                courses = []
//            }
//        }
    
    
//    var courses: [Course]{
//
//        get{
//
//            var c = [Course]()
//            switch semesterName {
//
//            case "Semester 1":
//                print("------inside semester--------")
//                c = [Course(courseName: "MADT 3004", marksObtained: 0.0),
//                Course(courseName: "MADT 2303", marksObtained: 0.0),
//                Course(courseName: "MADT 3463", marksObtained: 0.0),
//                Course(courseName: "MADT 3115", marksObtained: 0.0),
//                Course(courseName: "MADT 3125", marksObtained: 0.0)]
//
//            case "Semester 2":
//                c = [Course(courseName: "MADT 3001", marksObtained: 0.0),
//                Course(courseName: "MADT 2234", marksObtained: 0.0),
//                Course(courseName: "MADT 2115", marksObtained: 0.0),
//                Course(courseName: "MADT 3632", marksObtained: 0.0),
//                Course(courseName: "MADT 4115", marksObtained: 0.0)]
                
//            case "Semester 3":
//                c = [Course(courseName: "MADT 2003", marksObtained: 0.0),
//                Course(courseName: "MADT 2016", marksObtained: 0.0),
//                Course(courseName: "MADT 3006", marksObtained: 0.0),
//                Course(courseName: "MADT 3215", marksObtained: 0.0),
//                Course(courseName: "MADT 3022", marksObtained: 0.0)]
//
//            default:
//                c = []
//            }
//            return c
//        }
//
//        set{
//
//        }
//
//    }
    
    var grades: Double?{
        get{
            var totalHour = 0
            var grades = 0.0
            
            for course in courses{
                
                guard course.marksObtained != nil else {
                    return nil
                }
                
                let hour = String(course.courseName[course.courseName.index(before: course.courseName.endIndex)])
                totalHour += Int(hour)!
                print("hour...\(hour)")
                
                let marks = getGradePoints(course: course.marksObtained!)
                print("marks...\(marks)")
                grades += (marks * Double(hour)!)
                
            }
            print("totalHours....\(totalHour)......grades....\(grades)")
            return (grades / Double(totalHour))
        }
    }
    
//    init(sem: String){
//        semesterName = sem
//    }
    
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
    
//    init(sem: String, courses: [Course]) {
//        semesterName = sem
//        self.courses = courses
//    }
}
