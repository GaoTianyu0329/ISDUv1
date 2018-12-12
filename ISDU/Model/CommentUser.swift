//
//  CommentUser.swift
//  iSDU
//
//  Created by 高天宇 on 2018/10/13.
//  Copyright © 2018 学生在线. All rights reserved.
//

import UIKit

class CommentUser: NSObject {
    private var userId:Int?
    private var nickName:String?
    private var avatar:String?
    override init() {
        
    }
    init(userId:Int?,nickName:String?,avatar:String?) {
        self.userId = userId
        self.nickName = nickName
        self.avatar = avatar
    }
    func getUserId() -> Int? {
        return userId
    }
    func setUserId(userId:Int?) -> Void {
        self.userId = userId
    }
    func getNickName() -> String? {
        return nickName
    }
    func setNickName(nickName:String?) -> Void {
        self.nickName = nickName
    }
    func getAvatar() -> String? {
        return avatar
    }
    func serAvatar(avatar:String?) -> Void {
        self.avatar = avatar
    }
    
    
}
