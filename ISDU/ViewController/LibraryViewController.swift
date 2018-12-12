//
//  LibraryViewController.swift
//  iSDU
//
//  Created by durian Z on 2018/11/22.
//  Copyright © 2018 学生在线. All rights reserved.
//

import UIKit

class LibraryViewController: UIViewController{



        // Do any additional setup after loading the view.
        
            //func updateSearchResults(for searchController: UISearchController) {
                
            //}
            //let searchController = UISearchController(searchResultsController: nil)
            //@IBOutlet var searchBar: UISearchBar!
            let NavH:CGFloat = UIScreen.main.bounds.height >= 812 ? 84 : 64
            
            override func viewDidLoad() {
                super.viewDidLoad()
                
//                searchController.dimsBackgroundDuringPresentation = true
//                searchController.hidesNavigationBarDuringPresentation = false
                
                //        searchBar.backgroundImage(for: .any, barMetrics: .default)
//        let leftNavBarButton = UIBarButtonItem(customView:searchController.searchBar)
//        leftNavBarButton.width = 200
//        self.navigationItem.leftBarButtonItem = leftNavBarButton
        let title = ["馆藏查询","余座查询"]
        //样式
        let style = YCTitleStyle()
        //可以滚动
        style.isScrollEnable = false
                //self.tabBarController?.viewControllers
                var childVc = [UIViewController]()
                
//                func setViewControllers(_ viewControllers: [UIViewController]?, animated: Bool){
                let childVc1 = UIStoryboard(name: "PageView", bundle: nil).instantiateViewController(withIdentifier: "libraryVC_1") as! libraryVC1
                childVc1.index = 0
                childVc.append(childVc1)
                        //childVc1.         //设置请求地址
                let childVc2 = UIStoryboard(name: "PageView", bundle: nil).instantiateViewController(withIdentifier: "libraryVC_2") as! libraryVC2
                childVc2.index = 1
                childVc.append(childVc2)
                        //childVc2.         //设置请求地址
               
//                }
                
                
                // pageView的frame
                let pageFrame = CGRect(x: 0, y: NavH, width: view.bounds.width, height: view.bounds.height - NavH)
                
                // 创建YCPageView,并且添加到控制器的view中
                let pageView = YCPageView(frame: pageFrame, titles: title, childVcs: childVc, parentVc: self, style : style)
                view.addSubview(pageView)
                
    
    // Do any additional setup after loading the view.
}

    override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
}
override func viewDidAppear(_ animated: Bool) {
    //        self.parent?.navigationItem.title = "资讯"
    
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
