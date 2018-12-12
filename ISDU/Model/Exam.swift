//
//  Exam.swift
//  iSDU
//
//  Created by 高天宇 on 2018/10/13.
//  Copyright © 2018 学生在线. All rights reserved.
//


import UIKit

class Exam: NSObject {
    private var date:String?
    private var time:String?
    private var location:String?
    private var gradeRate:String?
    private var type:String?
    private var name:String?
    init(date:String?,time:String?,location:String?,gradeRate:String?,type:String?,name:String?) {
        self.date = date
        self.time = time
        self.location = location
        self.gradeRate = gradeRate
        self.type = type
        self.name = name
    }
    func getDate() -> String? {
        return date
    }
    func setDate(date:String) -> Void {
        self.date = date
    }
    func getTime() -> String? {
        return time
    }
    func setTime(time:String) -> Void {
        self.time = time
    }
    func getLocation() -> String? {
        return location
    }
    func setLocation(location:String) -> Void {
        self.location = location
    }
    func getGraderate() -> String? {
        return gradeRate
    }
    func setGraderate(gradeRate:String) -> Void {
        self.gradeRate = gradeRate
    }
    func getType() -> String? {
        return type
    }
    func setType(type:String) -> Void {
        self.type = type
    }
    func getName() -> String? {
        return name
    }
    func setName(name:String) -> Void {
        self.name = name
    }
//    func toSchedule() -> Schedule {
//        var schedule = Schedule()
//        return schedule
//    }
    func getWeek() -> Int {
        return 0
    }
    func getDay() -> Int {
        return 0
    }
    
}
