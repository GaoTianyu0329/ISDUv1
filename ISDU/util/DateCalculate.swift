//
//  DateCalculate.swift
//  iSDU
//
//  Created by 高天宇 on 2018/12/2.
//  Copyright © 2018 学生在线. All rights reserved.
//

import Foundation
class DateCalculate {
    static var nowMill = 0
    static func Cal(week:Int,day:Int) -> String {
        var date  = ""
        nowMill = EnvVariables.firstWeekTimeMillis
        nowMill += (week - 1) * 7 * 24 * 60 * 60 * 1000
        nowMill += (day - 1) * 24 * 60 * 60 * 1000
       
        return "a"
        
    }
    func getExpressionDate(timeMillis:Int) -> String {
        let date = Date(timeIntervalSince1970: TimeInterval(timeMillis))
        let formatter = DateFormatter()
        if Int(Date().timeIntervalSince1970) - timeMillis >= 28*60*60*1000 {
            formatter.dateFormat = "yyyy-MM-dd HH:mm"
        }else{
            formatter.dateFormat = "HH:mm"
        }
        
        return Int(Date().timeIntervalSince1970) - timeMillis < 60*1000 ? "刚刚" : Int(Date().timeIntervalSince1970) - timeMillis < 60*60*1000 ? "\((Int(Date().timeIntervalSince1970)-timeMillis)/60*1000)分钟前" : Int(Date().timeIntervalSince1970) - timeMillis < 24*60*1000 ? "\((Int(Date().timeIntervalSince1970)/60*60*1000)-timeMillis)小时前" : Int(Date().timeIntervalSince1970) - timeMillis < 28*60*60*1000 ? "昨天\(formatter.string(from: date))" : formatter.string(from: date)
    }
}
