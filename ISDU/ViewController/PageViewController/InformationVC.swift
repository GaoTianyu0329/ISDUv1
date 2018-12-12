//
//  InformationVC.swift
//  iSDU
//
//  Created by 学生在线 on 2018/7/19.
//  Copyright © 2018年 学生在线. All rights reserved.
//

import UIKit

class InformationVC: UIViewController,UISearchResultsUpdating,UISearchControllerDelegate {
    func updateSearchResults(for searchController: UISearchController) {
        
    }
    let searchController = UISearchController(searchResultsController: nil)
    @IBOutlet var searchBar: UISearchBar!
    let NavH:CGFloat = UIScreen.main.bounds.height >= 812 ? 84 : 64
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchController.dimsBackgroundDuringPresentation = true
        searchController.hidesNavigationBarDuringPresentation = false
        
//        searchBar.backgroundImage(for: .any, barMetrics: .default)
        let leftNavBarButton = UIBarButtonItem(customView:searchController.searchBar)
        leftNavBarButton.width = 200
        self.navigationItem.leftBarButtonItem = leftNavBarButton
        /// 标题
        
        let titles = ["学生在线","本科生院", "青春山大", "山大视点"]
        //样式
        let style = YCTitleStyle()
        //可以滚动
        style.isScrollEnable = false
        
        // 所以的子控制器
        var childVcs = [UIViewController]()
        let childVc1 = UIStoryboard(name: "PageView", bundle: nil).instantiateViewController(withIdentifier: "tableVC2_1") as! TableVC2
        childVc1.index = 0
        childVcs.append(childVc1)
//        childVc1.         //设置请求地址
        let childVc2 = UIStoryboard(name: "PageView", bundle: nil).instantiateViewController(withIdentifier: "tableVC2_1") as! TableVC2
        childVc2.index = 1
        childVcs.append(childVc2)
             //        childVc2.         //设置请求地址
        let childVc3 = UIStoryboard(name: "PageView", bundle: nil).instantiateViewController(withIdentifier: "tableVC2_1") as! TableVC2
        childVc3.index = 2
        childVcs.append(childVc3)
             //        childVc2.         //设置请求地址
        let childVc4 = UIStoryboard(name: "PageView", bundle: nil).instantiateViewController(withIdentifier: "tableVC2_1") as! TableVC2
        childVc4.index = 3
        childVcs.append(childVc4)
        //        childVc4.         //设置请求地址
   
        
       
        
        // pageView的frame
        let pageFrame = CGRect(x: 0, y: NavH, width: view.bounds.width, height: view.bounds.height - NavH)
        
        // 创建YCPageView,并且添加到控制器的view中
        let pageView = YCPageView(frame: pageFrame, titles: titles, childVcs: childVcs, parentVc: self, style : style)
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
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    func initVC(){
        
    }

}
