//
//  TableVC1TableViewController.swift
//  iSDU
//
//  Created by 学生在线 on 2018/7/20.
//  Copyright © 2018年 学生在线. All rights reserved.
//

import UIKit
import ESPullToRefresh
import Alamofire
import SwiftyJSON
class TableVC1: UITableViewController,UISearchControllerDelegate,UISearchResultsUpdating {
    private var dataList:Array<Post> = Array<Post>()
    private var lastValue = 0;
    private var needOffset = false
    var loadComplete = false
    
    func updateSearchResults(for searchController: UISearchController) {
    }
    var index = -1
    var searchController = UISearchController()
    var url = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        tableView.tableHeaderView = searchController.searchBar
        searchController.delegate = self
        loadData()
        self.tableView.es.addPullToRefresh {
            [unowned self] in
            /// 在这里做刷新相关事件
            self.lastValue = 0
            self.dataList.removeAll()
            self.needOffset = false
            self.loadComplete = false
            self.loadData()
            /// 如果你的刷新事件成功，设置completion自动重置footer的状态
            //self.tableView.es.stopPullToRefresh(ignoreDate: true)
            /// 设置ignoreFooter来处理不需要显示footer的情况
           // self.tableView.es.stopPullToRefresh(ignoreDate: true, ignoreFooter: false)
        }
        self.tableView.es.addInfiniteScrolling {
            [unowned self] in
            /// 在这里做加载更多相关事件
            self.needOffset = true
            self.loadComplete = false
            self.loadData()
            /// 如果你的加载更多事件成功，调用es_stopLoadingMore()重置footer状态
            //self.tableView.es.stopLoadingMore()
            /// 通过es_noticeNoMoreData()设置footer暂无数据状态
            //self.tableView.es.noticeNoMoreData()
        }
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    func loadData() -> Void {
        if loadComplete {
            return
        }
        switch index {
        case 0:
            url = ServerInfo.getSyncPostTen(startId: lastValue)
        case 1:
            url = ServerInfo.getRecommend10(startValue: lastValue)
        case 2:
            url = ServerInfo.getTagedPostTen(startId: lastValue)
            
        default:
            url = ""
        }
        Alamofire.request(url, method: .get, parameters: nil).responseJSON{
            response in
            switch response.result{
                
            case .success(_):
                let json = JSON(response.result.value ?? "")
                var jsonArray = JSON(parseJSON: json["obj"].stringValue).arrayValue
                print(json)
                for i in 0..<jsonArray.count{
                    print(i)
                    let post = Post()
                    let jsonObj = jsonArray[i]
                    print(jsonObj)
                    post.mUserId = jsonObj["uid"].stringValue
                    post.commentsNumbers = jsonObj["commentNumber"].intValue
                    post.postId = jsonObj["id"].intValue
                    post.mTime = jsonObj["time"].intValue
                    post.mTitle = jsonObj["title"].stringValue
                    post.likeNumber = jsonObj["likeNumber"].intValue
                    post.mContent = jsonObj["info"].stringValue
                    post.value = jsonObj["value"].doubleValue
                    if jsonObj["tag"].exists(){
                        post.tag = jsonObj["tag"].stringValue
                    }else{
                        post.tag = ""
                    }
                    if !self.dataList.contains(post){
                        self.dataList.append(post)
                    }
                    self.lastValue = post.postId
                }
               
                self.tableView.es.stopPullToRefresh(ignoreDate: true)
                self.tableView.reloadData()
                
            case .failure(_):
                print("failed")
                self.tableView.es.noticeNoMoreData()
            }
            self.loadComplete = true
        }
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return dataList.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "postcell", for: indexPath) as! PostTableViewCell
        let post = dataList[indexPath.row]
        cell.titleView.text = post.mTitle
        cell.commentNUmber.text = String(post.commentsNumbers)
        cell.content.text = post.mContent
        cell.likeNumber.text = String(post.likeNumber)
        cell.releaseTime.text = DateCalculate().getExpressionDate(timeMillis: post.mTime)
        if post.tag == ""{
//            cell.flag_Label.isHidden = true
            cell.flag_Label.paddingLeft = 0
            cell.flag_Label.paddingRight = 0
            cell.flag_Label.paddingTop = 0
            cell.flag_Label.paddingBottom = 0
        }else{
            cell.flag_Label.text = post.tag
        }
       
        
      
        return cell
        
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
