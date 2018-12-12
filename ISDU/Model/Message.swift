//
//  Message.swift
//  iSDU
//
//  Created by 高天宇 on 2018/10/17.
//  Copyright © 2018 学生在线. All rights reserved.
//

import UIKit

public class Message: NSObject,OnMessageListener {
    public func onMessage() {
        
    }
    
    var type = ""
    var senderId = ""
    var senderNickname = ""
    var senderAvatar = ""
    var time = ""
    var content = ""
    var postId = 0
    var isread = false
    static var listeners = Array<OnMessageListener>()
    static var msgList = Array<Message>()
    static func addOnMessageListener(listener:OnMessageListener) -> Void {
        Message.listeners.append(listener)
    }
    static func newMsg(msgList:Array<Message>) -> Void {
        if Message.msgList == nil || Message.msgList.count == 0{
            for msg in msgList{
                if Message.msgList.contains(msg){
                    let n = Message.msgList.firstIndex(of: msg)!
                    Message.msgList.remove(at: n)
                }
            }
        }
        
    }
    static func getUnreadCount() -> Int{
        var count:Int = 0
        if msgList == nil || msgList.count == 0{
            
        }
        for msg in msgList {
            if !msg.isread{
                count = count+1
            }
        }
        return count
        
    }
    
}
public protocol OnMessageListener {
    func onMessage()
    
}
