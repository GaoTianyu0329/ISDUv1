//
//  NewsViewController.swift
//  iSDU
//
//  Created by 高天宇 on 2018/11/5.
//  Copyright © 2018 学生在线. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
class NewsViewController: UIViewController {
    var news:News?
    var buttons = Array<UIButton>()
    
    @IBOutlet weak var newsTitle: UILabel!
    @IBOutlet weak var sectionAndDate: UILabel!
    @IBOutlet weak var newsContent: UILabel!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var extraLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if (news != nil) {
            Alamofire.request(news!.url , method: .get).response{
                response in
                
                let json = JSON(response.data)
                print(json)
                self.news?.section = json["site"].stringValue
                self.news?.mTitle = json["title"].stringValue
                self.news?.date = json["date"].stringValue
                self.news?.newsContent = json["content"].stringValue
                self.news?.originUrl = json["url"].stringValue
                self.newsTitle.text = self.news?.mTitle
                self.sectionAndDate.text = self.news!.section + "·" + self.news!.date
                self.newsContent.text = self.news?.newsContent
                self.newsTitle.sizeToFit()
                self.newsContent.sizeToFit()
                self.sectionAndDate.sizeToFit()
                if json["attachment"] != nil{
                    var names = Array<String>()
                    var urls = Array<String>()
                    for jsonobj in json["attachment"]{
                        names.append(jsonobj.1["title"].stringValue)
                        urls.append(jsonobj.1["url"].stringValue)
                    }
                    self.news?.extras = names
                    self.news?.extraUrl = urls
                    
                    
//                    self.extraLabel.text = "附件：（点击可下载文件）"
//                    var height = self.scrollView.frame.maxY
//                    for extra in self.news!.extras!{
//                        var button = UIButton()
//
//                        button.setTitle(extra, for: UIControlState.normal)
//                        button.setTitleColor(UIColor.black, for: UIControlState.normal)
//                        button.translatesAutoresizingMaskIntoConstraints = false
//                        self.scrollView.addSubview(button)
//
//
//
//
//                    }
                    
                    
                }
                
              
                
            }
        }
        
        
        
        

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
