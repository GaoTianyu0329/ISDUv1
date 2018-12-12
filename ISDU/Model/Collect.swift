//
//  Collect.swift
//  iSDU
//
//  Created by 高天宇 on 2018/10/12.
//  Copyright © 2018 学生在线. All rights reserved.
//

import UIKit

public class Collect: NSObject {
    let TYPE_POST = 0
    let TYPE_NEWS = 1
    private var collectTitle:String?
    private var collectContent:String?
    private var collectUrl:String?
    private var collectType:Int?
    private var collectTime:Int?
    private var id:Int?
    private var uid:Int?
    func getCollectTitle() -> String? {
        return collectTitle
    }
    func getCollectContent() -> String? {
        return collectContent
    }
    func getCollectUrl() -> String? {
        return collectUrl
    }
    func getCollectType() -> Int? {
        return collectType
    }
    func getCollectTime() -> Int? {
        return collectTime
    }
    func getUid() -> Int? {
        return uid
    }
    func getId() -> Int? {
        return id
    }
    func setCollectTitle(collectTitle:String?) -> Void {
        self.collectTitle = collectTitle
    }
    func setCollectContent(collectContent:String?) -> Void {
        self.collectContent = collectContent
    }
    func setCollectUrl(collectUrl:String?) -> Void {
        self.collectUrl = collectUrl
    }
    func setCollectType(collectType:Int?) -> Void {
        self.collectType = collectType
    }
    func setCollectTime(collectTime:Int?) -> Void {
        self.collectTime = collectTime
    }
    func setUid(uid:Int?) -> Void {
        self.uid = uid
    }
    func setid(id:Int?) -> Void {
        self.id = id
    }
    
    
    
    
    

}
