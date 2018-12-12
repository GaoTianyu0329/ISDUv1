//
//  DemoViewController.swift
//  iSDU
//
//  Created by 学生在线 on 2018/7/19.
//  Copyright © 2018年 学生在线. All rights reserved.
//

import UIKit

class MainPageVC: UIViewController,UISearchResultsUpdating{
    func updateSearchResults(for searchController: UISearchController) {
        
    }
    
   
    @IBOutlet var seachBar: UISearchBar!
    var searchController:UISearchController!
    
    let NavH:CGFloat = UIScreen.main.bounds.height >= 812 ? 84 : 64
    override func viewDidLoad() {
        
        super.viewDidLoad()
//        let searchVC = SearchResultTableViewController()
//        
//        searchController = UISearchController(searchResultsController: searchVC)
//        searchController.dimsBackgroundDuringPresentation = false
//        searchController.hidesNavigationBarDuringPresentation = false
//        searchController.searchResultsUpdater = self
//        // let leftNavBarButton = UIBarButtonItem(customView: searchController.searchBar)
//        self.parent?.navigationItem.searchController = searchController
//        definesPresentationContext = true
  //      seachBar.backgroundImage(for: .any, barMetrics: .default)
  //      let leftNavBarButton = UIBarButtonItem(customView:seachBar)
  //      self.navigationItem.leftBarButtonItem = leftNavBarButton
        /// 标题
        let titles = ["实时","推荐","精品"]
        //样式
        let style = YCTitleStyle()
        //可以滚动
        style.isScrollEnable = false
        
        // 所以的子控制器
        var childVcs = [UIViewController]()
        for i in 0..<titles.count {
            let vc = UIStoryboard(name: "PageView", bundle: nil).instantiateViewController(withIdentifier: "tableVC1") as! TableVC1
            vc.index = i
            childVcs.append(vc)
        }
        
        // pageView的frame
        let pageFrame = CGRect(x: 0, y: NavH, width: view.bounds.width, height: view.bounds.height - 64)
        
        // 创建YCPageView,并且添加到控制器的view中
        let pageView = YCPageView(frame: pageFrame, titles: titles, childVcs: childVcs, parentVc: self, style : style)
        view.addSubview(pageView)
    }
    override func viewDidAppear(_ animated: Bool) {
//        self.parent?.navigationItem.title = "主页"

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
