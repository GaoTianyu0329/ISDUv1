//
//  ServerInfo.swift
//  iSDU
//
//  Created by 高天宇 on 2018/11/4.
//  Copyright © 2018 学生在线. All rights reserved.
//

import Foundation
class ServerInfo {
    static let ipAddr = "202.194.15.132"
    static let ipAddr133 = "202.194.15.131"
    static let port = 8384
    static let url = "http://" + ipAddr + ":\(port)/"
    static let envVarUrl = "http://" + ipAddr + ":8380/env_variables.html"
    static let avatarUrl = "http://" + ipAddr + ":8380/isdu/avatar"
    static let calanderUrl = "http://202.194.15.133:8380/isdu/term/xl-2018-2019-1.png"
    static let deleteComment = "http://" + ipAddr133 + ":8384/comment/delete"
    static let likePost = "http://" + ipAddr133 + ":8384/post/like/"
    static let collectPost = "http://" + ipAddr133 + ":8384/post/collect"
    static let urlUpdate = url + "/user/update"
    static let uploadPostUrl = "http://" + ipAddr133 + ":8384/post/upload"
    static let postCommentUrl = "http://" + ipAddr133 + ":8384/comment/add"
    static let deletePost = "http://" + ipAddr133 + ":8384/post/delete"
    static let getCollectList = "http://" + ipAddr133 + ":8384/user/getCollect"
    static func getComments() -> String {
        return "http://" + ipAddr133 + ":8384/comment/get"
    }
    static func getLikeNumber(postId:Int) -> String {
        return "http://" + ipAddr133 + ":8384/post/getLike?postId=\(postId)"
    }
    static func getIsLike(postId:Int,uid:String) -> String {
        return "http://" + ipAddr133 + ":8384/post/isLike?postId=\(postId)&userId=\(uid)"
    }
    static func getIsCollect(postId:Int,uid:String) -> String {
        return "http://" + ipAddr133 + ":8384/post/isCollect?postId=\(postId)&userId=\(uid)"
    }
    static func getUrlLogin(num:String,pwd:String) -> String {
        return url + "/user/signIn?j_username=" + num + "&j_password=" + pwd
    }
    static func searchUser(studentNumber:String) -> String {
        return url + "user/findBySN?studentNumber="+studentNumber
    }
    static func searchUserbyNickName(NickName:String) -> String {
        return url + "user/findByNN?nickname="+NickName
    }
    static func getUserInfo(id:String,key:String) -> String {
        return url + "/user/getInformation?id=\(id)&key=" + key
    }
    static func getNewsUrl(index:Int) -> String {
        var site:String
        switch (index) {
        case 0:
            site = "sduOnline"
        
        case 1:
            site = "underGraduate"
        case 2:
            site = "sduYouth"
        case 3:
            site = "sduView"
        default:
            site = "sduView"
        }
        return "https://sduonline.cn/isdu/news/api/index.php?site=" + site
        
    }
    static func getNewsUrl(index:Int,id:Int) -> String {
        var site:String
        switch (index) {
        case 0:
            site = "sduOnline"
            
        case 1:
            site = "underGraduate"
        case 2:
            site = "sduYouth"
        case 3:
            site = "sduView"
        default:
            site = "sduView"
        }
        return "https://sduonline.cn/isdu/news/api/index.php?site=" + site + "&content&id=\(id)"
    }
    static func getGradeUrl(id:String) -> String {
        return url+"/academic/curTerm?id="+id
    }

    static func getPastGradeUrl(id:String,term:String) -> String {
        return url + "/academic/termScore?id=" + id + "&termId=" + term
    }
    static func getExamUrl(id:Int) -> String {
        return url + "/academic/table?id=\(id)"
    }
    static func getScheduleUrl(id:Int) -> String {
        return url + "/academic/table?id=\(id)"
    }
    static func getSchoolBusUrl(from:String,to:String,isWeekend:Int) -> String {
        return "https://sduonline.cn/isdu/schoolbus/api/?start=" + from + "&end=" + to + "&isWeekend=\(isWeekend)"
    }
    static func getStudyRooms(campus:String) -> String {
        return "http://sduonline.cn/isdu/studyroom/api/?campus=" + campus
    }
    static func getStudyRooms(campus:String,building:String,date:String) -> String {
        return "http://sduonline.cn/isdu/studyroom/api/?campus=" + campus
    }
   
    static func getPostList(uid:Int,startId:Int) -> String {
        return "http://" + ipAddr133 + ":8384/post/getPostList10?startId=\(startId)&userId=\(uid)"
    }
    static func getPost(id:Int) -> String {
        return "http://" + ipAddr133 + ":8384/post/detail?id=\(id)"
    }
    static func getLibrarySearUrl(loc:String) -> String {
        return "https://sduonline.cn/isdu/library/api/?room=" + loc
    }
    static func getLibraryInfoUrl(id:String) -> String {
        return url + "library/info?id=" + id
    }
    static func getBindUrl(uid:String,cardNumber:String,pwd:String) -> String {
        return url + "library/bind?id=" + uid + "&cardNumber=" + cardNumber + "&password=" + pwd
    }
    static func getBookListUrl(uid:String) -> String {
        return url + "library/borrowed?id=" + uid
    }
    static func searchBookUrl(bookName:String) -> String {
        return url + "library/search?name=" + bookName
    }
    static func renewBookUrl(uid:Int) -> String {
        return url + "library/renew?id=\(uid)"
    }
    static func renewOneBookUrl(uid:Int,bookId:String,checkCode:String) -> String {
        return url + "library/renewOne?id=\(uid)&bookId=" + bookId + "&verifyId=" + checkCode
    }
    static func getLikeMe(uid:String) -> String {
        return "http://202.194.15.133:8384/user/getLikeMe?userId=" + uid
    }
    static func getMyLike(uid:String) -> String {
        return "http://202.194.15.133:8384/user/getLike?userId=" + uid
    }
    static func userLike(userId:String,beLikeUserId:String) -> String {
        return "http://202.194.15.133:8384/user/like?userId=" + userId + "&beLikeUserId=" + beLikeUserId
    }
    static func queryPost(key:String) -> String {
        return "http://" + ipAddr133 + ":8384/post/query?key=" + key
    }
    static func getHotPostList(value:Double) -> String {
        return "http://" + ipAddr133 + ":8384/post/getHotTen?startValue=\(value)"
    }
    static func getSchoolAboutList(id:Int) -> String {
        return "http://" + ipAddr133 + ":8384/post/getSchoolAboutTen?startId=\(id)"
    }
    static func getNotice(uid:String) -> String {
        return "http://" + ipAddr133 + ":8384/notice/getNotice?userId=" + uid
    }
    static func getMyComment10(uid:String,startId:String) -> String {
        return "http://" + ipAddr133 + ":8384/user/getComment10?userId=" + uid + "&startId=" + startId
    }
    static func getRecommend10(startValue:Int) -> String {
        return "http://" + ipAddr133 + ":8384/post/getSyncPostTen?startId=\(startValue)"
    }
    static func getFeedbackUrl() -> String {
        return "http://" + ipAddr133 + ":8384/addFeedBack"
    }
    static func getLikePost(uid:String,startId:Int) -> String {
        return "http://" + ipAddr133 + ":8384//post/getLikePostTen?userId=" + uid + "&startId=\(startId)"
    }
    static func getPostIntroduction(postId:Int) -> String {
        return "http://" + ipAddr133 + ":8384/post/getPostIntroduction?postId=\(postId)"
    }
    static func getUserVerification(uid:String) -> String {
        return url + "user/verification?id=" + uid
    }
    static func getSyncPostTen(startId:Int) -> String {
        return "http://" + ipAddr133 + ":8384/post/getSyncPostTen?startId=\(startId)"
    }
    static func getTagedPostTen(startId: Int) -> String {
        return "http://" + ipAddr133 + ":8384/post/getTagedPost?startId=\(startId)"
    }
    static func setPostTag (postId: Int,tag:String,userId:String) -> String {
        return "http://" + ipAddr133 + ":8384/post/setTag?postId=\(postId)%tag=\(tag)%userId=\(userId)"
    }
}
