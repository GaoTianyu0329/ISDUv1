//
//  Bus.swift
//  iSDU
//
//  Created by 高天宇 on 2018/10/12.
//  Copyright © 2018 学生在线. All rights reserved.
//

import UIKit

public class Bus: NSObject {
    private var busTime,busFrom,busTo,busPass:String?
    public override init() {
        
    }
    func setBusTime(busTime:String) -> Void {
        self.busTime = busTime
    }
    func setBusFrom(busFrom:String) -> Void {
        self.busFrom = busFrom
    }
    func setBusTo(busTo:String) -> Void {
        self.busTo = busTo
    }
    func setBusPass(busPass:String) -> Void {
        self.busPass = busPass
    }
    func getBusFrom() -> String? {
        return busFrom
    }
    func getBusPass() -> String? {
        return busPass
    }
    func getBusTime() -> String? {
        return busTime
    }
    func getBusTo() -> String? {
        return busTo
    }
    

}
