//
//  libraryVC1.swift
//  iSDU
//
//  Created by durian Z on 2018/11/23.
//  Copyright © 2018 学生在线. All rights reserved.
//

import UIKit

class libraryVC1: UIViewController,UISearchResultsUpdating,UISearchControllerDelegate {
    func updateSearchResults(for searchController: UISearchController) {
        
    }
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    let NavH:CGFloat = UIScreen.main.bounds.height >= 812 ? 84 : 64
    var index = 0
    var SearchController:UISearchController!
    var bookList:[Book] = Array()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        SearchController.dimsBackgroundDuringPresentation = true
//        SearchController.hidesNavigationBarDuringPresentation = false
        
        
//        let leftNavBarButton = UIBarButtonItem(customView:SearchController.searchBar)
//        leftNavBarButton.width = 200
//        self.navigationItem.leftBarButtonItem = leftNavBarButton
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
