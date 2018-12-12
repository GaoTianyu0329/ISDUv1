//
//  FirstNavigationController.swift
//  iSDU
//
//  Created by 高天宇 on 2018/11/5.
//  Copyright © 2018 学生在线. All rights reserved.
//

import UIKit

class FirstNavigationController: UINavigationController {
    //    let NavH:CGFloat = UIScreen.main.bounds.height >= 812 ? 84 : 64
    
    var searchController:UISearchController!

    override func viewDidLoad() {
//        let leftNavBarButton = UIBarButtonItem(customView:searchView)
        searchController = UISearchController(searchResultsController: nil)
        searchController.dimsBackgroundDuringPresentation = true
        searchController.hidesNavigationBarDuringPresentation = false
        navigationItem.searchController = searchController

        
        super.viewDidLoad()
        
        
//        let textFrame = self.navigationItem.titleView?.frame
//        self.navigationBar.isHidden = true
//        let textfield = UITextField()
//        textfield.bounds = CGRect(x: 0, y: 0, width: view.bounds.width, height: 44)
//        textfield.placeholder = "搜索"
//
//        let leftNavBarButton = UIBarButtonItem(customView:textfield)
//        leftNavBarButton.width = 200
//        self.navigationItem.leftBarButtonItem = leftNavBarButton

        // Do any additional setup after loading the view.
    }
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        
        self.parent?.parent?.parent?.hidesBottomBarWhenPushed = true
        super.pushViewController(viewController, animated: animated)
    }
    
//    override func dismiss(animated flag: Bool, completion: (() -> Void)? = nil) {
//        let vc = self.parent?.parent as! UITabBarController
//        vc.tabBar.isHidden = false
//    }
//    override func dismiss(animated flag: Bool, completion: (() -> Void)? = nil) {
//        self.parent?.parent?.parent?.hidesBottomBarWhenPushed = false
//    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
