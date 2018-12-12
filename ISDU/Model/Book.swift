//
//  Book.swift
//  iSDU
//
//  Created by 高天宇 on 2018/10/11.
//  Copyright © 2018 学生在线. All rights reserved.
//

import UIKit

class Book: NSObject {
    private var bookName:String = ""//书名
    private var idNumber:String = ""//索书号
    private var bookPlace:String = ""//借阅地点
    private var borrowDate:String = ""//借阅日期
    private var backDate:String = ""//应还日期
    private var remainDays:Int = 0//剩余天数
    private var borrowTimes:Int = 0//续借次数
    private var author:String = ""//作者
    private var press:String = ""//出版社
    private var all:Int = 0//总量
    private var canBor:Int = 0//可借数
    private var borPlace:Array<String>?
    private var id:String = ""//图书条码号
    private var checkCode:String = ""//续借验证码
    func setBookName(bookName:String) -> Void {
        self.bookName = bookName
    }
    func serIdNumber(idNumber:String) -> Void {
        self.idNumber = idNumber
    }
    func setBackDate(backDate:String) -> Void {
        self.backDate = backDate
    }
    func setBookPlace(bookPlace:String) -> Void {
        self.bookPlace = bookPlace
    }
    func setBorrowDate(borrowDate:String) -> Void {
        self.borrowDate = borrowDate
    }
    func setRemainDays(remainDays:Int) -> Void {
            self.remainDays = remainDays
    }
    func getBookName() -> String {
        return bookName
    }
    func getBookPalce() -> String {
        return bookPlace
    }
    func getIdNumber() -> String {
        return idNumber
    }
    func getBorrowTimes() -> Int {
        return borrowTimes
    }
    func getRemainDays() -> Int {
        return remainDays
    }
    func getBorrowDate() -> String {
        return borrowDate
    }
    func getBackDate() -> String {
        return backDate
    }
    func getAuthor() -> String {
        return author
    }
    func setAuthor(author:String) -> Void {
        self.author = author
    }
    func getPress() -> String {
        return press
    }
    func setPress(press:String) -> Void {
        self.press = press
    }
    func getAll() -> Int {
        return all
    }
    func setAll(all:Int) -> Void {
        self.all = all
    }
    func getCanBor() -> Int {
        return canBor
    }
    func setCanBor(canBor:Int) -> Void {
        self.canBor = canBor
    }
    func getBorPlace() -> String {
        var r = ""
        for str in borPlace!{
            r += str+"\n"
        }
        return r
    }
    func setBorPlace(borPlace:Array<String>) -> Void {
        self.borPlace = borPlace
    }
    func setId(id:String) -> Void {
        self.id = id
    }
    func getId() -> String {
        return id
    }
    func getCheckCode() -> String {
        return checkCode
    }
    func setCheckCode(checkCode:String) -> Void {
        self.checkCode = checkCode
    }
    
    
    
    
    
}
