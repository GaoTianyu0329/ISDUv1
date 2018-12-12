//
//  MyCenterViewController.swift
//  iSDU
//
//  Created by 高天宇 on 2018/11/8.
//  Copyright © 2018 学生在线. All rights reserved.
//

import UIKit

class MyCenterViewController: UIViewController {

    @IBOutlet weak var profileArea: UIView!//配置区域
    @IBOutlet weak var icon: UIImageView!//头像
    @IBOutlet weak var nickName: UILabel!//昵称
    @IBOutlet var functions: [UIView]!//功能
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        icon.layer.cornerRadius = icon.frame.width/2
        icon.layer.masksToBounds = true
        addViewClick()
        
        

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
//        self.parent?.navigationItem.title = "个人中心"
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    func addViewClick() -> Void {
        
        let clickProfile = UITapGestureRecognizer(target: self, action: #selector(profOnClick))
        profileArea.addGestureRecognizer(clickProfile)
        let onClick0 = UITapGestureRecognizer(target: self, action: #selector(firstOnClick))
        functions[0].addGestureRecognizer(onClick0)
        let onClick1 = UITapGestureRecognizer(target: self, action: #selector(secondOnClick))
        functions[1].addGestureRecognizer(onClick1)
        let onClick2 = UITapGestureRecognizer(target: self, action: #selector(thirdOnClick))
        functions[2].addGestureRecognizer(onClick2)
        let onClick3 = UITapGestureRecognizer(target: self, action: #selector(fourthOnClick))
        functions[3].addGestureRecognizer(onClick3)
        let onClick4 = UITapGestureRecognizer(target: self, action: #selector(fifthOnClick))
        functions[4].addGestureRecognizer(onClick4)
        let onClick5 = UITapGestureRecognizer(target: self, action: #selector(sixthOnClick))
        functions[5].addGestureRecognizer(onClick5)
        let onClick6 = UITapGestureRecognizer(target: self, action: #selector(seventhOnClick))
        functions[6].addGestureRecognizer(onClick6)
        let onClick7 = UITapGestureRecognizer(target: self, action: #selector(eighthOnClick))
        functions[7].addGestureRecognizer(onClick7)
        
        
    }
    @objc func profOnClick() -> Void{
        print("头像昵称")
    }
    @objc func firstOnClick() -> Void {
        print("课程")
    }
    @objc func secondOnClick() -> Void {
        print("图书馆")

    }
    @objc func thirdOnClick() -> Void {
        print("校车")

    }
    @objc func fourthOnClick() -> Void {
        print("校历")

    }
    @objc func fifthOnClick() -> Void {
        print("考试安排")

    }
    @objc func sixthOnClick() -> Void {
        print("自习室")

    }
    @objc func seventhOnClick() -> Void {
        print("成绩查询")

    }
    @objc func eighthOnClick() -> Void {
        print("云盘")

    }

}
