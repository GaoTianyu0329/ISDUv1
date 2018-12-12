//
//  Grade.swift
//  iSDU
//
//  Created by 高天宇 on 2018/10/17.
//  Copyright © 2018 学生在线. All rights reserved.
//

import UIKit
import SwiftyJSON
class Grade: NSObject {
    /*
     kcm课程名称
     pscj平时成绩
     qmcj期末成绩
     cj成绩
     jd绩点
     zgf最高分
     zdf最低分
     pm排名
     zrs总人数
     dd等第
     xf学分
     */
    var jd = 0.0,xf = 0.0
    var pm = 0,zrs = 0,kxh:Int = 0
    var dd = "",kcm = "",cj = "",zgf = "",zdf = "",pscj = "",qmcj = ""
    public static var zjd = 0.0,zxf = 0.0,zfz = 0.0
    public static var z_jd = [Double](repeating: 0.0, count: 10)
    public static var z_xf = [Double](repeating: 0.0, count: 10)
    public static var z_fz = [Double](repeating: 0.0, count: 10)
    override init() {
        
    }
//    func setPscj(pscj:String) -> Void {
//        self.pscj = pscj
//    }
//    func setKxh(kxh:Int) -> Void {
//        self.kxh = kxh
//    }
//    func setQmcj(qmcj:String) -> Void {
//        self.qmcj = qmcj
//    }
//    func setCj(cj:String) -> Void {
//        self.cj = cj
//    }
//    func setJd(jd:Double) -> Void {
//        self.jd = jd
//    }
//    func setZgf(zgf:String) -> Void {
//        self.zgf = zgf
//    }
//    func setZdf(zdf:String) -> Void {
//        self.zdf = zdf
//    }
//    func setPm(pm:Int) -> Void {
//        self.pm = pm
//    }
//    func setZrs(zrs:Int) -> Void {
//        self.zrs = zrs
//    }
//    func setDd(dd:String) -> Void {
//        self.dd = dd
//    }
//    func setKcm(kcm:String) -> Void {
//        self.kcm = kcm
//    }
//    func getXf() -> Double {
//        return xf
//    }
//    func getPscj() -> String {
//        return pscj
//    }
//    func getQmcj() -> String {
//        return qmcj
//    }
//    func getCj() -> String {
//        return cj
//    }
//    func getJd() -> Double {
//        return jd
//    }
//    func getZdf() -> String {
//        return zdf
//    }
//    func getZgf() -> String {
//        return zgf
//    }
//    func getPm() -> Int {
//        return pm
//    }
//    func getZrs() -> Int {
//        return zrs
//    }
//    func getDd() -> String {
//        return dd
//    }
//    func getKxh() -> Int {
//        return kxh
//    }
//    func getKcm() -> String {
//        return kcm
//    }
    static func judgeEva(json:String) -> Bool {
        do{
            let jsonObject = try JSON(json)
            if !jsonObject["status"].exists() {
                if jsonObject["status"] == "failed"{
                    return false
                }else{
                    return true
                }
            }else{
                return false
            }
            
        }catch{
            print("Grade.swift func judgeEva")
        }
        return false
    }
    static func loadFromString(json:String) -> Array<Grade>{
        var list = Array<Grade>()
        var grade:Grade
        do {
            var jsonObject = try JSON(json)
            zfz = 0
            zxf = 0
            zjd = 0
            if jsonObject["obj"].arrayValue != nil && jsonObject["obj"].arrayValue.count > 0{
                let jsonArray = jsonObject["obj"].arrayValue
                for jsonobj in jsonArray{
                    grade = Grade()
//                    var obj = jsonobj
                    grade.kcm = jsonobj["kcm"].stringValue
                    grade.cj = jsonobj["cj"].stringValue
                    if grade.cj.first == "-"{
                        grade.cj = String(grade.cj.dropFirst(1))
                    }
                    grade.zgf = jsonobj["zgf"].stringValue
                    grade.jd = jsonobj["jd"].doubleValue
                    grade.dd = jsonobj["dd"].stringValue
                    grade.zdf = jsonobj["zdf"].stringValue
                    grade.pm = jsonobj["pm"].intValue
                    grade.zrs = jsonobj["zrs"].intValue
                    grade.xf = jsonobj["xf"].doubleValue
                    grade.pscj = !jsonobj["psjc"].exists() ? jsonobj["psjc"].stringValue : ""
                    grade.qmcj = !jsonobj["qmcj"].exists() ? jsonobj["qmcj"].stringValue : ""
                    grade.kxh = jsonobj["kxh"].intValue
                    if grade.kxh < 600{
                        zfz += grade.xf * grade.jd
                        zxf += grade.xf
                    }
                    zjd = zfz/zxf
                    list.append(grade)
                    
                }
            }
        } catch let error as NSError {
            print("Grade  loadFromString")
            print("Error:\(error.domain)")
        }
//
        return list
    }
    static func pastGradeLoadFromString(json:String,term:Int) -> Array<Grade>{
        var list = Array<Grade>()
        var grade:Grade
        do {
            var jsonObject = try JSON(json)
            z_fz[term] = 0
            z_xf[term] = 0
            z_jd[term] = 0
            if jsonObject["obj"].arrayValue != nil && jsonObject["obj"].arrayValue.count > 0 {
                let jsonArray = jsonObject["obj"].arrayValue
                for jsonobj in jsonArray{
                    grade = Grade()
//                    var obj = jsonobj
                    grade.kcm = jsonobj["kcm"].stringValue
                    grade.cj = jsonobj["kscj"].stringValue
                    if grade.cj.first == "-"{
                        grade.cj = String(grade.cj.dropFirst(1))
                    }
                    grade.zgf = ""//jsonobj["zgf"].stringValue
                    grade.jd = jsonobj["wfzjd"].doubleValue
                    grade.dd = jsonobj["wfzdd"].stringValue
                    grade.zdf = ""//jsonobj["zdf"].stringValue
                    grade.pm = 0//jsonobj["pm"].intValue
                    grade.zrs = 0//jsonobj["zrs"].intValue
                    grade.xf = jsonobj["xf"].doubleValue
                    grade.pscj = !jsonobj["pscj"].exists() ? jsonobj["pscj"].stringValue : ""
                    grade.qmcj = !jsonobj["qmcj"].exists() ? jsonobj["qmcj"].stringValue : ""
                    grade.kxh = jsonobj["kxh"].intValue
                    if grade.kxh < 600{
                        z_fz[term] += grade.xf * grade.jd
                        z_xf[term] += grade.xf
                    }
                    z_jd[term] = z_xf[term] == 0 ? 0 : z_fz[term]/z_xf[term]
                    list.append(grade)
                    
                }
                
                
            }
        } catch let error as NSError {
            print("Error:\(error.domain)")
        }
        return list
        
        
    }
    
    
}
