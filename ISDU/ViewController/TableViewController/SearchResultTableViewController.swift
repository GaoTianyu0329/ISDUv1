//
//  SearchResultTableViewController.swift
//  iSDU
//
//  Created by 高天宇 on 2018/11/10.
//  Copyright © 2018 学生在线. All rights reserved.
//

import UIKit

class SearchResultTableViewController: UISearchController,UISearchResultsUpdating,UISearchControllerDelegate {
    func updateSearchResults(for searchController: UISearchController) {
    
    }
    
    var searchController = UISearchController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //
                searchController.dimsBackgroundDuringPresentation = true
                searchController.hidesNavigationBarDuringPresentation = true
                searchController.searchResultsUpdater = self
        navigationItem.searchController = searchController
        
        
        
        //        tableView.tableHeaderView = searchController.searchBar
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
