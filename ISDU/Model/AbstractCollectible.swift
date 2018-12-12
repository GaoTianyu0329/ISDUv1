//
//  AbstractCollectible.swift
//  iSDU
//
//  Created by 高天宇 on 2018/10/11.
//  Copyright © 2018 学生在线. All rights reserved.
//

import UIKit

public class AbstractCollectible: NSObject,Collectible {
    func onScan() {
        
    }
    
    public static let TYPE_POST = 0
    public static let TYPE_NEWS = 1
    var mTitle:String = ""
    var mContent:String = ""
    var mTime:Int = 0
    var mUserId:String = ""
    public func getType() -> Int{
        return 0;
    }
    public func onCollect() -> Void{
    }
    public func getmTitle() -> String{
        return mTitle;
    }
    func setmTitle(mTitle:String) -> Void {
        self.mTitle = mTitle
    }
    func getmContent() -> String {
        return mContent
    }
    func setmContent(mContent:String) -> Void {
        self.mContent = mContent
    }
    func getmTime() -> Int {
        return mTime
    }
    func setmTime(mTime:Int) -> Void {
        self.mTime = mTime
    }
    
    
    
}
protocol Collectible {
    func onCollect() -> Void
    
    func onScan() -> Void
    
}
