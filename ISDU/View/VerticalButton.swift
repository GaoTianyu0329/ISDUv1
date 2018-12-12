//
//  YWButton.swift
//  iSDU
//
//  Created by 高天宇 on 2018/11/25.
//  Copyright © 2018 学生在线. All rights reserved.
//  图片在上文字在下的标题

import UIKit

class VerticalButton: UIButton {
   
    
//    required init?(coder aDecoder: NSCoder) {
//
////        fatalError("init(coder:) has not been implemented")
//    }
//
    //设置按钮的基本属性
    func commonInit() {
        self.titleLabel?.textAlignment = .center
        self.imageView?.contentMode = .scaleAspectFit
        self.titleLabel?.font = UIFont.systemFont(ofSize: 12)
    }
    
    //调整系统UIButton的文字的位置
    override func titleRect(forContentRect contentRect: CGRect) -> CGRect {
        let titleX = 0
        let titleY = contentRect.size.height * 0.3
        let titleW = contentRect.size.width
        let titleH = contentRect.size.height - titleY
        
        return CGRect(x: 0, y: titleY, width: titleW, height: titleH)
    }
    
    //调整系统UIButton的图片的位置
    override func imageRect(forContentRect contentRect: CGRect) -> CGRect {
        let imageW = contentRect.width
        let imageH = contentRect.size.height * 0.4
        return CGRect(x: 0, y: 5, width: imageW, height: imageH)
    }
   
   
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        self.titleLabel?.textAlignment = .center
        self.imageView?.contentMode = .scaleAspectFit
        // Drawing code
    }
    

}
