//
//  History.swift
//  iSDU
//
//  Created by 高天宇 on 2018/10/17.
//  Copyright © 2018 学生在线. All rights reserved.
//

import UIKit

class History: NSObject {
    private var title:String
    private var subject:String
    private var time:Int
    private var url:String
    init(title:String,subject:String,time:Int,url:String) {
        self.title = title
        self.subject = subject
        self.time = time
        self.url = url
    }
    func getTitle() -> String {
        return title
        
    }
    func setTitle(title:String) -> Void {
        self.title = title
    }
    func getSubject() -> String {
        return subject
        
    }
    func setSubject(subject:String) -> Void {
        self.subject = subject
    }
    func getTime() -> Int {
        return time
        
    }
    func setTime(time:Int) -> Void {
        self.time = time
    }
    func getUrl() -> String {
        return url
        
    }
    func setUrl(url:String) -> Void {
        self.url = url
    }
    
}
