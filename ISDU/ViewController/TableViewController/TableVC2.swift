//
//  TableVC2_1.swift
//  iSDU
//
//  Created by 学生在线 on 2018/7/20.
//  Copyright © 2018年 学生在线. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
class TableVC2: UITableViewController,UISearchResultsUpdating,UISearchBarDelegate{
    func updateSearchResults(for searchController: UISearchController) {
        
    }
    
    var index = 0
    var searchController:UISearchController!
    
    var newsList:[News] = Array()
    override func viewDidLoad() {
        super.viewDidLoad()
//        let searchVC = SearchResultTableViewController()
//        
//        searchController = UISearchController(searchResultsController: searchVC)
//        searchController.dimsBackgroundDuringPresentation = true
//        searchController.hidesNavigationBarDuringPresentation = true
//        searchController.searchResultsUpdater = self
//        let searchBar = UISearchBar()
//        searchBar.frame = searchController.searchBar.frame
//        
//        tableView.tableHeaderView = searchController.searchBar
        
        
        
        getData()
        
        

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    func getData() -> Void {
        Alamofire.request(ServerInfo.getNewsUrl(index: index), method: .get, parameters: nil).responseJSON{
            response in
            switch response.result{
                
            case .success(_):
                let json = JSON(response.result.value ?? "")
                var jsonArray = json.arrayValue
                for i in 0..<jsonArray.count{
                    var news = News()
                    let jsonObj = jsonArray[i]
                    news.mTitle = jsonObj["title"].stringValue
                    news.date = jsonObj["date"].stringValue
                    news.source = jsonObj["block"].stringValue
                    news.originUrl = jsonObj["url"].stringValue
                    news.url = ServerInfo.getNewsUrl(index: self.index, id: i)
                    self.newsList.append(news)
                }
                self.tableView.reloadData()
                
            case .failure(_):
                print("failed")
            }
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
        return newsList.count
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let newsViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "NewsViewController") as! NewsViewController
        
        let news = newsList[indexPath.row]
        newsViewController.news = news
        newsViewController.navigationItem.title = "新闻详情"
        newsViewController.navigationItem.leftBarButtonItem?.title = "返回"
        self.parent?.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(newsViewController, animated: false)
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "informationCell", for: indexPath) as! InformationCell
        let new = newsList[indexPath.row]
        cell.title.text = new.mTitle
        cell.source.text = new.source
        cell.time.text = new.date
        
        // Configure the cell...

        return cell
    }
//    @IBAction func cancelToPlayerViewController(segue:UIStoryboardSegue){
//
//    }
//    @IBAction func savePlayerDetail(segue:UIStoryboardSegue){
//        if let playerDetailsViewController = segue.sourceViewController as
//            <#code#>
//        }
//    }


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
