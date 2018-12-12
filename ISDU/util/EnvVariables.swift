//
//  EnvVariables.swift
//  iSDU
//
//  Created by 高天宇 on 2018/12/2.
//  Copyright © 2018 学生在线. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON
class EnvVariables {
    static let DEFAULT_FIRST_WEEK_TIME_MILLIS = 1536508800000
    static var startWeek = 1
    static var endWeek = 20
    static var currentWeek = -1
    static var lessonDelay = false
    static var firstWeekTimeMillis = DEFAULT_FIRST_WEEK_TIME_MILLIS
    
    static func create() -> Void {
        Alamofire.request(ServerInfo.envVarUrl, method: .get, parameters: nil).responseJSON{
            response in
            switch response.result{
                
            case .success(_):
                let json = JSON(response.result.value ?? "")
                startWeek = json["start_week"].intValue
                endWeek = json["end_week"].intValue
                firstWeekTimeMillis = json["first_week_time_millis"].intValue
                currentWeek = calculateWeekIndex(timeMillis: Int(Date().timeIntervalSince1970))
                lessonDelay = json["lessonDelay"].intValue == 1
            case .failure(_):
                print("failed")
                startWeek = 1
                endWeek = 20
                firstWeekTimeMillis = DEFAULT_FIRST_WEEK_TIME_MILLIS
                lessonDelay = false
                
            }
        }
    }
    static func save() -> Void {
        let defaults = UserDefaults.standard
        if startWeek != 0 && endWeek != 0 && firstWeekTimeMillis != 0{
            defaults.set(startWeek, forKey: "start_week")
            defaults.set(endWeek, forKey: "end_week")
            defaults.set(firstWeekTimeMillis, forKey: "first_week_time_millis")
            defaults.set(lessonDelay, forKey: "lessonDelay")
        }else{
            defaults.set(1, forKey: "start_week")
            defaults.set(20, forKey: "end_week")
            defaults.set(DEFAULT_FIRST_WEEK_TIME_MILLIS, forKey: "first_week_time_millis")
            defaults.set(false, forKey: "lessonDelay")
        }
    }
    static func  calculateWeekIndex(timeMillis:Int) -> Int {
        var delta = (timeMillis - firstWeekTimeMillis) / 1000
        if delta < 0 {
            return 1
        }
        var daily = 24*60*60
        var days = Int(ceil(Double(delta)/Double(daily)))
        if  (days/7)+1 > endWeek {
            return endWeek
        }else if (days/7)+1 < startWeek {
            return startWeek
        }else {
            return (days/7)+1
        }
        
    }
    func getCurrentDay() -> Int{
        var calendar = Calendar.init(identifier: .gregorian)
        let timeZone = NSTimeZone.system
        calendar.timeZone = timeZone
        let calendarUnit = Calendar.Component.weekday
        return calendar.component(calendarUnit, from: Date())+1
        
        
        
    }
}
